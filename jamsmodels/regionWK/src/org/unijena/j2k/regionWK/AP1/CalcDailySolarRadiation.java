/*
 * CalcDailySolarRadiation.java
 * Created on 24. November 2005, 12:50
 *
 * This file is part of JAMS
 * Copyright (C) 2005 FSU Jena, c0krpe
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

/*

 */
package org.unijena.j2k.regionWK.AP1;

import java.io.*;
//import jams.JAMSTools;
import jams.data.*;
import jams.model.*;

/**
 *
 * @author c0krpe
 */
@JAMSComponentDescription(title = "Title",
author = "Author",
description = "Description")
public class CalcDailySolarRadiation extends JAMSComponent {

    /*
     *  Component variables
     */
    @JAMSVarDescription(access = JAMSVarDescription.AccessType.READ,
    description = "time")
    public Attribute.Calendar time;

    @JAMSVarDescription(access = JAMSVarDescription.AccessType.READ,
    description = "state variable sunshine hours [h/d]")
    public Attribute.Double sunh;

    @JAMSVarDescription(access = JAMSVarDescription.AccessType.WRITE,
    description = "Maximum sunshine duration in h",
    defaultValue = "0")
    public Attribute.Double sunhmax;

    @JAMSVarDescription(access = JAMSVarDescription.AccessType.READ,
    description = "state variable slope aspect correction factor")
    public Attribute.Double actSlAsCf;

    @JAMSVarDescription(access = JAMSVarDescription.AccessType.READ,
    description = "attribute latitude [deg]")
    public Attribute.Double latitude;

    @JAMSVarDescription(access = JAMSVarDescription.AccessType.READ,
    description = "daily extraterrestic radiation [MJ/m�d]")
    public Attribute.Double actExtRad;

    @JAMSVarDescription(access = JAMSVarDescription.AccessType.WRITE,
    description = "daily solar radiation [MJ/m�d]")
    public Attribute.Double solRad;

    @JAMSVarDescription(access = JAMSVarDescription.AccessType.READ,
    description = "Angstrom factor a")
    public Attribute.Double angstrom_a;

    @JAMSVarDescription(access = JAMSVarDescription.AccessType.READ,
    description = "Angstrom factor b")
    public Attribute.Double angstrom_b;

    @JAMSVarDescription(access = JAMSVarDescription.AccessType.READ,
    description = "temporal resolution [d | h | m]")
    public Attribute.String tempRes;
 

    int[] monthMean = {15, 45, 74, 105, 135, 166, 196, 227, 258, 288, 319, 349};
    /*
     *  Component run stages
     */

    public void init() throws Attribute.Entity.NoSuchAttributeException, IOException {
        
    }

    public void run() throws Attribute.Entity.NoSuchAttributeException, IOException {

       
            int julDay = time.get(time.DAY_OF_YEAR);
            int month = time.get(time.MONTH);
            double SAC = actSlAsCf.getValue();
            double lati = latitude.getValue();
            double sunsh = sunh.getValue();
            double extraterrRadiation = this.actExtRad.getValue();
            double declination = 0;
            if (this.tempRes == null) {
                declination = org.unijena.j2k.physicalCalculations.SolarRadiationCalculationMethods.calc_SunDeclination(julDay);
            } else if (this.tempRes.getValue().equals("d")) {
                declination = org.unijena.j2k.physicalCalculations.SolarRadiationCalculationMethods.calc_SunDeclination(julDay);
            } else if (this.tempRes.getValue().equals("m")) {
                declination = org.unijena.j2k.physicalCalculations.SolarRadiationCalculationMethods.calc_SunDeclination(this.monthMean[month]);
            }
            double latRad = org.unijena.j2k.mathematicalCalculations.MathematicalCalculations.deg2rad(lati);
            double sunsetHourAngle = org.unijena.j2k.physicalCalculations.DailySolarRadiationCalculationMethods.calc_SunsetHourAngle(latRad, declination);
            double maximumSunshine = org.unijena.j2k.physicalCalculations.DailySolarRadiationCalculationMethods.calc_maximumSunshineHours(sunsetHourAngle);
            sunhmax.setValue(maximumSunshine);
            double solarRadiation = org.unijena.j2k.physicalCalculations.SolarRadiationCalculationMethods.calc_SolarRadiation(sunsh, maximumSunshine, extraterrRadiation, angstrom_a.getValue(), angstrom_b.getValue());
            //considering slope and aspect
            solarRadiation = solarRadiation * SAC;

            solRad.setValue(solarRadiation);

            
        
    }

    public void cleanup() throws IOException {
        
    }
}
