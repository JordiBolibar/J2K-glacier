/*
 * J2KSNLMArable.java
 *
 * Created on 8. März 2006, 09:40
 *
 * This file is part of JAMS
 * Copyright (C) 2005 S. Kralisch and P. Krause
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
 * along with this program; if not, write to the Free Software
 * Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301, USA
 *
 */

package org.jams.j2k.s_n.crop;

import jams.model.*;
import java.util.*;
import java.io.*;
import org.jams.j2k.s_n.crop.J2KSNLMArable_gui;
import jams.data.JAMSCalendar;

/**
 *
 * @author Ulrike Bende-Michl
 */
public class J2KSNLMArable_gui {
    
    public J2KSNTillage till;
    public J2KSNFertilizer fert;
    public J2KSNCrop_gui crop;
    public int cid;
    public int year;
    public int jDay;
    public double famount;
    public boolean plant;
    public int harvest;
    public double fracHarvest;
/*
    public double startdate;
    public double enddate;
    public double mgtfertilization;
    public double mgttillage;
    public double endcroprot;
 */
    
    /**
     * Creates a new instance of LMArable
     */
    public J2KSNLMArable_gui(String[] vals, HashMap<Integer, J2KSNTillage> tills, HashMap<Integer, J2KSNFertilizer> ferts, HashMap<Integer, J2KSNCrop_gui> crops) {
        
        try {
            
            
            cid = Integer.parseInt(vals[1]);
            
            crop = crops.get(cid);
            
            jDay = Integer.parseInt(vals[2]);
            
            year = Integer.parseInt(vals[3]);
            
            if (vals[4].equalsIgnoreCase("-")) {
                till = null;
            } else {
                till = tills.get(Integer.parseInt(vals[4]));
            }
            
            if (vals[5].equalsIgnoreCase("-")) {
                fert = null;
            } else {
                fert = ferts.get(Integer.parseInt(vals[5]));
            }
            
            if (vals[6].equalsIgnoreCase("-")) {
                famount = -1;
            } else {
                famount = Double.parseDouble(vals[6]);
            }
            
            if (vals[7].equalsIgnoreCase("-")) {
                plant = false;
            } else {
                plant = true;
            }
            
            if (vals[8].equalsIgnoreCase("-")) {
                harvest = -1;
            } else {
                harvest = Integer.parseInt(vals[8]);
            }
            
            if (vals[9].equalsIgnoreCase("-")) {
                fracHarvest = -1;
            } else {
                fracHarvest = Double.parseDouble(vals[9]);
            }
            
            
        } catch (java.lang.NumberFormatException nfe) {
            System.out.println("Wrong management data format");
        }
    }
}

