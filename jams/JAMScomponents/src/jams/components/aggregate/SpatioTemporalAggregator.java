/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package jams.components.aggregate;

import jams.JAMS;
import jams.aggregators.Aggregator;
import jams.aggregators.BasicTemporalAggregator;
import jams.aggregators.DoubleIteratorAggregator;
import jams.aggregators.TemporalAggregator;
import jams.aggregators.TemporalAggregator.AggregationTimePeriod;
import jams.aggregators.TemporalAggregator.Consumer;
import jams.data.Attribute;
import jams.data.Attribute.Calendar;
import jams.model.JAMSComponentDescription;
import jams.model.JAMSVarDescription;
import java.util.Iterator;

/**
 *
 * @author christian
 */
@JAMSComponentDescription(
        title = "SpatioTemporalAggregator",
        author = "Christian Fischer",
        description = "Aggregates timeseries values to a given time period of day, month, year or dekade")

public class SpatioTemporalAggregator extends TemporalAggregatorBase {

    @JAMSVarDescription(access = JAMSVarDescription.AccessType.READ,
            description = "The be aggregated results")
    public Attribute.String[] outputAttributeNames;

    @JAMSVarDescription(access = JAMSVarDescription.AccessType.READ,
            description = "The value(s) to be aggregated")
    public Attribute.String[] inputAttributeNames;

    @JAMSVarDescription(access = JAMSVarDescription.AccessType.READ,
            description = "The value(s) to be aggregated",
            defaultValue = "")
    public Attribute.String weightAttribute;

    @JAMSVarDescription(access = JAMSVarDescription.AccessType.READ,
            description = "The value(s) to be aggregated")
    public Attribute.EntityCollection entities;

    int N = 0;
    TemporalAggregator<Iterable<Double>>[] aggregators;

    protected class DataConsumer implements Consumer<Iterable<Double>> {

        String outputAttributeName;

        DataConsumer(String outputAttributeName) {
            this.outputAttributeName = outputAttributeName;
        }

        @Override
        public void consume(Attribute.Calendar c, Iterable<Double> v) {
            if (aggregationTime != null) {
                aggregationTime.setValue(c);
            }
            Iterator<Double> iter = v.iterator();

            for (Attribute.Entity e : entities.getEntities()) {
                double d = iter.next();
                if (Double.isNaN(d)) {
                    e.setDouble(outputAttributeName, JAMS.getMissingDataValue());
                } else {
                    e.setDouble(outputAttributeName, d);
                }
            }
        }
    }

    protected class EntityIterable implements Iterable<Double> {

        String name;
        Attribute.EntityCollection entities;
        String wAttributeName;

        private class EntityIterator implements Iterator<Double> {

            Iterator<Attribute.Entity> iter = entities.getEntities().iterator();

            @Override
            public boolean hasNext() {
                return iter.hasNext();
            }

            @Override
            public Double next() {
                Attribute.Entity e = iter.next();
                double value = e.getDouble(name);
                double w = 1.0;
                if (value == JAMS.getMissingDataValue()) {
                    return Double.NaN;
                }
                if (!wAttributeName.isEmpty()) {
                    w = e.getDouble(wAttributeName);
                }

                return value / w;
            }

            @Override
            public void remove() {
                throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
            }

        }

        public EntityIterable(String name, String wAttributeName, Attribute.EntityCollection entities) {
            this.name = name;
            this.entities = entities;
            this.wAttributeName = wAttributeName;
        }

        @Override
        public Iterator<Double> iterator() {
            return new EntityIterator();
        }
    }
    
    @Override
    public void init() {
        super.init();
        aggregationTime.setTimeInMillis(JAMS.getMissingDataValue(Long.class));
        N = entities.getEntities().size();

        //create aggreagators
        aggregators = new TemporalAggregator[getNumberOfAttributes()];
        for (int i = 0; i < getNumberOfAttributes(); i++) {
            if (!isEnabled(i)) {
                continue;
            }

            Aggregator.AggregationMode innerMode = getAggregationModeID(i);
            AggregationTimePeriod innerTimeUnitID = getInnerTimeUnitID();
            jams.aggregators.TemporalAggregator<Iterable<Double>> aggregator = null;

            if (innerTimeUnitID.equals(AggregationTimePeriod.CUSTOM)) {
                aggregator = new BasicTemporalAggregator<Iterable<Double>>(
                        DoubleIteratorAggregator.create(innerMode, N),
                        innerTimeUnitID, customTimePeriods);
            } else {
                aggregator = new BasicTemporalAggregator<Iterable<Double>>(
                        DoubleIteratorAggregator.create(innerMode, N),
                        innerTimeUnitID);
            }                        
            aggregator.addConsumer(new DataConsumer(outputAttributeNames[i].getValue()));
            aggregator.init();
            aggregators[i] = aggregator;
        }
    }

    protected boolean isConsiderable(Calendar c) {
        return true;
    }

    protected void finish() {
        for (int i = 0; i < getNumberOfAttributes(); i++) {
            if (!isEnabled(i)) {
                continue;
            }
            aggregators[i].finish();
        }
        //do whatever is now necessary .. 
    }
    
    @Override
    public void run() {
        for (int i = 0; i < getNumberOfAttributes(); i++) {
            if (!isEnabled(i)) {
                continue;
            }

            TemporalAggregator aggregator = aggregators[i];

            if (isConsiderable(time)) {
                aggregator.aggregate(time, new EntityIterable( 
                        this.inputAttributeNames[i].getValue(),
                        weightAttribute.getValue(), entities));
            }
        }
        //recheck if this is the last timestep, if so output data        
        //avoid cloning calendars!!
        time.add(interval.getTimeUnit(), interval.getTimeUnitCount());
        boolean isLastTimeStep = time.after(interval.getEnd());
        if (isLastTimeStep) {
            finish();
        }
        time.add(interval.getTimeUnit(), -interval.getTimeUnitCount());
    }
}
