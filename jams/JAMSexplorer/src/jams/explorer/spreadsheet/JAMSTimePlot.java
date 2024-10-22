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

//import com.sun.image.codec.jpeg.JPEGCodec;
//import com.sun.image.codec.jpeg.JPEGEncodeParam;
//import com.sun.image.codec.jpeg.JPEGImageEncoder;
import java.awt.BorderLayout;
import java.awt.Color;
import java.awt.Rectangle;
import java.text.SimpleDateFormat;
import java.util.HashMap;
import java.util.Vector;
import javax.swing.JButton;
import javax.swing.JPanel;
import org.jfree.chart.ChartFactory;
import org.jfree.chart.ChartPanel;
import org.jfree.chart.JFreeChart;
import org.jfree.chart.axis.DateAxis;
import org.jfree.chart.axis.NumberAxis;
import org.jfree.chart.axis.ValueAxis;
import org.jfree.chart.plot.DatasetRenderingOrder;
import org.jfree.chart.plot.XYPlot;
import org.jfree.chart.axis.AxisLocation;
import org.jfree.chart.renderer.xy.XYAreaRenderer;
import org.jfree.chart.renderer.xy.XYBarRenderer;
import org.jfree.chart.renderer.xy.XYDifferenceRenderer;
import org.jfree.chart.renderer.xy.XYDotRenderer;
import org.jfree.chart.renderer.xy.XYItemRenderer;
import org.jfree.chart.renderer.xy.XYLineAndShapeRenderer;
import org.jfree.chart.renderer.xy.XYStepAreaRenderer;
import org.jfree.chart.renderer.xy.XYStepRenderer;
import org.jfree.data.time.TimeSeriesCollection;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.OutputStream;
import org.apache.xmlgraphics.java2d.ps.*;

/**
 *
 * @author Robert Riedel
 */
public class JAMSTimePlot {

    Vector<GraphProperties> propVector;
    DateAxis dateAxis;
    ValueAxis axisLEFT;
    ValueAxis axisRIGHT;
    int graphCount=0;
    int graphCountRight=0;
    int graphCountLeft=0;
    
    double weight;

    String xAxisTitle;
    String leftAxisTitle;
    String rightAxisTitle;
    String title;

    ChartPanel chartPanel;
    
    TimeSeriesCollection dataLeft = new TimeSeriesCollection();
    TimeSeriesCollection dataRight = new TimeSeriesCollection();
    XYItemRenderer rightRenderer, leftRenderer;
    XYPlot plot;
    JFreeChart chart;
    JPanel panel;
    
    JButton saveButton;

    HashMap<String, Color> colorTable = new HashMap<String, Color>();
    
    public JAMSTimePlot() {
        
        colorTable.put("yellow", Color.yellow);
        colorTable.put("orange", Color.orange);
        colorTable.put("red", Color.red);
        colorTable.put("pink", Color.pink);
        colorTable.put("magenta", Color.magenta);
        colorTable.put("cyan", Color.cyan);
        colorTable.put("blue", Color.blue);
        colorTable.put("green", Color.green);
        colorTable.put("gray", Color.gray);
        colorTable.put("lightgray", Color.lightGray);
        colorTable.put("black", Color.black);
        
        setDefaultValues();
        
    }
    
    public JAMSTimePlot(Vector<GraphProperties> propVector) {
        
        this.propVector = propVector;
        
        colorTable.put("yellow", Color.yellow);
        colorTable.put("orange", Color.orange);
        colorTable.put("red", Color.red);
        colorTable.put("pink", Color.pink);
        colorTable.put("magenta", Color.magenta);
        colorTable.put("cyan", Color.cyan);
        colorTable.put("blue", Color.blue);
        colorTable.put("green", Color.green);
        colorTable.put("gray", Color.gray);
        colorTable.put("lightgray", Color.lightGray);
        colorTable.put("black", Color.black);
        
        setDefaultValues();
        
    }
    
    public XYPlot getXYPlot(){
        return chart.getXYPlot();
    }
    
    public DateAxis getDateAxis(){
        return dateAxis;
    }
    
