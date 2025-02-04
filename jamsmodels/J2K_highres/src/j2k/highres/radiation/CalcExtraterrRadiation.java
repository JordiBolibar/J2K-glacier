/*
 * CalcExtraterrRadiation.java
 * Created on 24. November 2005, 11:46
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
package j2k.highres.radiation;

import jams.data.*;
import jams.model.*;

/**
 *
 * @author Peter Krause
 */
@JAMSComponentDescription(
        title = "CalcExtraterrRadiation",
        author = "Peter Krause",
        description = "Calculates the extraterrestial incoming radiation for a"
        + "a standard year (i.e. 366 days or 8784 hours). The calculation is done"
        + "for the geographical location defined by latitude and longitude."
        + "The module can be used in hourly, daily and monthly resolution.",
        version = "1.0_0",
        date = "2011-05-30"
)
public class CalcExtraterrRadiation extends JAMSComponent {

    /*
     *  Component variables
     */
    @JAMSVarDescription(
            access = JAMSVarDescription.AccessType.READ,
            description = "entity latidute [deg]",
            unit = "degree",
            lowerBound = 0,
            upperBound = 90
    )
    public Attribute.Double latitude;

    @JAMSVarDescription(
            access = JAMSVarDescription.AccessType.READ,
            description = "entity longitude [deg]",
            unit = "degree",
            lowerBound = 0,
            upperBound = 180
    )
    public Attribute.Double longitude;

    @JAMSVarDescription(
            access = JAMSVarDescription.AccessType.READ,
            description = "longitude of time zone [deg]",
            unit = "degree",
            lowerBound = 0,
            upperBound = 180,
            defaultValue = "-15"
    )
    public Attribute.Double longTZ;

    @JAMSVarDescription(
            access = JAMSVarDescription.AccessType.READ,
            description = "Temporal resoultion in number of minutes (must be integer divisor of 60)",
            defaultValue = "60"
    )
    public Attribute.Integer tempRes;

    @JAMSVarDescription(
            access = JAMSVarDescription.AccessType.READ,
            description = "location from Greenwich [w | e]"
    )
    public Attribute.String locGrw;

    @JAMSVarDescription(
            access = JAMSVarDescription.AccessType.WRITE,
            description = "extraterrestric radiation of each time step of the year [MJ/m² timeUnit]",
            unit = "MJ / m^2 timeUnit",
            lowerBound = 0
    //upperBound = 10000000
    )
    public Attribute.DoubleArray extRadArray;

    int[] monthMean = {15, 45, 74, 105, 135, 166, 196, 227, 258, 288, 319, 349};

    /*
     *  Component run stages
     */
    public void init() {

    }

    public void run() throws Attribute.Entity.NoSuchAttributeException {
        double[] extRadiation = null;
        double segments = 60/tempRes.getValue();

        extRadiation = new double[366 * 24];

        double lati = this.latitude.getValue();
        double longi = this.longitude.getValue();
        double longiTZ = this.longTZ.getValue();

        if (this.locGrw.getValue().equals("e")) {
            longi = 360 - longi;
            longiTZ = 360 - longiTZ;
        }

        double latRad = org.unijena.j2k.mathematicalCalculations.MathematicalCalculations.deg2rad(lati);

        for (int i = 0; i < 366; i++) {
            int hour = 0;
            int julDay = i + 1;
            double declination = org.unijena.j2k.physicalCalculations.SolarRadiationCalculationMethods.calc_SunDeclination(julDay);
            double solarConstant = org.unijena.j2k.physicalCalculations.SolarRadiationCalculationMethods.calc_SolarConstant(julDay);
            double invRelDistEarthSun = org.unijena.j2k.physicalCalculations.SolarRadiationCalculationMethods.calc_InverseRelativeDistanceEarthSun(julDay);

            while (hour < 24) {
                double midTimeHourAngle = org.unijena.j2k.physicalCalculations.HourlySolarRadiationCalculationMethods.calc_midTimeHourAngle(hour, julDay, longi, longiTZ, false);
                double startTimeHourAngle = org.unijena.j2k.physicalCalculations.HourlySolarRadiationCalculationMethods.calc_startTimeHourAngle(midTimeHourAngle);
                double endTimeHourAngle = org.unijena.j2k.physicalCalculations.HourlySolarRadiationCalculationMethods.calc_endTimeHourAngle(midTimeHourAngle);
                int idx = i * 24 + hour;
                extRadiation[idx] = org.unijena.j2k.physicalCalculations.HourlySolarRadiationCalculationMethods.calc_HourlyExtraterrestrialRadiation(solarConstant, invRelDistEarthSun, startTimeHourAngle, endTimeHourAngle, latRad, declination);
                extRadiation[idx] /= segments;
                hour++;
            }
        }

        for (double r : extRadiation) {
            if (Double.isNaN(r)) {
                getModel().getRuntime().sendHalt("Found error in calculation of extraterrestric radiation, possibly due to wrong lat/long values.");
                return;
            }
        }

        this.extRadArray.setValue(extRadiation);
    }

    public void cleanup() {

    }
}
