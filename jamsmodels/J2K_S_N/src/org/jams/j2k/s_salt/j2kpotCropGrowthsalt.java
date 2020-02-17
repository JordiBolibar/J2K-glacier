    /*
     * j2kpotCropGrowthsalt.java
     *
     * Created on 15. November 2005, 11:47
     * This file is part of JAMS
     *
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
package org.jams.j2k.s_salt;

/**
 *
 * @author  c5ulbe
 */
import org.jams.j2k.s_n.crop.J2KSNCrop;
import jams.model.*;
import jams.data.*;
import java.io.*;
import java.util.ArrayList;

@JAMSComponentDescription(
        title="j2kCropGrowthsalt",
        author=" Manfred Fink",
        description="Module for calculation of crop growth according to the algorithms of SWAT with NaCl pools"
        )
        
        public class j2kpotCropGrowthsalt extends JAMSComponent {
    
    /*
     *  Component variables
     */
    
    
    @JAMSVarDescription(
            access = JAMSVarDescription.AccessType.READWRITE,
            description = "Current organic fertilizer amount"
            )
            public Attribute.Integer RotPos;
    
    @JAMSVarDescription(
            access = JAMSVarDescription.AccessType.READ,
            description = "Current hru object"
            )
            public Attribute.EntityCollection entities;
    
    /*@JAMSVarDescription(
            access = JAMSVarDescription.AccessType.READ,
            description = "Current hru object id"
            )
            public Attribute.Double idValue ;*/
    
    @JAMSVarDescription(
            access = JAMSVarDescription.AccessType.READ
            )
            public Attribute.String fileName;
    
    @JAMSVarDescription(
            access = JAMSVarDescription.AccessType.READ,
            description = "HRU attribute name area"
            )
            public Attribute.Double Area;
    
    @JAMSVarDescription(
            access = JAMSVarDescription.AccessType.READ,
            description = "HRU daily mean temperature [°C]"
            )
            public Attribute.Double Tmean;
    
    @JAMSVarDescription(
            access = JAMSVarDescription.AccessType.READ,
            description = "Daily solar radiation [MJ/m²]"
            )
            public Attribute.Double SolRad;
    
    
    @JAMSVarDescription(
            access = JAMSVarDescription.AccessType.READWRITE,
            description = "Biomass sum produced for a given day [kg/ha] drymass"
            )
            public Attribute.Double BioAct;
    
    @JAMSVarDescription(
            access = JAMSVarDescription.AccessType.READWRITE,
            description = "Biomass sum produced for a day before [kg/ha] drymass"
            )
            public Attribute.Double BioOld;
    
    @JAMSVarDescription(
            access = JAMSVarDescription.AccessType.READWRITE,
            description = "Actual canopy Height [m]"
            )
            public Attribute.Double CanHeightAct;
    
    @JAMSVarDescription(
            access = JAMSVarDescription.AccessType.READWRITE,
            description = "Actual rooting depth [dm]"
            )
            public Attribute.Double ZRootD;
    

    
    
    
    @JAMSVarDescription(
            access = JAMSVarDescription.AccessType.READWRITE,
            description = "Potential Crop Yield [kg/ha] for the actual day"
            )
            public Attribute.Double Yield;
    
    
  /*  @JAMSVarDescription(
            access = JAMSVarDescription.AccessType.READWRITE,
            description = "Actual Crop Yield [kg/ha]"
            )
            public Attribute.Double YieldAct; */
    
    @JAMSVarDescription(
            access = JAMSVarDescription.AccessType.READWRITE,
            description = "Biomass above ground on the day of harvest [kg/ha]"
            )
            public Attribute.Double BioagAct;
    
    
    @JAMSVarDescription(
            access = JAMSVarDescription.AccessType.WRITE,
            description = "Biomass added residue pool after harvesting [kg/ha]"
            )
            public Attribute.Double Addresidue_pool;
    
    @JAMSVarDescription(
            access = JAMSVarDescription.AccessType.WRITE,
            description = "Salt added residue pool after harvesting [kg N/ha]"
            )
            public Attribute.Double Addresidue_poolNaCl;
    
/*    @JAMSVarDescription(
            access = JAMSVarDescription.AccessType.READ,
            description = "Water stress for a given day [mm H2O]"
            )
            public Attribute.Double Wstrs;*/
    
    @JAMSVarDescription(
            access = JAMSVarDescription.AccessType.READWRITE,
            description = "HRU actual Transpiration [mm]"
            )
            public Attribute.Double aTP;
    
    @JAMSVarDescription(
            access = JAMSVarDescription.AccessType.READ,
            description = "HRU potential Transpiration [mm]"
            )
            public Attribute.Double pTP;
    
    @JAMSVarDescription(
            access = JAMSVarDescription.AccessType.READ,
            description = "Light Extinct Coefficient [-0.65]"
            )
            public Attribute.Double LExCoef;
    
    @JAMSVarDescription(
            access = JAMSVarDescription.AccessType.READWRITE,
            description = "Actual NaCl content in plants biomass [kg N/ha]"
            )
            public Attribute.Double BioNaClAct;
    
    
    @JAMSVarDescription(
            access = JAMSVarDescription.AccessType.READWRITE,
            description = "Daily fraction of max LAI [-]"
            )
            public Attribute.Double frLAImxAct;
    
    @JAMSVarDescription(
            access = JAMSVarDescription.AccessType.READWRITE,
            description = "Daily fraction of max LAI [-]"
            )
            public Attribute.Double frLAImx_xi;
    
    
    @JAMSVarDescription(
            access = JAMSVarDescription.AccessType.READWRITE,
            description = "Daily fraction of max root development [-]"
            )
            public Attribute.Double frRootAct;
    
    
    @JAMSVarDescription(
            access = JAMSVarDescription.AccessType.READWRITE,
            description = "root development of the day before [cm]"
            )
            public Attribute.Double ZRootOld;
    
    @JAMSVarDescription(
            access = JAMSVarDescription.AccessType.READWRITE,
            description = "Actual yield [kg/ha]"
            )
            public Attribute.Double BioYield;
    
    @JAMSVarDescription(
            access = JAMSVarDescription.AccessType.READWRITE,
            description = "Actual N content in yield [absolut]"
            )
            public Attribute.Double NaClYield;
    
    @JAMSVarDescription(
            access = JAMSVarDescription.AccessType.READWRITE,
            description = "Actual N content in yield [kg N/ha]"
            )
            public Attribute.Double NaClYield_ha;
    
    
    @JAMSVarDescription(
            access = JAMSVarDescription.AccessType.READ,
            description = "time"
            )
            public Attribute.Calendar time;
    
    
    
    @JAMSVarDescription(
            access = JAMSVarDescription.AccessType.READWRITE,
            description = "actual harvest index [0-1]"
            )
            public Attribute.Double HarvIndex;
    
    
    @JAMSVarDescription(
            access = JAMSVarDescription.AccessType.READWRITE,
            description = "actual potential heat units sum [-]"
            )
            public Attribute.Double FPHUact;
    
    
    @JAMSVarDescription(
            access = JAMSVarDescription.AccessType.READWRITE,
            description = "delta potential heat units sum [-]"
            )
            public Attribute.Double PHUdelta;
    
    @JAMSVarDescription(
            access = JAMSVarDescription.AccessType.READWRITE,
            description = "delta potential heat units sum [-]"
            )
            public Attribute.Double PHUdeltaold;
    
    
    @JAMSVarDescription(
            access = JAMSVarDescription.AccessType.READWRITE,
            description = "delta LAI [-]"
            )
            public Attribute.Double LAIdelta;
    
    @JAMSVarDescription(
            access = JAMSVarDescription.AccessType.READWRITE,
            description = "actual LAI"
            )
            public Attribute.Double LAI;
    
    @JAMSVarDescription(
            access = JAMSVarDescription.AccessType.READWRITE,
            description = "LAI of the day before "
            )
            public Attribute.Double LAIold;
    
    @JAMSVarDescription(
            access = JAMSVarDescription.AccessType.READ,
            description = "actual nitrate uptake by plants in kgN/ha"
            )
            public Attribute.Double actNaCl_up;
    
    @JAMSVarDescription(
            access = JAMSVarDescription.AccessType.READWRITE,
            description = "flag plant existing yes or no " // attention its a boolean!
            )
            public Attribute.Boolean plantExisting;
    
    @JAMSVarDescription(
            access = JAMSVarDescription.AccessType.READWRITE,
            description = "actual potential heat units sum [-]"
            )
            public Attribute.Double PHUact;
    
    
    @JAMSVarDescription(
            access = JAMSVarDescription.AccessType.READWRITE,
            description = "Plants base growth temperature [°C]"
            )
            public Attribute.Double tbase;
    
    
    @JAMSVarDescription(
            access = JAMSVarDescription.AccessType.READWRITE,
            description = "Plants optimum growth temperature [°C]"
            )
            public Attribute.Double topt;
    
    
 
    
    @JAMSVarDescription(
            access = JAMSVarDescription.AccessType.READWRITE,
            description = "Plants daily biomass increase [kg/ha]"
            )
            public Attribute.Double BioOpt_delta;
    
    
    @JAMSVarDescription(
            access = JAMSVarDescription.AccessType.READWRITE,
            description = "Reset plant state variables?"
            )
            public Attribute.Boolean plantStateReset;
    
    @JAMSVarDescription(
            access = JAMSVarDescription.AccessType.WRITE,
            description = "Indicator for harvesting"
            )
            public Attribute.Boolean doHarvest;
    
    @JAMSVarDescription(
            access = JAMSVarDescription.AccessType.READ,
            description = "Factor of rootdepth 1 - 10 default 1"
            )
            public Attribute.Double rootfactor;
    
    @JAMSVarDescription(
            access = JAMSVarDescription.AccessType.READ,
            description = "indicates dormancy of plants"
            )
            public Attribute.Boolean dormancy;
    
    
     /*
      
      *  Component run stages
      */
    
    
    private double area_ha;
    private double sc1_LAI;
    private double sc2_LAI;
    private double sc3_Nbio;
    private double sc4_Nbio;
    
    private double frLAImx_act;
    private double lai_act;
   
    
    private double addresidue_pool;
    private double addresidue_poolNaCl;
    private double hc_act;
    
    private double idc;
    private double phu_50;
    private double phu;
    private double phu_delta;
    private double fphu_act;
    private double phu_daily;
    private double phu_deltaold;
    private double phu_Xi;
    private double aTransP;
    private double pTransP;
    
    private double int_lai;
    private double mlai1;
    private double mlai;
    private double mlai2;
    private double lai_min;
    
    private double frgrw1;
    private double frgrw2;
    private double frLAImx;
    private double frLAImx_actnew;
    private double frLAImx_Xi;
    private double LAI_actnew;
    private double solrad;
    private double rue;
    private double leco;
    
    private double chtmx;
    private double rdmx;
    private double frroot_act;
    private double zrootd_act;
    private double zrootd_old;
    private double zrootd;
    
    private double bn1;
    private double bn2;
    private double bn3;
    
    private double betaN;
    private double hvsti;
    private double cnyld;
    
   
   
    private double bioNaCl_act; 
    private double bio_act;
    private double bio_opt;
    private double bio_old;
    private double bioopt_ha;
    private double hi_act;
    private double bioag_act;
    private double yldNaCl;
    private double yldNaCl_ha;
    private double yield;
    
    private double tmean;
    private double Tbase;
    private double Topt;
    private double julday;
    
    public double famount;
    public boolean plant;
    public int harvest;
    public double fracharvest;
    public double fracharvestNaCl;
    
    private double LAI_delta;
    private double frLAImx_delta;
    
    private double enty_id;
    private double soil_no3;
    private double bioNopt_accumu ;
    private double Ndemand_accumu;
   
    
    private double bio_opt_delta;
    
   /* double dec; // days to reach specific plant stage
    double hu_ec; // Potential heat units to reach specific plant stage
    int PS = 0;     //Plant status for optimal growth*/
    
    
    public void init() throws Attribute.Entity.NoSuchAttributeException, IOException {
        
    }
    
    public void run() throws Attribute.Entity.NoSuchAttributeException{
        Attribute.Entity entity = entities.getCurrent();
        /* this.bp1 = crop.bp1; // Phosphate uptake parameter not used at the moment
        this.bp2 = crop.bp2;
        this.bp3 = crop.bp3;*/
        // this.rsdco_pl = crop.rsdco_pl;
        /* this.hu_ec1 = crop.hu_ec1;
        this.hu_ec2 = crop.hu_ec2;
        this.hu_ec3 = crop.hu_ec3;
        this.hu_ec4 = crop.hu_ec4;
        this.hu_ec5 = crop.hu_ec5;
        this.hu_ec6 = crop.hu_ec6;
        this.hu_ec7 = crop.hu_ec7;
        this.hu_ec8 = crop.hu_ec8;
        this.hu_ec9 = crop.hu_ec9;
        this.enty_id = idValue.getValue();*/
        this.tmean = Tmean.getValue();
        this.fphu_act = FPHUact.getValue();
        this.phu_daily = PHUact.getValue();
        this.phu_delta = PHUdelta.getValue();
        this.phu_deltaold = PHUdeltaold.getValue();
        this.area_ha = Area.getValue() /10000;
        this.solrad = SolRad.getValue();
        this.leco = LExCoef.getValue();
        this.frLAImx_act = frLAImxAct.getValue();
        this.frLAImx_Xi = frLAImx_xi.getValue();
        this.lai_act = LAI.getValue();
        this.LAI_delta = LAIdelta.getValue();
        this.hc_act = CanHeightAct.getValue(); /*actual Canopy height [m] on a given day */
        this.frroot_act = frRootAct.getValue();
        this.zrootd_act = ZRootD.getValue();
        this.zrootd_old = ZRootOld.getValue();
       
        
      
        
        this.hi_act = HarvIndex.getValue();;
        this.bioag_act = BioagAct.getValue();
        this.bio_opt = BioAct.getValue();
      
        this.bio_opt_delta= BioOpt_delta.getValue();
        this.yield =  BioYield.getValue();
        this.yldNaCl =  NaClYield.getValue();
        this.yldNaCl_ha = NaClYield_ha.getValue();
        
        
        
        ArrayList<J2KSNCrop> rotation = (ArrayList<J2KSNCrop>) entity.getObject("landuseRotation");
        int rotPos = RotPos.getValue();
        J2KSNCrop crop = rotation.get(rotPos);
        
        this.phu = crop.phu; /* total heat units required to reach maturity */
        this.idc = crop.idc;
        this.rue = crop.rue; // Radiation use efficiency
        this.hvsti = crop.hvsti;
        this.frgrw1 = crop.frgrw1; //Fraction of growing season corresponding to the first point of the optimal LAI development*/
        this.frgrw2 = crop.frgrw2; //Fraction of growing season corresponding to the second point of the optimal LAI development*/
        this.lai_min = crop.lai_min;
        this.mlai = crop.mlai;
        this.mlai1 = crop.laimx1;
        this.mlai2 = crop.laimx2;
        /*this.dlai = crop.dlai;*/
        this.chtmx = crop.chtmx;
        this.rdmx = crop.rdmx;
        this.Topt = crop.topt; //Optimal growth temperature
        this.Tbase = crop.tbase;
        this.cnyld = crop.cnyld;
        this.bn1 = crop.bn1; //Normal fraction of N in the plant biomass at the emergence
        this.bn2 = crop.bn2; //Normal fraction of N in the plant biomass at 50% of plant growth
        this.bn3 = crop.bn3; //Normal fraction of N in the plant biomass near harvest
        
        
        /*ArrayList<J2KSNLMArable> managementList = currentCrop.managementList;
        int managementPos = entity.getInt("managementPos");
        J2KSNLMArable currentManagement = managementList.get(managementPos);*/
        if (crop.idc == 11){
            phu_delta = 0;
            phu_deltaold = 0;
            phu_daily = 0;
            Tbase = 0;
            Topt = 0;
            frLAImx_act = 0; /*actual fraction of max LAI for a given day */
            LAI_delta = 0;
            lai_act = 1;
            // bio_opt = 0;
            // BioOpt.setValue(bio_opt * area_ha); /*Plants optimal biomass */
            hc_act = 0; /*Actual canopy height */
            frroot_act = 0;  /* daily fraction of root development [mm] */
            zrootd_act = 1000;  /* daily root development [mm] */
            zrootd_old = 0;
           
            bioNaCl_act = 0;
            bio_opt = 0; /*Plants optimal biomass */
            bio_old = 0;
          
            bio_opt_delta = 0;
            hi_act = 0;
            bioag_act = 0;
            yield = 0;
            yldNaCl = 0; /* N Content from the above biomass */
            yldNaCl_ha = 0;
            fphu_act = 0;
           
            frLAImx_Xi = 0;
            //residue_pool = 0;
            this.addresidue_pool = 0;
            this.addresidue_poolNaCl = 0;
            
            
        }else if (plantExisting.getValue()) {
            calc_phu();
            calc_lai();
            calc_biomass();
            hc_act = calc_canopy();
            calc_root();
            calc_maturity();
            calc_NaCluptake();
            
            // time
            this.addresidue_pool = 0;
            this.addresidue_poolNaCl = 0;
            if (doHarvest.getValue()){
                calc_cropyield();
                calc_cropyield_ha();
                calc_residues();
                doHarvest.setValue(false);
            }
            
        } else if (plantStateReset.getValue()) {
            
            phu_delta = 0;
            phu_deltaold = 0;
            phu_daily = 0;
            Tbase = 0;
            Topt = 0;
            frLAImx_act = 0; /*actual fraction of max LAI for a given day */
            LAI_delta = 0;
            lai_act = 0;
            // bio_opt = 0;
            // BioOpt.setValue(bio_opt * area_ha); /*Plants optimal biomass */
            hc_act = 0; /*Actual canopy height */
            frroot_act = 0;  /* daily fraction of root development [mm] */
            zrootd_act = 0;  /* daily root development [mm] */
            zrootd_old = 0;
           
            bioNaCl_act = 0;
            bio_opt = 0; /*Plants optimal biomass */
            bio_old = 0;
           
            bio_opt_delta = 0;
            hi_act = 0;
            bioag_act = 0;
            yield = 0;
            yldNaCl = 0; /* N Content from the above biomass */
            yldNaCl_ha = 0;
            fphu_act = 0;
            
            frLAImx_Xi = 0;
            //residue_pool = 0;
            this.addresidue_pool = 0;
            this.addresidue_poolNaCl = 0;
            plantStateReset.setValue(false);
           
            //System.out.println("########################## resetting values ##########################");
            /*PHUdelta.setValue(0);
            PHUdeltaold.setValue(0);
            LAIdelta.setValue(0);
            frLAImxAct.setValue(0); //actual fraction of max LAI for a given day
            frLAImx_xi.setValue(0);
            LAI.setValue(0);
            LAIold.setValue(0);
            // BioOpt.setValue(bio_opt);
            // BioOpt.setValue(bio_opt * area_ha); //Plants optimal biomass
            CanHeightAct.setValue(0); //Actual canopy height
            frRootAct.setValue(0);  // daily fraction of root development [mm]
            ZRootD.setValue(0);  // daily root development [mm]
            ZRootOld.setValue(0);
            FNPlant.setValue(0); // daily fraction of N in plant biomass
            BioNoptAct.setValue(0);
            BioAct.setValue(0); //Plants optimal biomass
            PlantNDemAct.setValue(0);
            HarvIndex.setValue(0);
            BioagAct.setValue(0);
            BioOld.setValue(0);
            BioYield.setValue(0);
            BioOpt_delta.setValue(0);
            NYield.setValue(0); // N Content from the above biomass
            NYield_ha.setValue(0);
            FPHUact.setValue(0);
            BioNAct.setValue(0); //actual biomass in kg/ha adapted by stress
            PHUact.setValue(0);
            PlantNDemAct.setValue(0);
            plantStateReset.setValue(false);
            PlantNDemAct.setValue(0);
            Residue_pool.setValue(0);
            time.getValue();*/
        }
        
        PHUdelta.setValue(phu_delta);
        //PHUdeltaold.setValue(phu_deltaold);
        PHUact.setValue(phu_daily);
        tbase.setValue(Tbase);
        topt.setValue(Topt);
        frLAImxAct.setValue(frLAImx_act); /*actual fraction of max LAI for a given day */
        LAIdelta.setValue(LAI_delta);
        LAI.setValue(lai_act);
        // BioOpt.setValue(bio_opt);
        // BioOpt.setValue(bio_opt * area_ha); /*Plants optimal biomass */
        CanHeightAct.setValue(hc_act); /*Actual canopy height */
        frRootAct.setValue(frroot_act);  /* daily fraction of root development [mm] */
        ZRootD.setValue(zrootd_act * rootfactor.getValue());  /* daily root development [mm] */
        ZRootOld.setValue(zrootd_old);
        
        BioNaClAct.setValue(bioNaCl_act);
        BioAct.setValue(bio_opt); /*Plants optimal biomass */
        BioOld.setValue(bio_old);
       
        BioOpt_delta.setValue(bio_opt_delta);
        HarvIndex.setValue(hi_act);
        BioagAct.setValue(bioag_act);
        BioYield.setValue(yield);
        NaClYield.setValue(yldNaCl); /* N Content from the above biomass */
        NaClYield_ha.setValue(yldNaCl_ha);
        FPHUact.setValue(fphu_act);
       
        frLAImx_xi.setValue(frLAImx_Xi);
        Addresidue_pool.setValue(addresidue_pool);
        Addresidue_poolNaCl.setValue(addresidue_poolNaCl);
        if (this.idc == 3 || this.idc == 6 || this.idc == 7) {
            plantStateReset.setValue(false);
        }else{
            plantStateReset.setValue(true);
        }
    }
//        idc = idc+1;
//        cropClass.setValue(idc);
    
//        cropClass.setValue(cropClass.getValue()+1);
    
    
// Optimal growth
    //
    // Biomass production
    //
    // First the daily development of the LAI is calculated as a fraction of maximimum LAI development (frLAImx)
    // Hereby the fraction of plants maximum leaf area index corresponding to a given fraction of PHU is calculated
    // and two shape-coefficient, sc1 and sc2 are needed
    // calculation the maximum leaf area corresponding to fraction of heat units,
    // expressed as LAI fraction of the known max LAI
    // @todo declare how is continuosly vegetated land use is determined
    
    private boolean calc_phu() {
        if (this.tmean > this.Tbase) {
            this.phu_daily = phu_daily + (this.tmean - this.Tbase); //phänologisch wirksame Temperatursumme
            this.fphu_act = this.phu_daily / this.phu;
        }
        //*double tDelta = this.Tbase - this.tmean;
        /*if (tDelta > 0) {
            this.phu_daily = this.phu_daily + tDelta;
             this.fphu_act = this.phu_daily / this.phu;
        }*/
        //}
        return true;
    }
    
    
   /* private boolean calc_phu_() {
        //System.out.println("tägliche phu_daily " + phu_delta );
        if (this.tmean > this.Tbase) {
        double phu_Delta = this.Tbase - this.tmean;
        //double phu_Delta = this.tmean - this.Tbase;
            if (phu_Delta > 0) {
            this.phu_daily = this.phu_daily + phu_Delta;
        }
       //     this.phu_deltaold = phu_delta;
       // this.phu_delta = Math.max(0, this.tmean - this.Tbase);
        this.phu_daily = phu_deltaold + this.phu_delta;
        //if  (this.enty_id == 6) {
       //System.out.println("tägliche phu_daily " + phu_daily +" " +phu_Delta+ "  "+tmean+ "  " +Tbase+ "  ");
        //}
        //System.out.println("tägliche phu_daily " + phu_daily +" " +phu_delta+ "  "+tmean+ "  " +Tbase+ "  ");
        this.fphu_act = this.phu_daily / this.phu;
    
           /* else {
            phu_deltaold = phu_delta;
            phu_delta = 0;
            this.phu_daily = this.phu_delta + phu_deltaold;
            //System.out.println("tägliche phu_daily " + phu_daily +" " +phu_delta+ "  ");
            this.fphu_act = this.phu_daily / this.phu;*/
    
    
    //if (this.enty_id == 6){
    //  System.out.println("tägliche Temperatursumme " + phu_daily +" "+ fphu_act  +" "+ tmean +" ");
    //}
    
        /*if (phu_deltaold > phu_delta)
            System.out.println("ARGHH!");*/
    //}
    //return true; */
    //System.out.println("tägliche phu_daily " + phu_delta );
    // }
    
    
    
    private boolean calc_lai() {
        
         /* Shape coefficients
            sc to determine LAI development */
        double sc1_lai1 = Math.log(this.frgrw1/this.mlai1- this.frgrw1);
        double sc2_lai2 = Math.log(this.frgrw2/this.mlai2- this.frgrw2);
        double sc_frpuh = this.frgrw2 - this.frgrw1;
        
        sc2_LAI = (sc1_lai1 - sc2_lai2)/sc_frpuh;
        sc1_LAI = sc1_lai1 + sc2_LAI * this.frgrw1;
        
        double sc_minus = this.fphu_act * sc2_LAI;
        //System.out.println("scaling factors LAI: " + sc1_LAI +" "+  sc2_LAI +" ");
        
        /* Fraction of plant's maximum LAI */
        frLAImx_Xi = frLAImx_act; // save frLAImx from the day before
        double x = (this.fphu_act + (Math.exp(sc1_LAI - sc_minus)));
        frLAImx_act = this.fphu_act / x;
        frLAImx_delta = frLAImx_act - frLAImx_Xi; //
        
        //System.out.println("factors LAI: " + frLAImx_act  +" "+  frLAImx_Xi +" "+  frLAImx_delta +" ");
        
        // Total leaf area index is calculated by frLAImx added on a day
        //lai_old = LAI_delta;
        double u1 = lai_act - this.mlai;
        double u2 = 5.0 * u1;
        double u3 = frLAImx_delta;
        this.LAI_delta = u3 * this.mlai *(1 - Math.exp(u2));
 /*       if (this.LAI_delta < 0){
            this.LAI_delta = 0;
        }*/
        this.lai_act = this.lai_act + this.LAI_delta;
        //this.lai_act = this.lai_old + this.LAI_delta;
        if
                (this.lai_act > this.mlai){
            this.lai_act = this.mlai;
        }
        
        if (doHarvest.getValue() && (this.idc == 3 || this.idc == 6 || this.idc == 7)){
            frLAImx_act = 0;
            LAI_delta = 0;
            lai_act = lai_min;
            frLAImx_Xi = 0;
            
        }
        
        
        
        //System.out.println("factors LAI: " + this.lai_act +" "+  this.LAI_delta +" "+  u1 +" ");
        
//        System.out.println(lai_act); time
        
        // LAI will remain constant until leaf senescence begins to exceed leaf growth
        // this. phu_sense is the fphu when senescence becomes dominant
        // @todo declare what is fphu_sense; here assumed by phu 0.99 for forests determined by idc;
        // @todo declare when and what happens to the residues
        
        /*
        double fphu_sense = 0.99;
         
        if
                (this.idc == 7 && this.fphu_act > fphu_sense) {
            lai_act = 16 * this.mlai * Math.pow(1 - this.fphu_act,2);
         
        }*/
        return true;
    }
// Second the amount of daily solar radiation intercepted by the leaf area of the plant is calculated
// this.solrad = incoming total solar
// Hphosyn = the amount of intercepted photosynthetically active radiation on a day [MJ m-2]
    
// Third the amount of biomass (dry weight in kg/ha) produced per unit intercepted solar radiation is calulated using the plant-specific
// radiation-use efficiency declared in the crop growth database by parameter 'rue' in crop.par
// whereas the total biomass on a given day is summed up
    
    private void calc_biomass() {
        
        double Hphosyn = 0.5 * this.solrad * (1 - Math.exp(this.leco*this.lai_act)); // Intercepted photosynthetically active radiation [MJ/m²]
        
        this.bio_opt_delta = this.rue * Hphosyn;
        
        if (dormancy.getValue()) {
           bio_opt_delta = 0; 
        }
        
        //       this.bio_opt = bio_opt_delta +  this.bio_opt;
        
        //      return bio_opt;
    }
    
//
// Canopy height and cover
//
// Canopy cover is expressed as leaf area index
// hc_daily = canopy height (m) for a given day
// mlai = Maximum LAI Parameter from crop.par
// chtmx = maximum canopy height (m), Parameter from crop.par
// frLAImx = fraction of plants maximum canopy height
    
    private double calc_canopy() {
        
        //double hc_old = hc_delta;
        double hc_delta = this.chtmx * Math.sqrt(frLAImx_act);
        hc_act = hc_delta + this.hc_act;
        
        return hc_act;
    }
//
// Root development
//
// Amount of total plants biomass partioned to the root system
// in general it varies in between 30-50% in seedlings and decreases to 5-20% in mature plants
// fraction of biomass in roots by SWAT varies between 0.40 at emergence and 0.20 at maturity
// daily fraction of root biomass is calculated by
    
// Fraction of root biomass
//
    private boolean calc_root() {
        
        
        double rootpartmodi = 0.20 * this.fphu_act;
        rootpartmodi = Math.min(rootpartmodi,0.2);
        frroot_act = 0.40 - rootpartmodi;
        
        //frroot_act = frroot + frroot_act;
        
     /* calculation of the root depth according to the plant types and conditions of IDC
          IDC Land cover/plant classification:
        1 warm season annual legume
        2 cold season annual legume
        3 perennial legume
        4 warm season annual
        5 cold season annual
        6 perennial
        7 trees
        Processes modeled differently for the 7 groups are:
        1 warm season annual legume
        • simulate nitrogen fixation
        • root depth varies during growing season due to root growth
        2 cold season annual legume
        • simulate nitrogen fixation
        • root depth varies during growing season due to root growth
        • fall-planted land covers will go dormant when daylength is less than the threshold daylength
        3 perennial legume
        • simulate nitrogen fixation
        • root depth always equal to the maximum allowed for the plant species and soil
        • plant goes dormant when daylength is less than the threshold daylength
        4 warm season annual
        • root depth varies during growing season due to root growth
        5 cold season annual
        • root depth varies during growing season due to root growth
        • fall-planted land covers will go dormant when daylength is less than the threshold daylength
        6 perennial
        • root depth always equal to the maximum allowed for the plant species and soil
        • plant goes dormant when daylength is less than the threshold daylength
        7 trees
        • root depth always equal to the maximum allowed for the plant species and soil
        • partitions new growth between leaves/needles (30%) and woody growth (70%). At the end of each growing season, biomass in the leaf fraction is converted to residue*/
        
        // Root development (mm in the soil) for plant types on a given day
        
        // Varying linearly from 0.0 at the beginning of the growing season to the maximum rooting depth at fphu = 0.4
        // Perennials and trees, as therefore rooting depth is not varying
        // idValue.getValue() == 6)
        if
                (this.idc == 3 || this.idc == 6 || this.idc == 7) {
            double zrootd_act = this.rdmx;
        }
        
        // annuals
        // if case: as long pfhu is within 0.4; as fphu 0.4 is the time of max root depth
        
        if
                (this.idc ==  1 || this.idc == 2 || this.idc == 4 || this.idc == 5 && this.fphu_act <= 0.40) {
            
            zrootd_act = 2.5 * this.fphu_act * this.rdmx;
            //  zrootd_act = zrootd_act + zrootd;
        }
        if
                (this.fphu_act > 0.40) {
            zrootd_act = this.rdmx;
        }
        // System.out.println(" aktuelle idc_no: " + idc + " - ");
        return true;
    }
    
// Maturity
    
// is reached when fphu_act = 1
// as therefore no calculation is needed
// @todo nutrients & water uptake & transpiration will stopp depending on the condition fphu = 1
    
    private void calc_NaCluptake(){
      bioNaCl_act = actNaCl_up.getValue() + bioNaCl_act;
    }
    
    private boolean calc_maturity(){
        
        if
                (this.fphu_act >= 1.00) {
            this.aTransP = 0;
            double Nup_act = 0;
            double Wup_act = 0;
        }
        return true;
    }
    
// Water uptake by plants
// Potential water uptake
    
    
// Nutrient uptake by plants
    
   
// Nitrogen fixation
// used when nitrate levels in the root zone are insufficient to meet the demand
    
// Phosphorus uptake
    
// Crop Yield
    private boolean calc_cropyield() {
        if (this.idc == 3 || this.idc == 6 || this.idc == 7) {
            
            double u1 = 100 * this.fphu_act;
            hi_act = this.hvsti * (u1)/(u1 + Math.exp(11.1 - 10.0 * this.fphu_act));
            hi_act = Math.max(hi_act,this.hvsti * 0.75);
            hi_act = Math.min(hi_act, hvsti);
            // crop yield (kg/ha)is calculated as
            // above ground biomass
            
            double bio_ag = (1- frroot_act) * this.bio_opt; // actual aboveground biomass on the day of harvest
            bioag_act = bio_ag;
        /* if (idValue.getValue() == 6) {
            System.out.println (" frroot_act: " + frroot_act + " - ");
        } */
            
            //double bio_root = (1 - bio_opt) * bio_opt;
            
            
            if (this.fphu_act >= 1.00) {
                double bioag_harvest = bioag_act;
            }
            
            // total yield biomass on the day of harvest
            // @todo harvest options
            // first case: the total biomassis assumed to be yield
            if (this.hvsti <= 1) {
                this.yield = bioag_act * hi_act;
                if (yield >  bioag_act){
                    this.yield = bioag_act;
                }
                // double yield_root = bio_root * hi_act;
            }
            // second case: a portion of the total biomass is assumed to be yield
            else if (this.hvsti > 1)											// bio is the total biomass on the day of the harvest (kg/ha)
            {
                this.yield = bio_opt * (1 - (1/(1+ hi_act)));
            }
            /*if (idValue.getValue() == 6) {
                System.out.println(" hi_act: " + hi_act +  " hvsti: " + hvsti +  " fphu: " + fphu_act + " - ");
            }*/
            // Amounts of nitrogen [kg N/ha](and who wants P) to be removed from the field
            // whereas cnyld is the fraction of N being removed by the field crop
            
            this.yldNaCl = bioNaCl_act * (this.yield/bio_opt);
            /*
            this.yldN = this.cnyld * this.yield;
            if (this.yldN > bioN_act){
                yldN = bioN_act;
            }*/
            //System.out.println (" Julianischer Tag "+ Attribute.Calendar.DAY_OF_YEAR + " hi_act: " + hi_act +  " hvsti: " + hvsti +  " fphu: " + fphu_act + " yldN " + yldN + " yield " + yield);
            //double yldP = this.cpyld * yield; time
            if (this.idc == 7){
                this.fphu_act = 0;
            }else{
                this.fphu_act = Math.min(fphu_act, 1);
                this.fphu_act = (this.fphu_act * (1 - (this.yield / this.bio_opt)))/8;
            }
            this.phu_daily = this.phu * this.fphu_act;
            bio_opt = bio_opt - this.yield;
            if (bio_opt < 0){
                bio_opt = 0;
            }
            bioNaCl_act = bioNaCl_act - this.yldNaCl;
            
            fracharvest = 1 - (yield / bio_opt);
            fracharvestNaCl = 1 - (yldNaCl / bioNaCl_act);
            
            
            
        }else{
            //for harvesting 4 codes are implemented:
            // (1) assumes harvesting with Haupt- & Nebenfrucht, plant growth stopped
            // (2) assumes harvesting with Hauptfrucht, Nebenfrucht remains on the field, plant growth stopped (former kill operation)
            // (3) assumes harvesting with Haupt- & Nebenfrucht, plant growth continues (may not be suitable for meadows)
            // (4) assumes harvesting with Hauptfrucht, plant growth continues//
            
            // when harvest&kill is determined in the crop management by code (1)
            // above-ground plant dry biomass removed as dry economic yield is called harvest index
            // for majority of crops the harvest index is between 0 and 1,
            // however for plant whose roots are harvested, such as potatos may have an harvest index greater than 1
            // harvest index is calculated for each day of the plant's growing season using the relationship
            // as hi is the potential harvest index for a given day and
            // hvsti is the potential harvest index for the plant
            // at maturity given ideal growing conditions (Parameter hvsti in crop.par)
            
            
            
            double u1 = 100 * this.fphu_act;
            hi_act = this.hvsti * (u1)/(u1 + Math.exp(11.1 - 10.0 * this.fphu_act));
            hi_act = Math.max(hi_act,this.hvsti * 0.75);
            // crop yield (kg/ha)is calculated as
            // above ground biomass
            
            double bio_ag = (1- frroot_act) * this.bio_opt; // actual aboveground biomass on the day of harvest
            bioag_act = bio_ag;
        /* if (idValue.getValue() == 6) {
            System.out.println (" frroot_act: " + frroot_act + " - ");
        } */
            
            //double bio_root = (1 - bio_opt) * bio_opt;
            
            
            if (this.fphu_act >= 1.00) {
                double bioag_harvest = bioag_act;
            }
            
            // total yield biomass on the day of harvest
            // @todo harvest options
            // first case: the total biomassis assumed to be yield
            if (this.hvsti <= 1) {
                this.yield = bioag_act * hi_act;
                // double yield_root = bio_root * hi_act;
            }
            // second case: a portion of the total biomass is assumed to be yield
            else if (this.hvsti > 1)											// bio is the total biomass on the day of the harvest (kg/ha)
            {
                this.yield = bio_opt * (1 - (1/(1+ hi_act)));
            }
           // if (idValue.getValue() == 6) {
             //   System.out.println(" hi_act: " + hi_act +  " hvsti: " + hvsti +  " fphu: " + fphu_act + " - ");
           // }
            // Amounts of nitrogen [kg N/ha](and who wants P) to be removed from the field
            // whereas cnyld is the fraction of N being removed by the field crop
            
           this.yldNaCl = bioNaCl_act * (this.yield/bio_opt);
            //System.out.println (" Julianischer Tag "+ Attribute.Calendar.DAY_OF_YEAR + " hi_act: " + hi_act +  " hvsti: " + hvsti +  " fphu: " + fphu_act + " yldN " + yldN + " yield " + yield);
            //double yldP = this.cpyld * yield;
            
            fracharvest = 1 - (yield / bio_opt);
            fracharvestNaCl = 1 - (yldNaCl / bioNaCl_act);
        }
        return true;
    }
    private double calc_cropyield_ha() {
        
        this.yldNaCl_ha = this.yldNaCl * area_ha / 10000;
        
        return yldNaCl_ha;
    }
    
    private boolean calc_residues() {
        if ( this.idc == 7) {
            this.addresidue_pool =  this.yield;
            this.addresidue_poolNaCl = this.yldNaCl;
        } else if ( this.idc == 1 || this.idc == 2 || this.idc == 4 || this.idc == 5) {
            this.addresidue_pool =  this.bio_opt - this.yield  ;
            this.addresidue_poolNaCl = this.bioNaCl_act - this.yldNaCl;
        } else if ( this.idc == 6 || this.idc == 3){
            this.addresidue_pool =  this.yield * 0.1;
            this.addresidue_poolNaCl = this.yldNaCl * 0.1;
            this.addresidue_pool = Math.min(this.addresidue_pool, this.bio_opt);
            this.addresidue_poolNaCl = Math.min(this.addresidue_poolNaCl, this.bioNaCl_act);
            this.bio_opt = this.bio_opt - this.addresidue_pool;
            this.bioNaCl_act = this.bioNaCl_act - this.addresidue_poolNaCl;
        }
        return true;
        
    }
    public void cleanup()throws Attribute.Entity.NoSuchAttributeException{
        // store.close();
    }
    
// public Attribute.Entity getEntityID() {
//   return entityID;
//}
    
}
//   is modeled according to the following 9 EC-growth stages
//    (0)   Keimung
//    (1)   Keimtriebentwicklung (Blattentwicklung)
//    (2)   Bestockung
//    (3)   Schossen (Hauptrieb)
//    (4)   Ã„hren- und Rispenschwellen
//    (5)   Ã„hren- und Rispenschieben
//    (6)   Blüte
//    (7)   Fruchtbildung
//    (8)   Samenreife
//    (9)   Absterben

// setze Bedingungen für einzelne Pflanzenentwicklungszustände

  /*  double CHU = CHU + (this.tmean - this.tbase); //phänologisch wirksame Temperatursumme
    int julday = time.get(time.JULDAY);
    double CJD = CJD++; */

  /*  private boolean calc_ps() {
    if (Keimung)
        if CHU = PHU[PS] || CJD >= PJD[PS];
        Keimung;
        CJD = 0;
        CHU = 0;
        PS = PS++;
   
    if ()
        return true;
    }
   **/