    public void setDefaultValues(){

            String xAxisTitle = "x axis title";
            String leftAxisTitle = "left axis title";
            String rightAxisTitle = "right axis title";

            String title = "CTSPlot ver. 1.00";
    }
    public ChartPanel getChartPanel(){
        //createPlot();
        
        return chartPanel;
    }
    
    public BufferedImage getBufferedImage(int width, int height){
        BufferedImage bi = chart.createBufferedImage(width, height);
        return bi;
    }
    
//    public void savePicture(File file, int width, int height){
//        
//        BufferedImage bi = chart.createBufferedImage(width, height);
//        
//        try{
//	    // jpeg encoding
//            
//            FileOutputStream out = new FileOutputStream(file);
//            
//            //ByteArrayOutputStream out = new ByteArrayOutputStream();
//            JPEGImageEncoder encoder = JPEGCodec.createJPEGEncoder(out);
//            JPEGEncodeParam param = encoder.getDefaultJPEGEncodeParam(bi); 
//            param.setQuality(1.0f, false);
//            encoder.setJPEGEncodeParam(param);
//            encoder.encode(bi);
//        }
//        catch(Exception ex){
//        }
//    }
    
    public void saveAsEPS(File outfile){
        
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
    
    public JPanel getPanel() {
        
        return panel;
    }
    
    public JFreeChart getChart(){
        return chart;
    }
    
    public void removeLegendAndXAxis(){
        chart.removeLegend();
        dateAxis.setVisible(false);
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
                r = new XYBarRenderer();
                break;
                
            case 2:
                r = new XYAreaRenderer();
                break;
                
            case 3:
                lsr = new XYLineAndShapeRenderer();
                lsr.setBaseShapesVisible(true);
                r = lsr;
                break;
                
            case 4:
                XYDotRenderer dotR = new XYDotRenderer();
                dotR.setDefaultEntityRadius(2);
                dotR.setDotHeight(5);
                dotR.setDotWidth(5);
                r = dotR;
                break;
                
            case 7:
                r = new XYDifferenceRenderer();
                break;
                
            case 5:
                r = new XYStepRenderer();
                break;
                
            case 6:
                r = new XYStepAreaRenderer();
                break;
                
            default:
                lsr = new XYLineAndShapeRenderer();
                lsr.setBaseShapesVisible(false);
                r = lsr;
        }
        return r;
    }
 
    public void createPlot() {

        chart = ChartFactory.createTimeSeriesChart(
                "title",
                "xAxisTitle",
                "leftAxisTitle",
                dataLeft,
                true,
                false,
                false);
        
        chartPanel = new ChartPanel(chart, true);
        chartPanel.setBackground(Color.WHITE);
        
        panel = new JPanel();
        
        panel.setLayout(new BorderLayout());
        panel.setBackground(Color.WHITE);
        
        panel.add(chartPanel, BorderLayout.CENTER);
        panel.add(chartPanel);
        
        plot = chart.getXYPlot();
        
        DateAxis dateAxis = (DateAxis) plot.getDomainAxis();
        dateAxis.setDateFormatOverride(new SimpleDateFormat("dd-MM-yyyy"));

        axisLEFT = new NumberAxis(leftAxisTitle);
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
        int right = 0;
        dataLeft = new TimeSeriesCollection();
        DateAxis dateAxis = (DateAxis) plot.getDomainAxis();
   
        axisLEFT.setInverted(inverted);
        axisLEFT.setLabel(nameLeft);
        dateAxis.setLabel(xAxisTitle);

        for(int k=0; k<c; k++){ 
            
            GraphProperties prop = propVector.get(k);
            if(propVector.get(k).getPosition() == 0){
                plot_count++;
                //GraphProperties prop = propVector.get(k);
                dataLeft.addSeries(prop.getTS());
                dataRight.removeSeries(prop.getTS());

            }else{
                dataLeft.removeSeries(prop.getTS());
                right++;

            }
        }
      
        if(right == 0){
            dataRight.removeAllSeries();
            axisRIGHT.setVisible(false);
            axisLEFT.setVisible(true);
            plot.setRangeAxisLocation(0, AxisLocation.BOTTOM_OR_LEFT);
            plot.setRangeAxis(0, axisLEFT);
            plot.setDataset(0, dataLeft);
            
            plot.setRenderer(0, leftRenderer);
            plot.mapDatasetToRangeAxis(0, 0);
            
        } else {
            axisRIGHT.setVisible(true);
            plot.setRangeAxisLocation(0, AxisLocation.BOTTOM_OR_LEFT);
            plot.setRangeAxis(0, axisLEFT);
            plot.setDataset(0, dataLeft);
            plot.setRenderer(0, leftRenderer);
            plot.mapDatasetToRangeAxis(0, 0);
        }
        
    }
    
