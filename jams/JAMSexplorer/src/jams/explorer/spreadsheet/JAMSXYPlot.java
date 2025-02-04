/*
 * JAMSTimePlot.java
 * Created on 21. Juni 2006, 22:06
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

package jams.explorer.spreadsheet;

import jams.JAMS;
import java.awt.BorderLayout;
import java.awt.Color;
import java.awt.Rectangle;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.OutputStream;
import java.util.HashMap;
import java.util.Vector;
import javax.swing.JButton;
import javax.swing.JPanel;
import org.apache.xmlgraphics.java2d.ps.EPSDocumentGraphics2D;
import org.jfree.chart.ChartFactory;
import org.jfree.chart.ChartPanel;
import org.jfree.chart.JFreeChart;
import org.jfree.chart.axis.NumberAxis;
import org.jfree.chart.axis.ValueAxis;
import org.jfree.chart.axis.AxisLocation;
import org.jfree.chart.plot.DatasetRenderingOrder;
import org.jfree.chart.plot.XYPlot;
import org.jfree.chart.renderer.xy.XYAreaRenderer;
import org.jfree.chart.renderer.xy.XYBarRenderer;
import org.jfree.chart.renderer.xy.XYDifferenceRenderer;
import org.jfree.chart.renderer.xy.XYDotRenderer;
import org.jfree.chart.renderer.xy.XYItemRenderer;
import org.jfree.chart.renderer.xy.XYLineAndShapeRenderer;
import org.jfree.chart.renderer.xy.XYStepAreaRenderer;
import org.jfree.chart.renderer.xy.XYStepRenderer;
import org.jfree.data.xy.*;

/**
 *
 * @author Robert Riedel
 */
public class JAMSXYPlot {

    Vector<GraphProperties> propVector;
    ValueAxis xAxis;
    ValueAxis axisLEFT;
    ValueAxis axisRIGHT;
    int graphCount=0;
    int graphCountRight=0;
    int graphCountLeft=0;

    String xAxisTitle;
    String leftAxisTitle;
    String rightAxisTitle;
    String title;

    ChartPanel chartPanel;
    
    XYSeriesCollection dataLeft = new XYSeriesCollection();
    XYSeriesCollection dataRight = new XYSeriesCollection();
    XYItemRenderer rightRenderer, leftRenderer;
    XYPlot plot;
    JFreeChart chart;
    JPanel panel;
    JButton saveButton;

    HashMap<String, Color> colorTable = new HashMap<String, Color>();
    
    public JAMSXYPlot() {
        
        colorTable.put(JAMS.i18n("YELLOW"), Color.yellow);
        colorTable.put(JAMS.i18n("ORANGE"), Color.orange);
        colorTable.put(JAMS.i18n("RED"), Color.red);
        colorTable.put(JAMS.i18n("PINK"), Color.pink);
        colorTable.put(JAMS.i18n("MAGENTA"), Color.magenta);
        colorTable.put(JAMS.i18n("CYAN"), Color.cyan);
        colorTable.put(JAMS.i18n("BLUE"), Color.blue);
        colorTable.put(JAMS.i18n("GREEN"), Color.green);
        colorTable.put(JAMS.i18n("GRAY"), Color.gray);
        colorTable.put(JAMS.i18n("LIGHTGRAY"), Color.lightGray);
        colorTable.put(JAMS.i18n("BLACK"), Color.black);
        
        setDefaultValues();
        
    }
    
    public JAMSXYPlot(Vector<GraphProperties> propVector) {
        
        this.propVector = propVector;
        
        colorTable.put(JAMS.i18n("YELLOW"), Color.yellow);
        colorTable.put(JAMS.i18n("ORANGE"), Color.orange);
        colorTable.put(JAMS.i18n("RED"), Color.red);
        colorTable.put(JAMS.i18n("PINK"), Color.pink);
        colorTable.put(JAMS.i18n("MAGENTA"), Color.magenta);
        colorTable.put(JAMS.i18n("CYAN"), Color.cyan);
        colorTable.put(JAMS.i18n("BLUE"), Color.blue);
        colorTable.put(JAMS.i18n("GREEN"), Color.green);
        colorTable.put(JAMS.i18n("GRAY"), Color.gray);
        colorTable.put(JAMS.i18n("LIGHTGRAY"), Color.lightGray);
        colorTable.put(JAMS.i18n("BLACK"), Color.black);
        
        setDefaultValues();
        
    }
    
    public void setDefaultValues(){

            String xAxisTitle = JAMS.i18n("X_AXIS_TITLE");
            String leftAxisTitle = JAMS.i18n("LEFT_AXIS_TITLE");
            String rightAxisTitle = JAMS.i18n("RIGHT_AXIS_TITLE");
            String title = JAMS.i18n("XYPLOT_ALPHA");
    }
    public ChartPanel getChartPanel(){
        //createPlot();
        
        return chartPanel;
    }
    
    public JPanel getPanel() {
        
        return panel;
    }
    
    public JFreeChart getChart(){
        return chart;
    }
    
    public BufferedImage getBufferedImage(int w, int h){
        BufferedImage bi = chart.createBufferedImage(w, h);
        return bi;
    }
    
