/*
 * InitSoilWaterStates.java
 * Created on 25. November 2005, 13:21
 *
 * This file is part of JAMS
 * Copyright (C) 2005 FSU Jena, c0krpe
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
package org.unijena.j2k.regionalisation;


import jams.data.*;
import jams.model.*;
import java.util.Calendar;

/**
 *
 * @author Peter Krause
 */
@JAMSComponentDescription(title = "TemperatureLapseRate",
author = "Santosh Nepal, Peter Krause",
description = "Regionalisation of Temp through general adiabatic rate"
+ "depends upon given adaiabatic rate +++ included seasonal lapse rate")
public class TemperatureLapseRate1 extends JAMSComponent {

    /*
     *  Component variables
     */
    @JAMSVarDescription(
            access = JAMSVarDescription.AccessType.READ,
            description = "station elevation")
    public Attribute.DoubleArray statElev;
    
    @JAMSVarDescription(
            access = JAMSVarDescription.AccessType.READ,
            description = "entity elevation")
    public Attribute.Double entityElev;
    
    @JAMSVarDescription(
            access = JAMSVarDescription.AccessType.READ,
            description = "the measured input from a base station")
    public Attribute.DoubleArray inputValue;
    
    @JAMSVarDescription(
            access = JAMSVarDescription.AccessType.WRITE,
            description = "calculated output for the modelling entity")
    public Attribute.Double outputValue;
    
    @JAMSVarDescription(
            access = JAMSVarDescription.AccessType.READ,
            description = "lapse rate per 100 m elevation difference")
    public Attribute.Double lapseRateSummer;
    
    @JAMSVarDescription(
            access = JAMSVarDescription.AccessType.READ,
            description = "lapse rate per 100 m elevation difference")
    public Attribute.Double lapseRateWinter;
    
    @JAMSVarDescription(
            access = JAMSVarDescription.AccessType.READ,
            description = "The current model time")
    public Attribute.Calendar time;
    
    @JAMSVarDescription(
            access = JAMSVarDescription.AccessType.READ,
            description = "position array to determine best weights")
    public Attribute.IntegerArray statOrder;
    
    /*
     *  Component run stages
     */
    public void run() {
        
        int closestStation = statOrder.getValue()[0];
        //elevation difference
        double elevationdiff = (statElev.getValue()[closestStation] - entityElev.getValue());
        //temp calculation

        // int nowmonth = (time.get(time.MONTH) + 1 );
        int nowmonth = time.get(Calendar.MONTH);

        if ((nowmonth >= 5) && (nowmonth <= 8)) {
            outputValue.setValue(elevationdiff * (lapseRateSummer.getValue() / 100.) + inputValue.getValue()[closestStation]);
        } else {
            outputValue.setValue(elevationdiff * (lapseRateWinter.getValue() / 100.) + inputValue.getValue()[closestStation]);
        }
    }

}