    public void setTitle(String title){
        chart.setTitle(title);
    }
    
    public String getTitle(){
        return title;
    }
    
    public void setWeight(double weight){
        this.weight = weight;
        
    }
    
    public double getWeight(){
        return this.weight;
    }
    
    public void plotEmpty(){
           
        int plot_count = 0;
        int c = propVector.size();
        int corr = 0;
        dataLeft = new TimeSeriesCollection();
        //ValueAxis xAxis = plot.getDomainAxis();
        
        axisLEFT.setInverted(false);
        axisLEFT.setLabel("Left axis title");
        
        leftRenderer = getRenderer(0);
        
        dataLeft.removeAllSeries();
        dataRight.removeAllSeries();
              
        axisRIGHT.setVisible(false);
        axisLEFT.setVisible(true);
        plot.setRangeAxisLocation(0, AxisLocation.BOTTOM_OR_LEFT);
        plot.setRangeAxis(0, axisLEFT);
        plot.setDataset(0, dataLeft);
        plot.setRenderer(0, leftRenderer);
        
        plot.mapDatasetToRangeAxis(0, 0);

  
    }
    
    public void setDateFormat(boolean yy, boolean mm, boolean dd, boolean hm){
        String timeFormat = ""; //"dd-MM-yyyy"
            if(dd){ timeFormat+= "dd. "; }
            if(mm){ timeFormat+= "MM. "; }
            if(yy){ timeFormat+= "yyyy "; }
            if(hm){ timeFormat+= "hh:mm"; }
        dateAxis = (DateAxis) plot.getDomainAxis();
        dateAxis.setDateFormatOverride(new SimpleDateFormat(timeFormat));    
    }
    
    public void plotRight(XYItemRenderer rightRenderer, String nameRight, String xAxisTitle, boolean inverted){
        
        int plot_count = 0;
        int c = propVector.size();
        int left = 0;
        dataRight = new TimeSeriesCollection();
        DateAxis dateAxis = (DateAxis) plot.getDomainAxis();
        dateAxis.setLabel(xAxisTitle);
        
        //rightRenderer = getRenderer(renderer);
        axisRIGHT.setInverted(inverted);
        axisRIGHT.setLabel(nameRight);
        
        for(int k=0; k<c; k++){

            GraphProperties prop = propVector.get(k);
            if(propVector.get(k).getPosition() == 1){
               plot_count++;
                //GraphProperties prop = propVector.get(k);
                dataRight.addSeries(prop.getTS());
                dataLeft.removeSeries(prop.getTS());

            }else{
                left++;
                dataRight.removeSeries(prop.getTS());
            }
        }
 
        if(left == 0){
            dataLeft.removeAllSeries();     
            axisLEFT.setVisible(false);
            axisRIGHT.setVisible(true);
            plot.setRangeAxisLocation(1, AxisLocation.BOTTOM_OR_RIGHT);
            plot.setRangeAxis(1, axisRIGHT);
            plot.setDataset(1, dataRight);
            plot.setRenderer(1, rightRenderer);
            plot.mapDatasetToRangeAxis(1, 1);
        } else {
            axisLEFT.setVisible(true);
            plot.setRangeAxisLocation(1, AxisLocation.BOTTOM_OR_RIGHT);
            plot.setRangeAxis(1, axisRIGHT);
            plot.setDataset(1, dataRight);
            plot.setRenderer(1, rightRenderer);
            plot.mapDatasetToRangeAxis(1, 1);
        }
       
        plot.setDatasetRenderingOrder(DatasetRenderingOrder.REVERSE);
    }

    
    public void cleanup() {

    }
    
}

