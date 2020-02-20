/*
 * PenmanMonteith.java
 * Created on 24. November 2005, 13:57
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
package org.unijena.j2k.regionWK.AP2;

import java.io.*;
import jams.tools.JAMSTools;
import jams.data.*;
import jams.model.*;

/**
 *
 * @author Peter Krause
 */
@JAMSComponentDescription(title = "CalcDailyETP_PenmanMonteith",
author = "Peter Krause",
description = "Calculates potential ETP according Penman-Monteith")
public class PenmanMonteith extends JAMSComponent {

    public final double CP = 1.031E-3;

    public final double RSS = 150;

    /*
     *  Component variables
     */
    @JAMSVarDescription(access = JAMSVarDescription.AccessType.READ,
    description = "Current time")
    public Attribute.Calendar time;

    @JAMSVarDescription(access = JAMSVarDescription.AccessType.READ,
    description = "temporal resolution [d | h | m]")
    public Attribute.String tempRes;

    @JAMSVarDescription(access = JAMSVarDescription.AccessType.READ,
    description = "state variable wind")
    public Attribute.Double wind;

    @JAMSVarDescription(access = JAMSVarDescription.AccessType.READ,
    description = "state variable mean temperature")
    public Attribute.Double tmean;

    @JAMSVarDescription(access = JAMSVarDescription.AccessType.READ,
    description = "state variable relative humidity")
    public Attribute.Double rhum;

    @JAMSVarDescription(access = JAMSVarDescription.AccessType.READ,
    description = "state variable net radiation")
    public Attribute.Double netRad;

    @JAMSVarDescription(access = JAMSVarDescription.AccessType.READ,
    description = "state variable rsc0")
    public Attribute.Double actRsc0;

    @JAMSVarDescription(access = JAMSVarDescription.AccessType.READ,
    description = "attribute elevation")
    public Attribute.Double elevation;

    @JAMSVarDescription(access = JAMSVarDescription.AccessType.READ,
    description = "attribute area")
    public Attribute.Double area;

    @JAMSVarDescription(access = JAMSVarDescription.AccessType.READ,
    description = "state variable LAI")
    public Attribute.Double actLAI;

    @JAMSVarDescription(access = JAMSVarDescription.AccessType.READ,
    description = "state variable effective height")
    public Attribute.Double actEffH;

    @JAMSVarDescription(access = JAMSVarDescription.AccessType.WRITE,
    description = "potential ET [mm/ timeUnit]")
    public Attribute.Double potET;

    @JAMSVarDescription(access = JAMSVarDescription.AccessType.WRITE,
    description = "actual ET [mm/ timeUnit]")
    public Attribute.Double actET;

    @JAMSVarDescription(access = JAMSVarDescription.AccessType.WRITE,
    description = "rs")
    public Attribute.Double rs;

    @JAMSVarDescription(access = JAMSVarDescription.AccessType.WRITE,
    description = "ra")
    public Attribute.Double ra;

    @JAMSVarDescription(access = JAMSVarDescription.AccessType.READ,
    description = "Caching configuration: 0 - write cache, 1 - use cache, 2 - caching off",
    defaultValue = "0")
    public Attribute.Integer dataCaching;

    private File cacheFile;
    //todo .. handle transient
    transient private ObjectOutputStream writer;

    transient private ObjectInputStream reader;

    /*
     *  Component run stages
     */
    public void init() throws Attribute.Entity.NoSuchAttributeException, IOException {
        //first, check if cached data are available
        //cacheFile = new File(dirName.getValue() + "/$" + this.getInstanceName() + ".cache");
       cacheFile = new File(getModel().getWorkspace().getTempDirectory(), this.getInstanceName() + ".cache");
        if (!cacheFile.exists() && (dataCaching.getValue() == 1)) {
            getModel().getRuntime().sendHalt(this.getInstanceName() + ": dataCaching is true but no cache file available!");
        }

        if (dataCaching.getValue() == 1) {
            reader = new ObjectInputStream(new BufferedInputStream(new FileInputStream(cacheFile)));//new FileInputStream(cacheFile));
        } else if (dataCaching.getValue() == 0) {
            writer = new ObjectOutputStream(new BufferedOutputStream(new FileOutputStream(cacheFile)));
        }
    }