    public void saveAsEPS( File outfile){
        
     try{ 
        
      OutputStream out = new java.io.FileOutputStream(outfile);
      EPSDocumentGraphics2D g2d = new EPSDocumentGraphics2D(false);
      g2d.setGraphicContext(new org.apache.xmlgraphics.java2d.GraphicContext());
      int width = 600;
      int height = 400;
      g2d.setupDocument(out, width, height); //400pt x 200pt
      this.chart.draw(g2d,new Rectangle(width,height));
      g2d.finish();
      out.flush();
      out.close();
      
      }catch(Exception fnfe){}
   } 
    
    private XYItemRenderer getRenderer(int type) {
        XYItemRenderer r;
        switch (type) {
            case 0:
                XYLineAndShapeRenderer lsr = new XYLineAndShapeRenderer();
                lsr.setBaseShapesVisible(false);
                r = lsr;
                break;
                
            case 1:
                XYBarRenderer br = new XYBarRenderer();
                br.setDrawBarOutline(true);
                
                //br.setBase(0.1);
                //br.setUseYInterval(true);
                br.setMargin(0.98);
                r = br;
                
                break;
                
            case 2:
                r = new XYAreaRenderer();
                break;
                
            case 3:
                lsr = new XYLineAndShapeRenderer();
                lsr.setBaseShapesVisible(true);
                lsr.setShapesFilled(true);
                lsr.setSeriesLinesVisible(0, false);
                //lsr.setDrawOutlines(false);
                //lsr.setLegendLine(new java.awt.Rectangle(5,5));
                r = lsr;
                break;
                
            case 4:
                XYDotRenderer dotR = new XYDotRenderer();
                dotR.setDefaultEntityRadius(2);
                dotR.setSeriesShape(0, new java.awt.Rectangle(5,5));
                //dotR.setSeriesShape(new java.awt.geom.RoundRectangle2D.Double());
                dotR.setDotHeight(5);
                dotR.setDotWidth(5);
                r = dotR;
                break;
      
            case 5:
                r = new XYStepRenderer();
                break;
                
            case 6:
                r = new XYStepAreaRenderer();
                break;
                
            case 7:
                r = new XYDifferenceRenderer();
                break;    
                
            default:
                lsr = new XYLineAndShapeRenderer();
                lsr.setBaseShapesVisible(false);
                r = lsr;
        }
        return r;
    }
    
    
    public void createPlot() {

        chart = ChartFactory.createXYLineChart(
                JAMS.i18n("CHART_TITLE"),
                JAMS.i18n("CHART_AXIS_TITLE_DEFAULT1"),
                JAMS.i18n("CHART_AXIS_TITLE_DEFAULT2"),
                dataLeft,
                org.jfree.chart.plot.PlotOrientation.VERTICAL,
                true,
                false,
                false);
        
        chartPanel = new ChartPanel(chart, true);
        chartPanel.setBackground(Color.WHITE);
        
        panel = new JPanel();
            panel.setLayout(new BorderLayout());
        //panel.setBackground(Color.WHITE);
        panel.add(chartPanel, BorderLayout.CENTER);
        
        plot = chart.getXYPlot();
        
        xAxis = plot.getDomainAxis();
        plot.setRangeAxisLocation(AxisLocation.BOTTOM_OR_LEFT);
        
        axisLEFT = plot.getRangeAxis();
        axisRIGHT = new NumberAxis(rightAxisTitle);
        

    }
    
    public void setPropVector(Vector<GraphProperties> propVector){
        
        this.propVector = propVector;
    }
    
    public Vector<GraphProperties> getPropVector(){
        
        return this.propVector;
    }
        
    public void plotLeft(XYItemRenderer leftRenderer, String nameLeft, String xAxisTitle, boolean inverted){ //plotLeft(renderer, axisname, inverted)
        int plot_count = 0;
        int c = propVector.size();
        int corr = 0;
        dataLeft = new XYSeriesCollection();
        //ValueAxis xAxis = plot.getDomainAxis();
        
        axisLEFT.setInverted(inverted);
        axisLEFT.setLabel(nameLeft);
        xAxis.setLabel(xAxisTitle);
        
        //dataRight.removeAllSeries();
        
        //leftRenderer = getRenderer(renderer);
        
        for(int k=0; k<c; k++){ 
            
            if(!propVector.get(k).isXSeries()){
                if(propVector.get(k).getPosition() == 0){
                    plot_count++;
                    GraphProperties prop = propVector.get(k);
                    dataLeft.addSeries(prop.getXYS());
                    //
                        dataRight.removeSeries(prop.getXYS());
                    //}
                    //leftRenderer.setSeriesPaint(k-corr,colorTable.get((String)prop.getColorChoice().getSelectedItem()));
                }else{
                    corr++;
                }
            }else{
                corr++;
            }
        }
        //if((plot_count<2 || plot_count>2) && renderer == 7) leftRenderer = getRenderer(0);
        
        if(corr == 0){
            dataRight.removeAllSeries();
            axisRIGHT.setVisible(false);
            axisLEFT.setVisible(true);
            plot.setRangeAxisLocation(0, AxisLocation.BOTTOM_OR_LEFT);
            plot.setRangeAxis(0, axisLEFT);
            plot.setDataset(0, dataLeft);
            plot.setRenderer(0, leftRenderer);
        }
        
        if(corr == 1){
            dataRight.removeAllSeries();
            axisRIGHT.setVisible(false);
            axisLEFT.setVisible(true);
            plot.setRangeAxisLocation(0, AxisLocation.BOTTOM_OR_LEFT);
            plot.setRangeAxis(0, axisLEFT);
            plot.setDataset(0, dataLeft);
            plot.setRenderer(0, leftRenderer);
        } else {
            axisRIGHT.setVisible(true);
            plot.setRangeAxisLocation(0, AxisLocation.BOTTOM_OR_LEFT);
            plot.setRangeAxis(0, axisLEFT);
            plot.setDataset(0, dataLeft);
            plot.setRenderer(0, leftRenderer);
            plot.mapDatasetToRangeAxis(0, 0);
        }
        
        plot.setDomainAxis(0, xAxis);
        //plot.mapDatasetToDomainAxis(0, 0); //dataset einer achse zuordnen!
        
    }
    
