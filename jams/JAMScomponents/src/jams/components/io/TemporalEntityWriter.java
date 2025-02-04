/*
 * StandardEntityWriter.java
 * Created on 15. Febuary 2006, 11:05
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

package jams.components.io;

import jams.data.*;
import jams.model.*;
import jams.io.*;

/**
 *
 * @author S. Kralisch
 */
@JAMSComponentDescription(
title="Entity file writer (temporal)",
        author="S. Kralisch",
        description="This component can be used to output one selected entity attribute " +
        "value for every time step. The resulting CSV formatted ASCII file will contain " +
        "one line per time step and one column per entity. This component must be wrapped " +
        "in a temporal, but not in a spatial context!"
        )
        public class TemporalEntityWriter extends JAMSComponent {
    
    /*
     *  Component variables
     */
    
    @JAMSVarDescription(
    access = JAMSVarDescription.AccessType.READ,
            description = "EntitySet"
            )
            public Attribute.EntityCollection entities;
    
    @JAMSVarDescription(
    access = JAMSVarDescription.AccessType.READ,
            description = "Current time"
            )
            public Attribute.Calendar time;
    
    @JAMSVarDescription(
    access = JAMSVarDescription.AccessType.READ,
            description = "Output file name"
            )
            public Attribute.String fileName;
    
    @JAMSVarDescription(
    access = JAMSVarDescription.AccessType.READ,
            description = "Output file attribute names"
            )
            public Attribute.String idAttributeName;
    
    @JAMSVarDescription(
    access = JAMSVarDescription.AccessType.READ,
            description = "Output file attribute names"
            )
            public Attribute.String dataAttributeName;
    
    private GenericDataWriter writer;
    
    /*
     *  Component runstages
     */
    
    public void init() {
        writer = new GenericDataWriter(getModel().getWorkspaceDirectory().getPath()+"/"+fileName.getValue());
        writer.addComment("JAMS entity output from TemporalEntityWriter");
        writer.addComment("Attribute name: " + dataAttributeName);
        writer.addComment("");
        
        //always write time
        writer.addColumn("date/time");
        
        for (Attribute.Entity e : entities.getEntityArray()) {
            writer.addColumn("HRU_"+(int)e.getDouble(idAttributeName.getValue()));
        }
        
        writer.writeHeader();
    }
    
    public void run() {
        
        //always write time
        //the time also knows a toString() method with additional formatting parameters
        //e.g. time.toString("%1$tY-%1$tm-%1$td %1$tH:%1$tM")
        writer.addData(time);
        
        for (Attribute.Entity e : entities.getEntityArray()) {
            writer.addData(e.getObject(this.dataAttributeName.getValue()).toString());
        }
        
        try {
            writer.writeData();
        } catch (jams.runtime.RuntimeException jre) {
            getModel().getRuntime().handle(jre);
        }
    }
    
    public void cleanup() {
        writer.close();
    }
}