    public void run() throws Attribute.Entity.NoSuchAttributeException, IOException {

       if (dataCaching.getValue() == 1) {
            this.potET.setValue(reader.readDouble());
            this.actET.setValue(0.0);
        } else {
            double netRad = this.netRad.getValue();
            double temperature = this.tmean.getValue();
            double rhum = this.rhum.getValue();
            double wind = this.wind.getValue();
            double rsc0 = this.actRsc0.getValue();
            double LAI = this.actLAI.getValue();
            double effHeight = this.actEffH.getValue();
            double elevation = this.elevation.getValue();
            double area = this.area.getValue();

            double abs_temp = org.unijena.j2k.physicalCalculations.ClimatologicalVariables.calc_absTemp(temperature, "degC");
            double delta_s = org.unijena.j2k.physicalCalculations.ClimatologicalVariables.calc_slopeOfSaturationPressureCurve(temperature);
            double pz = org.unijena.j2k.physicalCalculations.ClimatologicalVariables.calc_atmosphericPressure(elevation, abs_temp);
            double est = org.unijena.j2k.physicalCalculations.ClimatologicalVariables.calc_saturationVapourPressure(temperature);
            double ea = org.unijena.j2k.physicalCalculations.ClimatologicalVariables.calc_vapourPressure(rhum, est);

            double latH = org.unijena.j2k.physicalCalculations.ClimatologicalVariables.calc_latentHeatOfVaporization(temperature);
            double psy = org.unijena.j2k.physicalCalculations.ClimatologicalVariables.calc_psyConst(pz, latH);

            double rs = this.calcRs(LAI, rsc0, RSS);
            double ra = this.calcRa(effHeight, wind);


            double G = this.calc_groundHeatFlux(netRad);
            double vT = org.unijena.j2k.physicalCalculations.ClimatologicalVariables.calc_VirtualTemperature(abs_temp, pz, ea);
            double pa = org.unijena.j2k.physicalCalculations.ClimatologicalVariables.calc_AirDensityAtConstantPressure(vT, pz);

            double tempFactor = 0;
            double pET = 0;
            double aET = 0;


            if (this.tempRes.getValue().equals("d")) {
                tempFactor = 86400;
            } else if (this.tempRes.getValue().equals("h")) {
                tempFactor = 3600;
            } else if (this.tempRes.getValue().equals("m")) {
                tempFactor = 86400;
            }
            double Letp = this.calcETAllen(delta_s, netRad, G, pa, CP, est, ea, ra, rs, psy, tempFactor);

            pET = Letp / latH;
            aET = 0;

            //converting mm to litres
            pET = pET * area;
          

            //aggregation to monthly values
            if (this.time != null) {
                if (this.tempRes.getValue().equals("m")) {
                    int daysInMonth = this.time.getActualMaximum(time.DATE);
                    pET = pET * daysInMonth;
                }
            }
            //avoiding negative potETPs
            if (pET < 0) {
                pET = 0;
            }

            this.potET.setValue(pET);
            this.ra.setValue(ra);
            this.rs.setValue(rs);
            this.actET.setValue(aET);
            
            if (dataCaching.getValue() == 0) {
                writer.writeDouble(pET);
            }
        }
        
       }

    public void cleanup() throws IOException {
        if (dataCaching.getValue() == 0) {
            writer.flush();
            writer.close();
        } else if (dataCaching.getValue() == 1) {
            reader.close();
        }
    }

    private double calcETAllen(double ds, double netRad, double G, double pa, double CP, double est, double ea, double ra, double rs, double psy, double tempFactor) {

        double Letp = (ds * (netRad - G) + ((pa * CP * (est - ea) / ra) * tempFactor)) / (ds + psy * (1 + rs / ra));

        return Letp;
    }

    private double calc_groundHeatFlux(double netRad) {
        double g = 0.1 * netRad;
        return g;
    }

    /*
    private double calc_raAllen(double veg_height, double windspeed){
    double w = Math.log((2 - 2. / 3. * veg_height)/(0.123 * veg_height));
    double r = Math.log((2 - 2. / 3. * veg_height)/(0.1 * 0.123 * veg_height));
    double v = Math.pow(0.41,2) * windspeed;
    
    double ra = (w*r) / v ;
    return ra;
    }
     */
    private static double calcRa(double eff_height, double wind_speed) {
        double ra;
        if (wind_speed <= 0) {
            wind_speed = 0.5;
        }
        if (eff_height < 10) {
            //old equation, don't use this one
            //ra = (1.5 * Math.pow(Math.log(2/(0.125 * eff_height)),2)) / (Math.pow(0.41,2) * wind_speed);
            //J2K equation
            //ra = (4.72 * Math.pow(Math.log(2.0 / (0.125 * eff_height)),2)) / (1 + 0.54 * wind_speed);
            //LARSIM equation
            //ra = (6.25 / wind_speed) * Math.pow(Math.log(2 / (0.1 * eff_height)), 2);
            ra = (9.5 / wind_speed) * Math.pow(Math.log(2 / (0.1 * eff_height)), 2);
        } else {
            //ra = 64 / (1+0.54*wind_speed);//(Math.pow(0.41,2) * wind_speed);
            ra = 20 / (Math.pow(0.41, 2) * wind_speed);
        }
        return ra;
    }

    private double calcRs(double LAI, double rsc, double rss) {
        double A = Math.pow(0.7, LAI);
        double rs = 1. / (((1 - A) / rsc) + ((A / rss)));

        return rs;
    }
}