    public void plotEmpty(){
           
        int plot_count = 0;
        int c = propVector.size();
        int corr = 0;
        dataLeft = new XYSeriesCollection();
        //ValueAxis xAxis = plot.getDomainAxis();
        
        axisLEFT.setInverted(false);
        axisLEFT.setLabel(JAMS.i18n("LEFT_AXIS_TITLE"));
        xAxis.setLabel(xAxisTitle);
        
        leftRenderer = getRenderer(0);
        
        dataLeft.removeAllSeries();
        dataRight.removeAllSeries();
              
        axisRIGHT.setVisible(false);
        axisLEFT.setVisible(true);
        plot.setRangeAxisLocation(0, AxisLocation.BOTTOM_OR_LEFT);
        plot.setRangeAxis(0, axisLEFT);
        plot.setDataset(0, dataLeft);
        plot.setRenderer(0, leftRenderer);
        
        plot.setDomainAxis(0, xAxis);
        plot.mapDatasetToRangeAxis(0, 0);
        plot.setDomainAxis(0, xAxis);
  
    }
    
    public void setTitle(String title){
        chart.setTitle(title);
    }
    
    public void plotRight(XYItemRenderer rightRenderer, String nameRight, String xAxisTitle, boolean inverted){
        int plot_count = 0;
        int c = propVector.size();
        int corr = 0;
        dataRight = new XYSeriesCollection();
        
        
        
        xAxis.setLabel(xAxisTitle);
        
        //rightRenderer = getRenderer(renderer);
        
        for(int k=0; k<c; k++){

            if(!propVector.get(k).isXSeries()){
                if(propVector.get(k).getPosition() == 1){
                    plot_count++;
                    GraphProperties prop = propVector.get(k);
                    dataRight.addSeries(prop.getXYS());
                    //if(corr <=dataLeft.getSeriesCount()){
                        dataLeft.removeSeries(prop.getXYS());
                    //}
                    //rightRenderer.setSeriesPaint(k-corr,colorTable.get((String)prop.getColorChoice().getSelectedItem()));
                } else {
                    corr++;
                }
            } else {
                corr++;
            }
        }
        //if((plot_count<2 || plot_count>2) && renderer == 7) leftRenderer = getRenderer(0);
        
        if(corr == 0){
            dataLeft.removeAllSeries();
            axisLEFT.setVisible(false);
            axisRIGHT.setVisible(true);
            axisRIGHT.setInverted(inverted);
            axisRIGHT.setLabel(nameRight);
            plot.setRangeAxis(1, axisRIGHT);
            plot.setRangeAxisLocation(1, AxisLocation.BOTTOM_OR_RIGHT);
            plot.setDataset(1, dataRight);
            plot.setRenderer(1, rightRenderer);
        }
        if(corr == 1){
            dataLeft.removeAllSeries();
            axisLEFT.setVisible(false);
            axisRIGHT.setVisible(true);
            axisRIGHT.setInverted(inverted);
            axisRIGHT.setLabel(nameRight);
            plot.setRangeAxis(1, axisRIGHT);
            plot.setRangeAxisLocation(1, AxisLocation.BOTTOM_OR_RIGHT);
            plot.setDataset(1, dataRight);
            plot.setRenderer(1, rightRenderer);
        } else {
            axisLEFT.setVisible(true);
            axisRIGHT.setInverted(inverted);
            axisRIGHT.setLabel(nameRight);
            plot.setRangeAxis(1, axisRIGHT);
            plot.setRangeAxisLocation(1, AxisLocation.BOTTOM_OR_RIGHT);
            plot.setDataset(1, dataRight);
            plot.setRenderer(1, rightRenderer);
            plot.mapDatasetToRangeAxis(1, 1);
    
        }
        plot.setDatasetRenderingOrder(DatasetRenderingOrder.REVERSE);
        plot.setDomainAxis(0, xAxis);

    }    
}

