/*
 * DataReader.java
 * Created on 30. September 2005, 11:37
 *
 * This file is part of JAMS
 * Copyright (C) 2005 S. Kralisch and P. Krause
 *
 * This program is free software; you can redistribute it and/or
 * modify it under the terms of the GNU General Public License
 * as published by the Free Software Foundation; either version 2
 * of the License, or (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program; if not, write to the Free Software
 * Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301, USA
 *
 */
package hymod;

import jams.data.Attribute;
import jams.data.JAMSCalendar;
import jams.data.JAMSDouble;
import jams.data.JAMSString;
import jams.data.JAMSTimeInterval;
import jams.io.GenericDataReader;
import jams.io.JAMSTableDataArray;
import jams.io.JAMSTableDataConverter;
import jams.io.JAMSTableDataStore;
import jams.model.JAMSComponent;
import jams.model.JAMSComponentDescription;
import jams.model.JAMSVarDescription;
import java.io.*;
import java.util.*;

/**
 *
 * @author P. Krause
 */
@JAMSComponentDescription(
title = "hymod.DataReader",
author = "Peter Krause",
description = "Component which reads HYMOD specific data files. Such files "
+ "should contain columns with date, precip, potential ET and observed runoff "
+ "for each time step")
public class DataReader extends JAMSComponent {

    @JAMSVarDescription(
            access = JAMSVarDescription.AccessType.READ,
    description = "A full qualfied file name pointing to a hymod"
    + "compliant data file")
    public JAMSString fileName;
    @JAMSVarDescription(
            access = JAMSVarDescription.AccessType.WRITE,
    description = "Internal variable name for the precipitation value of"
    + "each time step")
    public JAMSDouble precip;
    
    @JAMSVarDescription(
            access = JAMSVarDescription.AccessType.WRITE,
    description = "Internal variable name for the potential ET value of"
    + "each time step")
    public JAMSDouble pet;
    
    @JAMSVarDescription(
            access = JAMSVarDescription.AccessType.WRITE,
    description = "Internal variable name for the observed runoff value of"
    + "each time step")
    public JAMSDouble obsRunoff;
    
    @JAMSVarDescription(
            access = JAMSVarDescription.AccessType.READ,
    description = "Time interval of current temporal context")
    public JAMSTimeInterval timeInterval;
    
    
    private JAMSTableDataStore store;
    public java.util.HashMap dataMap = new java.util.HashMap();
    private String[] md;
    private JAMSTableDataArray da;

    public void init() {

        try {
            //read start and end time of data set
            BufferedReader reader = new BufferedReader(new FileReader(new File(getModel().getWorkspaceDirectory(), fileName.getValue())));
            String line = reader.readLine();
            StringTokenizer strTok = new StringTokenizer(line, "\t");
            String desc = strTok.nextToken();
            String start = strTok.nextToken();
            Attribute.Calendar startTime = parseTime(start);

            line = reader.readLine();
            strTok = new StringTokenizer(line, "\t");
            desc = strTok.nextToken();
            String end = strTok.nextToken();
            Attribute.Calendar endTime = parseTime(end);

            //read column headings
            line = reader.readLine();
            strTok = new StringTokenizer(line, "\t");
            int cols = strTok.countTokens() - 1;
            md = new String[cols];

            //skip date
            strTok.nextToken();
            for (int i = 0; i < cols; i++) {
                md[i] = strTok.nextToken();
            }

            store = new GenericDataReader(new File(getModel().getWorkspaceDirectory(), fileName.getValue()).getAbsolutePath(), true, 1, 4);

            //check dates and move to the right position
            if (timeInterval != null) {
                //check if the time series start and end date match the temporal context's time interval
                if ((timeInterval.getStart().before(startTime) || timeInterval.getEnd().after(endTime))) {
                    getModel().getRuntime().sendHalt("TSData start and end time of " + this.fileName.getValue() + " do not match current temporal context!");
                }
                int timeUnit = timeInterval.getTimeUnit();
                Attribute.Calendar tiStart = timeInterval.getStart();
                Attribute.Calendar date = getModel().getRuntime().getDataFactory().createCalendar();
                date.set(tiStart.get(Calendar.YEAR), tiStart.get(Calendar.MONTH), tiStart.get(Calendar.DAY_OF_MONTH), startTime.get(Calendar.HOUR_OF_DAY), startTime.get(Calendar.MINUTE), startTime.get(Calendar.SECOND));

                while (startTime.before(date) && store.hasNext()) {
                    da = store.getNext();
                    if (timeUnit == Attribute.Calendar.DAY_OF_YEAR) {
                        startTime.add(Attribute.Calendar.DATE, 1);
                    } else if (timeUnit == Attribute.Calendar.HOUR_OF_DAY) {
                        startTime.add(Attribute.Calendar.HOUR_OF_DAY, 1);
                    } else if (timeUnit == Attribute.Calendar.MONTH) {
                        startTime.add(Attribute.Calendar.MONTH, 1);
                    }
                }
            }
        } catch (IOException ioe) {
            getModel().getRuntime().handle(ioe);
        }
    }

    @SuppressWarnings("unchecked")
    @Override
    public void run() {

        JAMSTableDataArray da = store.getNext();
        double[] vals = JAMSTableDataConverter.toDouble(da);
        //this.data.setValue(vals);

        for (int i = 0; i < md.length; i++) {
            dataMap.put(md[i], vals[i]);
        }

        this.precip.setValue(((Double) dataMap.get("precip")).doubleValue());
        this.pet.setValue(((Double) dataMap.get("pet")).doubleValue());
        this.obsRunoff.setValue(((Double) dataMap.get("runoff")).doubleValue());
    }

    @Override
    public void cleanup() {
        store.close();
    }

    private Attribute.Calendar parseTime(String timeString) {

        //Array keeping values for year, month, day
        String[] timeArray = new String[3];
        timeArray[0] = "1";
        timeArray[1] = "1";
        timeArray[2] = "0";

        StringTokenizer st = new StringTokenizer(timeString, ".-/ :");
        int n = st.countTokens();

        for (int i = 0; i < n; i++) {
            timeArray[i] = st.nextToken();
        }

        Attribute.Calendar cal = new JAMSCalendar();
        cal.setValue(timeArray[2] + "-" + timeArray[1] + "-" + timeArray[0]);
        return cal;
    }
}
