/*
 * TemporalSumAggregator.java
 * Created on 19. Juli 2006, 11:57
 *
 * This file is part of JAMS
 * Copyright (C) 2005 FSU Jena
 *
 * This program is free software; you can redistribute it and/or
 * modify it under the terms of the GNU Lesser General Public License
 * as published by the Free Software Foundation; either version 3
 * of the License, or (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU Lesser General Public License for more details.
 *
 * You should have received a copy of the GNU Lesser General Public License
 * along with this program; if not, see <http://www.gnu.org/licenses/>.
 *
 */
package jams.components.aggregate;

import jams.data.*;
import jams.model.JAMSComponent;
import jams.model.JAMSComponentDescription;
import jams.model.JAMSVarDescription;
import jams.model.VersionComments;
import java.util.Calendar;

/**
 *
 * @author S. Kralisch
 */
@JAMSComponentDescription(
        author = "Sven Kralisch",
        description = "Component for the weighted aggregation of time-variant data over a time interval",
        version = "1.1",
        date = "2016-05-12")
@VersionComments(entries = {
    @VersionComments.Entry(version = "1.0", date = "2006-07-19", comment = "initial version"),
    @VersionComments.Entry(version = "1.1", date = "2016-05-12", comment = "fixed month filter function and changed usage of month values (1==January, 2==February, ...)")
})
public class TemporalSumAggregator extends JAMSComponent {

    @JAMSVarDescription(access = JAMSVarDescription.AccessType.READ,
            description = "Current time")
    public Attribute.Calendar time;

    @JAMSVarDescription(access = JAMSVarDescription.AccessType.READ,
            description = "The value(s) to be aggregated")
    public Attribute.Double[] value;

    @JAMSVarDescription(access = JAMSVarDescription.AccessType.READ,
            description = "A weight to be used to calculate the weighted aggregate",
            defaultValue = "1")
    public Attribute.Double weight;

    @JAMSVarDescription(access = JAMSVarDescription.AccessType.READWRITE,
            description = "The resulting weighted aggregate(s) of the given values")
    public Attribute.Double[] sum;

    @JAMSVarDescription(access = JAMSVarDescription.AccessType.READ,
            description = "A time interval defining start and end of the weighted temporal aggregation")
    public Attribute.TimeInterval[] aggregationTimeInterval;

    @JAMSVarDescription(access = JAMSVarDescription.AccessType.READ,
            description = "If months are listed, aggregation will be performed only during the listed months")
    public Attribute.Integer[] months;

    @JAMSVarDescription(access = JAMSVarDescription.AccessType.READ,
            description = "Calculate the average value? If average is false, the sum will be calculated.",
            defaultValue = "true")
    public Attribute.Boolean average;

    private long count;

    public void init() {
        for (int i = 0; i < value.length; i++) {
            sum[i].setValue(0);
        }

        Attribute.Calendar start = null, end = null;

        for (Attribute.TimeInterval I : aggregationTimeInterval) {
            if (start == null) {
                start = I.getStart().clone();
            } else if (start.after(I.getStart())) {
                start = I.getStart().clone();
            }

            if (end == null) {
                end = I.getEnd().clone();
            } else if (end.before(I.getEnd())) {
                end = I.getEnd().clone();
            }
        }

        count = 0;
        if (average.getValue()) {
            //count = aggregationTimeInterval.getNumberOfTimesteps();
            while (!start.after(end)) {
                boolean isIn = false;
                for (Attribute.TimeInterval t : aggregationTimeInterval) {
                    if (!start.before(t.getStart()) && !start.after(t.getEnd())) {
                        isIn = true;
                        break;
                    }
                }

                if (months != null) {
                    boolean isInMonth = false;
                    int month = start.get(Calendar.MONTH);
                    for (int i = 0; i < this.months.length; i++) {
                        if (months[i].getValue()-1 == month) {
                            isInMonth = true;
                            break;
                        }
                    }

                    if (!isInMonth) {
                        isIn = false;
                    }
                }

                if (isIn) {
                    count++;
                }

                start.add(aggregationTimeInterval[0].getTimeUnit(), aggregationTimeInterval[0].getTimeUnitCount());

            }
        } else {
            count = 1;
        }
    }

    public void run() {
        boolean isIn = false;
        for (Attribute.TimeInterval t : aggregationTimeInterval) {
            if (!time.before(t.getStart()) && !time.after(t.getEnd())) {
                isIn = true;
                break;
            }
        }

        if (months != null) {
            boolean isInMonth = false;
            int month = time.get(Calendar.MONTH);
            for (int i = 0; i < this.months.length; i++) {
                if (months[i].getValue()-1 == month) {
                    isInMonth = true;
                    break;
                }
            }

            if (!isInMonth) {
                isIn = false;
            }
        }

        if (isIn) {
            for (int i = 0; i < value.length; i++) {
                sum[i].setValue(sum[i].getValue() + (value[i].getValue() / (weight.getValue() * count)));
            }
        }

    }
}
