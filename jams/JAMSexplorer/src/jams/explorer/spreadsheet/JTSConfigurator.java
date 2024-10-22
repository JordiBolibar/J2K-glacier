/*
 * CTSConfigurator.java
 *
 * Created on 2. September 2007, 00:40
 *
 * To change this template, choose Tools | Template Manager
 * and setWorkspace the template in the editor.
 */
package jams.explorer.spreadsheet;

import jams.data.Attribute;
import jams.data.DefaultDataFactory;
import java.util.HashMap;
import java.util.Vector;
import java.awt.event.*;
import java.awt.*;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.util.Properties;
import java.util.StringTokenizer;
import javax.swing.*;
import javax.swing.BorderFactory.*;
import javax.swing.border.*;
import javax.swing.GroupLayout.*;

import org.jfree.chart.renderer.xy.XYAreaRenderer;
import org.jfree.chart.renderer.xy.XYBarRenderer;
import org.jfree.chart.renderer.xy.XYDifferenceRenderer;
import org.jfree.chart.renderer.xy.XYItemRenderer;
import org.jfree.chart.renderer.xy.XYLineAndShapeRenderer;
import org.jfree.chart.renderer.xy.XYStepAreaRenderer;
import org.jfree.chart.renderer.xy.XYStepRenderer;

import jams.gui.tools.GUIHelper;
import jams.gui.WorkerDlg;
import jams.workspace.JAMSWorkspace;
import java.io.BufferedReader;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import jams.explorer.JAMSExplorer;

/**
 *
 * @author Robert Riedel
 */
public class JTSConfigurator extends JFrame {
    
    private JAMSWorkspace workspace;
    
    GroupLayout gLayout;
    GroupLayout.SequentialGroup hGroup;
    GroupLayout.SequentialGroup vGroup;
    Group group1;
    Group group2;
    Group group3;
    Group group4;
    Group group5;
    Group group6;
    Group group7;
    Group group8;
    Group group9;
    Group group10;
    Group group11;
    Group group12;
    Group group13;
    Group group14;
    Group group15;

//    private Vector<ActionListener> addAction = new Vector<ActionListener>();
    private JTSConfigurator thisJTS = this;

    private JFrame parent;
    private JPanel frame;
    private JPanel mainpanel;
    private JPanel plotpanel;
    private JPanel optionpanel;
    private JPanel graphpanel;
    private JPanel southpanel;
    //private Vector<JPanel> datapanels = new Vector<JPanel>();
    private JPanel edTitlePanel;
    private JPanel edLeftAxisPanel;
    private JPanel edRightAxisPanel;
    private JPanel savePanel;

    private File templateFile;

    private JSplitPane split_hor = new JSplitPane(JSplitPane.HORIZONTAL_SPLIT);
    private JSplitPane split_vert = new JSplitPane(JSplitPane.VERTICAL_SPLIT);

    private JScrollPane graphScPane;
    private JScrollPane optScPane;

    private String[] headers;
    private boolean output_ttp = false;
    private int rows_cnt;
    private Vector<double[]> arrayVector;
    private Vector<Attribute.Calendar> timeVector;

    private JLabel edTitle = new JLabel("Plot Title: ");
    private JLabel edLeft = new JLabel("Left axis title: ");
    private JLabel edXAxis = new JLabel("X axis title");
    private JLabel edRight = new JLabel("Right axis title: ");
    private JLabel rLeftLabel = new JLabel("Renderer left");
    private JLabel rRightLabel = new JLabel("Renderer right");
//    private JLabel invLeftLabel = new JLabel("Invert left axis");
//    private JLabel invRightLabel = new JLabel("Invert right axis");
    private JLabel timeFormatLabel = new JLabel("Time format");
    private JTextField edTitleField = new JTextField(14);
    private JTextField edLeftField = new JTextField(14);
    private JTextField edRightField = new JTextField(14);
    private JTextField edXAxisField = new JTextField(14);

    private String[] types = {"Line and Shape", "Bar", "Area", "Step", "StepArea", "Difference"};

    private JComboBox rLeftBox = new JComboBox(types);
    private JComboBox rRightBox = new JComboBox(types);
    private JCheckBox invLeftBox = new JCheckBox("Invert left Axis");
    private JCheckBox invRightBox = new JCheckBox("Invert right Axis");
    private JCheckBox timeFormat_yy = new JCheckBox("yy");
    private JCheckBox timeFormat_mm = new JCheckBox("mm");
    private JCheckBox timeFormat_dd = new JCheckBox("dd");
    private JCheckBox timeFormat_hm = new JCheckBox("hh:mm");

    private JButton applyButton = new JButton("PLOT");
    private JButton addButton = new JButton("Add Graph");
    private JButton saveButton = new JButton("EPS export");
    private JButton saveTempButton = new JButton("Save Template");
    private JButton loadTempButton = new JButton("Load Template");
    
//    private final String INFO_MSG_SAVETEMP = "Please choose a template filename:";
    

    private Vector<GraphProperties> propVector = new Vector<GraphProperties>();
    private Vector<PropertyPanel> panelVector = new Vector<PropertyPanel>();

    private JAMSTimePlot jts = new JAMSTimePlot();

    //private static JFileChooser templateChooser;
    private JAMSSpreadSheet sheet;

    private int index;

    private int colour_cnt;

    HashMap<String, Color> colorTable = new HashMap<String, Color>();

    int[] rows, columns;

    JTable table;

    CTSPlot ctsplot;

    /*buttons*/
    int columnCount = 0;
    int graphCount = 0;
//    Vector<JCheckBox> activate = new Vector<JCheckBox>();
//    Vector<JComboBox> datachoice = new Vector<JComboBox>();
//    Vector<JComboBox> poschoice = new Vector<JComboBox>();
//    Vector<JComboBox> typechoice = new Vector<JComboBox>();
//    Vector<JComboBox> colorchoice = new Vector<JComboBox>();

    JCheckBox[] activate;
    JComboBox[] datachoice;
    JComboBox[] poschoice;
    JComboBox[] typechoice;
    JComboBox[] colorchoice;

    /* ActionListener */
    ActionListener[] activationChange;

    /** Creates a new instance of CTSConfigurator */
    public JTSConfigurator() {
        /* setWorkspace CTSConf */
    }
    /*
    public CTSConfigurator(JAMSTableModel tmodel){
    this.tmodel = tmodel;
    }
     **/

    public JTSConfigurator(JFrame parent, JAMSSpreadSheet sheet, JAMSExplorer explorer) {

//        super(parent, "JAMS JTS Viewer");
        this.setParent(parent);
        this.setIconImage(parent.getIconImage());

        this.setDefaultCloseOperation(WindowConstants.DISPOSE_ON_CLOSE);
        explorer.registerChild(this);

        setTitle(SpreadsheetConstants.DLG_TITLE_JTSCONFIGURATOR);
        
        this.workspace = explorer.getWorkspace();
        
        setLayout(new FlowLayout());
        Point parentloc = parent.getLocation();
        setLocation(parentloc.x + 30, parentloc.y + 30);

        this.sheet = sheet;
        this.table = sheet.table;
        
        this.columnCount = table.getColumnCount();
        this.rows = table.getSelectedRows();
        this.columns = table.getSelectedColumns();
        this.graphCount = columns.length;
        /* If time column is selected
         */
        try{

            if(columns[0]==0){
                    graphCount -= 1;
                    int[] arraycopy = new int[graphCount];
                    java.lang.System.arraycopy(columns, 1, arraycopy, 0, graphCount);
                    columns = arraycopy;
            }

         }catch(ArrayIndexOutOfBoundsException arrex){
         
         }

        this.headers = new String[graphCount];/* hier aufpassen bei reselection xxx reselecton -> neue instanz */

//        this.legendEntries = new String[graphCount];

        for(int k=0;k<graphCount;k++){
            headers[k] = table.getColumnName(columns[k]);
        }


        //setPreferredSize(new Dimension(1024, 768));
        //setMinimumSize(new Dimension(680,480));
        createPanel();
        pack();
        setVisible(true);

    }

    public JTSConfigurator(JFrame parent, JAMSSpreadSheet sheet, File templateFile, JAMSExplorer explorer) {

//        super(parent, "JAMS JTS Viewer");
        this.setParent(parent);
        this.setIconImage(parent.getIconImage());

        this.setDefaultCloseOperation(WindowConstants.DISPOSE_ON_CLOSE);
        explorer.registerChild(this);

        setTitle("JTS Viewer");
        
        this.workspace = explorer.getWorkspace();
        
        setLayout(new FlowLayout());
        Point parentloc = parent.getLocation();
        setLocation(parentloc.x + 30, parentloc.y + 30);
        
        //check for output template
        Properties properties = new Properties();
        String output_type = new String();
        
        this.templateFile = templateFile;
        
        try {
            FileInputStream fin = new FileInputStream(templateFile);
            properties.load(fin);
            fin.close();
            output_type = (String) properties.getProperty("output");
            
        } catch (Exception e) {
            output_type = "false";
        }
        
        
        
            this.sheet = sheet;
            this.table = sheet.table;
//            this.templateFile = templateFile;

            this.rows = table.getSelectedRows();
            this.columns = table.getSelectedColumns();
            this.graphCount = columns.length;
             /* If time column is selected
                */
//            if(columns[0]==0){
//                graphCount -= 1;
//                int[] arraycopy = new int[graphCount];
//                java.lang.System.arraycopy(columns, 1, arraycopy, 0, graphCount);
//                columns = arraycopy;
//            }

            this.headers = new String[graphCount];/* hier aufpassen bei reselection xxx reselecton -> neue instanz */

            for(int k=0;k<graphCount;k++){
                headers[k] = table.getColumnName(columns[k]);
            }
//       
        
        setPreferredSize(new Dimension(1024, 768));

        createPanel();

        pack();
        setVisible(true);

    }
    
    

    public void createPanel() {
//        System.out.println("CREATE PANEL TemplateFile = "+templateFile.toString());
        colour_cnt = 0;
        /* create ColorMap */
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

        JLabel nameLabel = new JLabel("Name");
        JLabel posLabel = new JLabel("Position");
        JLabel typeLabel = new JLabel("Renderer");
        JLabel colorLabel = new JLabel("Colour");
        JLabel dataLabel = new JLabel("Select Data / Legend Entry");
        JLabel timeLabel = new JLabel("Time Interval");
        JLabel emptyTimeLabel = new JLabel("    ");
        JLabel legendLabel = new JLabel("Legend Entry");

        nameLabel.setBackground(Color.DARK_GRAY);
        posLabel.setBackground(Color.DARK_GRAY);
        typeLabel.setBackground(Color.DARK_GRAY);
        colorLabel.setBackground(Color.DARK_GRAY);
        dataLabel.setBackground(Color.DARK_GRAY);
        timeLabel.setBackground(Color.DARK_GRAY);

        savePanel = new JPanel();
        GridBagLayout sgbl = new GridBagLayout();
        savePanel.setLayout(sgbl);
        GUIHelper.addGBComponent(savePanel, sgbl, saveButton, 0, 0, 1, 1, 0, 0);
        GUIHelper.addGBComponent(savePanel, sgbl, saveTempButton, 1, 0, 1, 1, 0, 0);
        GUIHelper.addGBComponent(savePanel, sgbl, loadTempButton, 2, 0, 1, 1, 0, 0);

        saveButton.addActionListener(saveImageAction);
        saveTempButton.addActionListener(saveTempListener);
        loadTempButton.addActionListener(loadTempListener);

        setLayout(new BorderLayout());

        plotpanel = new JPanel();
        plotpanel.setLayout(new BorderLayout());

        frame = new JPanel();
        frame.setLayout(new BorderLayout());

        graphScPane = new JScrollPane();

        optionpanel = new JPanel();
        //optionpanel.setLayout(new FlowLayout());
        graphpanel = new JPanel();

        initGroupUI();
        
//        System.out.println("INIT GROUP UI TemplateFile = "+templateFile.toString());
        
        southpanel = new JPanel();
        southpanel.setLayout(new FlowLayout());

        edTitlePanel = new JPanel();
        edTitlePanel.setLayout(new FlowLayout());
        edLeftAxisPanel = new JPanel();
        edLeftAxisPanel.setLayout(new FlowLayout());
        edRightAxisPanel = new JPanel();
        edRightAxisPanel.setLayout(new FlowLayout());

        edTitleField.setText(sheet.getID());
        edTitleField.setSize(40, 10);
        edTitleField.addActionListener(plotbuttonclick);
        //edLeftField.setColumns(20);
        edLeftField.setText("Left Axis Title");
        edLeftField.addActionListener(plotbuttonclick);
        edLeftField.setSize(40, 10);
        //edRightField.setColumns(20);
        edRightField.setText("Right Axis Title");
        edRightField.addActionListener(plotbuttonclick);
        edRightField.setSize(40, 10);

        edXAxisField.setText("Time");
        edXAxisField.addActionListener(plotbuttonclick);
        applyButton.addActionListener(plotbuttonclick);

        optionpanel.add(edTitle);
        optionpanel.add(edTitleField);
        optionpanel.add(edLeft);
        optionpanel.add(edLeftField);
        optionpanel.add(edRight);
        optionpanel.add(edRightField);
        optionpanel.add(applyButton);

        rLeftBox.setSelectedIndex(0);
        rLeftBox.addActionListener(rendererColorListener);
        rRightBox.setSelectedIndex(0);
        rRightBox.addActionListener(rendererColorListener);

        ////////////////////////// RUN GRAPH ///////////
//        System.out.println("RUN GRAPH TemplateFile = "+templateFile.toString());
        if ((templateFile != null) && (templateFile.exists())) {
            try {
                if(!output_ttp){
                    loadTemplate(templateFile);
                }
                else{ 
//                    loadOutputTemplate(templateFile);
                    loadTemplate(templateFile);
                    
                }
            } catch (Exception fnfe) {
//                System.out.println("ERROR");
                Logger.getLogger(JTSConfigurator.class.getName()).log(Level.SEVERE, null, fnfe);
                initGraphLoad();
            }
        } else {
            
            initGraphLoad();
        }

        ////////////////////////////////////////////


        createOptionPanel();
        handleRenderer();
        /* initialise JTSPlot */
        //JAMSTimePlot jts = new JAMSTimePlot(propVector);
        jts.setPropVector(propVector);
        jts.createPlot();

        JPanel graphPanel = new JPanel();
        JPanel optPanel = new JPanel();
        graphPanel.add(graphpanel);
        optPanel.add(optionpanel);

        graphScPane = new JScrollPane(graphPanel);
        graphScPane.setSize(new Dimension(512, 300));
        graphScPane.setVerticalScrollBarPolicy(ScrollPaneConstants.VERTICAL_SCROLLBAR_ALWAYS);
        jts.getPanel().add(savePanel, BorderLayout.SOUTH);

        optionpanel.setBorder(new EtchedBorder());
        optScPane = new JScrollPane(optPanel);
        split_hor.add(optScPane, 0);
        split_hor.add(graphScPane, 1);
        split_vert.add(split_hor, 0);
        split_vert.add(jts.getPanel(), 1);
        add(split_vert);

        jts.setDateFormat(timeFormat_yy.isSelected(), timeFormat_mm.isSelected(),
                timeFormat_dd.isSelected(), timeFormat_hm.isSelected());

        plotAllGraphs();

    }
    
    public String[] getHeaders(){
        return this.headers;
    }
    
    public int getColumnCount(){
        return this.columnCount;
    }
    
    private void initGraphLoad() {

//        Runnable r = new Runnable() {

            String[] colors;

            int color_cnt;

//            public void run() {

                for (int k = 0; k < graphCount; k++) {

                        GraphProperties prop = new GraphProperties(thisJTS);

                        prop.setIndex(k);

                        prop.setSelectedColumn(columns[k]);

                        prop.setSelectedRows(rows);
                        prop.setTimeSTART(rows[0]);
                        prop.setTimeEND(rows[rows.length - 1]);

                        if (k < 9) {
                            color_cnt = k;
                        } else {
                            color_cnt = 0;
                        }
                        colors = getColorScheme(color_cnt);
                        prop.setSeriesPaint(colorTable.get(colors[0]));
                        prop.setSeriesFillPaint(colorTable.get(colors[1]));
                        prop.setSeriesOutlinePaint(colorTable.get(colors[2]));

                        prop.setShapesVisible(true);
                        prop.setLinesVisible(true);

                        prop.setStroke(SpreadsheetConstants.JTS_DEFAULT_STROKE);
                        prop.setShape(SpreadsheetConstants.JTS_DEFAULT_SHAPE, SpreadsheetConstants.JTS_DEFAULT_SHAPE_SIZE);

                        String s =table.getColumnName(columns[k]);
                        prop.setLegendName(s);
                        prop.setName(s);
                       
                        PropertyPanel ppanel = new PropertyPanel(thisJTS, prop);

                        addPropGroup(ppanel);

                        propVector.add(k, prop);
                        panelVector.add(k, ppanel);
                }

        finishGroupUI();
    }

    private String[] getColorScheme(int scheme) {

        String[] colors = new String[3]; //0 series, 1 fill, 2 outline

        switch (scheme) {
            case 0:
                colors[0] = "red";
                colors[1] = "red";
                colors[2] = "gray";
                break;

            case 1:
                colors[0] = "blue";
                colors[1] = "blue";
                colors[2] = "black";
                break;

            case 2:
                colors[0] = "green";
                colors[1] = "green";
                colors[2] = "gray";
                break;

            case 3:
                colors[0] = "black";
                colors[1] = "black";
                colors[2] = "yellow";
                break;

            case 4:
                colors[0] = "orange";
                colors[1] = "orange";
                colors[2] = "cyan";
                break;

            case 5:
                colors[0] = "cyan";
                colors[1] = "cyan";
                colors[2] = "black";
                break;

            case 6:
                colors[0] = "magenta";
                colors[1] = "yellow";
                colors[2] = "magenta";
                break;

            case 7:
                colors[0] = "lightgray";
                colors[1] = "orange";
                colors[2] = "lightgray";
                break;

            default:
                colors[0] = "red";
                colors[1] = "blue";
                colors[2] = "red";
                break;
        }
        return colors;
    }

    public void addGraph(GraphProperties prop) {

        AddGraphDlg dlg = new AddGraphDlg();
        dlg.setVisible(true);

        if (dlg.getResult()) {

            int i = propVector.indexOf(prop);
            int t_s, t_e;
            GraphProperties newProp = new GraphProperties(this); //????REFERENZFEHLER???

            newProp.setPosition(dlg.getSide());
            int pos = dlg.getPosition();
            dlg.dispose();

            newProp.setSeriesPaint(Color.BLACK);
            newProp.setSeriesFillPaint(Color.BLACK);
            newProp.setSeriesOutlinePaint(Color.BLACK);

            newProp.setSelectedColumn(prop.getSelectedColumn());
            newProp.setLegendName(prop.getLegendName());

            newProp.setLinesVisible(prop.getLinesVisible());
            newProp.setShapesVisible(prop.getShapesVisible());

            newProp.setStroke(prop.getStrokeType());
            newProp.setShape(prop.getShapeType(), prop.getSizeType());
            newProp.setOutlineStroke(prop.getOutlineType());
//            newProp.setColorLabelColor();

            if (pos >= 0) {
                t_s = prop.getTimeSTART();
                t_e = prop.getTimeEND();
                newProp.setTimeSTART(t_s);
                newProp.setTimeEND(t_e);
            }

            PropertyPanel newPanel = new PropertyPanel(this, newProp);

            propVector.add(pos, newProp);
            panelVector.add(pos, newPanel);

            graphCount = propVector.size();
            initGroupUI();
            //Renderer Box Handler
            handleRenderer();

            for (int k = 0; k < graphCount; k++) {

                newProp = propVector.get(k);
                newProp.setIndex(k);
                newPanel = panelVector.get(k);

                addPropGroup(newPanel);

            }
            finishGroupUI();

            repaint();
        }
    }

    public void removeGraph(GraphProperties prop) {

        int i = propVector.indexOf(prop);

        if (graphCount > 1) {
            GraphProperties newProp;
            PropertyPanel newPanel;
            propVector.remove(i);
            panelVector.remove(i);
            graphCount = propVector.size();

            handleRenderer();

            initGroupUI();

            for (int k = 0; k < graphCount; k++) {

//                newProp = propVector.get(k);
                newPanel = panelVector.get(k);

                addPropGroup(newPanel);
            }
            finishGroupUI();

            repaint();
        }
    }

    public void upGraph(GraphProperties prop) {

        int i = propVector.indexOf(prop);
        PropertyPanel ppanel = panelVector.get(i);

        if (i - 1 >= 0 && i - 1 < graphCount) {
            propVector.remove(prop);
            panelVector.remove(i);
            propVector.add(i - 1, prop);
            panelVector.add(i - 1, ppanel);

            initGroupUI();

            for (int k = 0; k < graphCount; k++) {

                ppanel = panelVector.get(k);

                addPropGroup(ppanel);
  
            }
            finishGroupUI();


            repaint();
        }
    }

    public void downGraph(GraphProperties prop) {

        int i = propVector.indexOf(prop);

        if (i + 1 < propVector.size()) {
            GraphProperties newProp = propVector.get(i + 1);
            PropertyPanel newPanel = panelVector.get(i + 1);

            if (i + 1 >= 0 && i + 1 < graphCount) {

                propVector.remove(i + 1);
                panelVector.remove(i + 1);
                propVector.add(i, newProp);
                panelVector.add(i, newPanel);

                graphCount = propVector.size();

                initGroupUI();

                for (int k = 0; k < graphCount; k++) {

                    newProp = propVector.get(k);
                    newProp.setIndex(k);

                    addPropGroup(newPanel);

                }
                finishGroupUI();
                repaint();
            }
        }
    }

    private void updatePropVector() {

        if(!output_ttp){
            for (int i = 0; i < propVector.size(); i++) {
                propVector.get(i).applyTSProperties();
            }
        }else{
            for (int i = 0; i < propVector.size(); i++) {

                propVector.get(i).applySTPProperties(arrayVector, timeVector);
            }
        }
    }

//    public void plotGraph(int i){
//       
//            //propVector.get(i).applyProperties();
//            if(propVector.get(i).getPosChoice().getSelectedItem() == "left"){
//                jts.plotLeft(rLeftBox.getSelectedIndex(), edLeftField.getText(), edXAxisField.getText(), invLeftBox.isSelected());
//            }
//            if(propVector.get(i).getPosChoice().getSelectedItem() == "right"){
//                jts.plotRight(rRightBox.getSelectedIndex(), edRightField.getText(), edXAxisField.getText(), invRightBox.isSelected());
//            }
//    }
//    public void plotGraph(GraphProperties prop){
//       
//            //propVector.get(i).applyProperties();
////            if(propVector.get(i).getPosChoice().getSelectedItem() == "left"){
////                jxys.plotLeft(rLeftBox.getSelectedIndex(), edLeftField.getText(), edXAxisField.getText(), invLeftBox.isSelected());
////            }
////            if(propVector.get(i).getPosChoice().getSelectedItem() == "right"){
////                jxys.plotRight(rRightBox.getSelectedIndex(), edRightField.getText(), edXAxisField.getText(), invRightBox.isSelected());
////            }
//        if(prop.getPosChoice().getSelectedItem() == "left"){
//                jts.plotLeft(rLeftBox.getSelectedIndex(), edLeftField.getText(), edXAxisField.getText(), invLeftBox.isSelected());
//            }
//            if(prop.getPosChoice().getSelectedItem() == "right"){
//                jts.plotRight(rRightBox.getSelectedIndex(), edRightField.getText(), edXAxisField.getText(), invRightBox.isSelected());
//            }
//    }  
    public void plotAllGraphs() {

//        Runnable r = new Runnable() {
//
//            @Override
//            public void run() {

                updatePropVector();

                int l = 0;
                int r = 0;
                int rLeft = rLeftBox.getSelectedIndex();
                int rRight = rRightBox.getSelectedIndex();

                XYItemRenderer rendererLeft = new XYLineAndShapeRenderer();
                XYItemRenderer rendererRight = new XYLineAndShapeRenderer();

                XYLineAndShapeRenderer lsr_R = new XYLineAndShapeRenderer();
                XYBarRenderer brr_R = new XYBarRenderer();
                XYDifferenceRenderer dfr_R = new XYDifferenceRenderer();
                XYAreaRenderer ar_R = new XYAreaRenderer();
                XYStepRenderer str_R = new XYStepRenderer();
                XYStepAreaRenderer sar_R = new XYStepAreaRenderer();

                XYLineAndShapeRenderer lsr_L = new XYLineAndShapeRenderer();
                XYBarRenderer brr_L = new XYBarRenderer();
                XYDifferenceRenderer dfr_L = new XYDifferenceRenderer();
                XYAreaRenderer ar_L = new XYAreaRenderer();
                XYStepRenderer str_L = new XYStepRenderer();
                XYStepAreaRenderer sar_L = new XYStepAreaRenderer();

                GraphProperties prop;
                /* 2 renderers */
                /////////////// In this Loop: Apply Preferences /////////////
                for (int i = 0; i < propVector.size(); i++) {

                   prop = propVector.get(i);

                    if (prop.getPosition() == 0) {
                        l++;
                        //prop.setRendererType(rLeft);

                        switch (rLeft) {

                            case 0:
                                lsr_L.setSeriesPaint(i - r, prop.getSeriesPaint());
                                //lsr_L.setSeriesPaint(i-r, Color.black);
                                lsr_L.setSeriesStroke(i - r, prop.getSeriesStroke());
                                lsr_L.setSeriesShape(i - r, prop.getSeriesShape());
                                lsr_L.setSeriesShapesVisible(i - r, prop.getShapesVisible());
                                lsr_L.setSeriesLinesVisible(i - r, prop.getLinesVisible());
                                lsr_L.setDrawOutlines(prop.getOutlineVisible());
                                lsr_L.setUseOutlinePaint(prop.getOutlineVisible());
                                lsr_L.setSeriesFillPaint(i - r, prop.getSeriesFillPaint());
                                lsr_L.setUseFillPaint(true);
                                lsr_L.setSeriesOutlineStroke(i - r, prop.getSeriesOutlineStroke());
                                lsr_L.setSeriesOutlinePaint(i - r, prop.getSeriesOutlinePaint());
                                rendererLeft = lsr_L;
                                break;

                            case 1:
                                brr_L.setSeriesPaint(i - r, prop.getSeriesPaint());
                                brr_L.setSeriesStroke(i - r, prop.getSeriesStroke());

                                brr_L.setSeriesOutlineStroke(i - r, prop.getSeriesOutlineStroke());
                                brr_L.setSeriesOutlinePaint(i - r, prop.getSeriesOutlinePaint());


                                rendererLeft = brr_L;
                                //set Margin
                                break;

                            case 2:
                                ar_L.setSeriesPaint(i - r, prop.getSeriesPaint());
                                ar_L.setSeriesStroke(i - r, prop.getSeriesStroke());
                                ar_L.setSeriesShape(i - r, prop.getSeriesShape());
                                ar_L.setSeriesOutlineStroke(i - r, prop.getSeriesOutlineStroke());
                                ar_L.setSeriesOutlinePaint(i - r, prop.getSeriesOutlinePaint());
                                ar_L.setOutline(prop.getOutlineVisible());
                                //ar_L.setSeriesOu

                                rendererLeft = ar_L;

                                break;

                            case 3:
                                str_L.setSeriesPaint(i - r, prop.getSeriesPaint());
                                str_L.setSeriesStroke(i - r, prop.getSeriesStroke());
                                str_L.setSeriesShape(i - r, prop.getSeriesShape());
//                            str_L.setSeriesOutlineStroke(i-r, prop.getSeriesOutlineStroke());
//                            str_L.setSeriesOutlinePaint(i-r, prop.getSeriesOutlinePaint());

                                rendererLeft = str_L;
                                break;

                            case 4:
                                sar_L.setSeriesPaint(i - r, prop.getSeriesPaint());
                                sar_L.setSeriesStroke(i - r, prop.getSeriesStroke());
                                sar_L.setSeriesShape(i - r, prop.getSeriesShape());
                                sar_L.setSeriesOutlineStroke(i - r, prop.getSeriesOutlineStroke());
                                sar_L.setSeriesOutlinePaint(i - r, prop.getSeriesOutlinePaint());
                                sar_L.setOutline(prop.getOutlineVisible());

                                rendererLeft = sar_L;

                                break;

                            case 5:
                                dfr_L.setSeriesPaint(i - r, prop.getSeriesPaint());
                                dfr_L.setSeriesStroke(i - r, prop.getSeriesStroke());
                                dfr_L.setSeriesShape(i - r, prop.getSeriesShape());
                                dfr_L.setSeriesOutlineStroke(i - r, prop.getSeriesOutlineStroke());
                                dfr_L.setSeriesOutlinePaint(i - r, prop.getSeriesOutlinePaint());
                                dfr_L.setShapesVisible(prop.getShapesVisible());


//                            dfr_L.setNegativePaint(prop.getNegativePaint());
//                            dfr_L.setPositivePaint(prop.getNegativePaint());

                                rendererLeft = dfr_L;

                                break;

                            default:
                                lsr_L.setSeriesPaint(i - r, prop.getSeriesPaint());
                                lsr_L.setSeriesStroke(i - r, prop.getSeriesStroke());
                                lsr_L.setSeriesShape(i - r, prop.getSeriesShape());
                                lsr_L.setSeriesShapesVisible(i - r, prop.getShapesVisible());
                                lsr_L.setSeriesLinesVisible(i - r, prop.getLinesVisible());
                                lsr_L.setSeriesOutlineStroke(i - r, prop.getSeriesOutlineStroke());
                                lsr_L.setSeriesOutlinePaint(i - r, prop.getSeriesOutlinePaint());

                                rendererLeft = lsr_L;
                                break;
                        }

//                       if(!output_ttp) prop.applyTSProperties();
//                       else prop.applySTPProperties(arrayVector, timeVector);

                    }
                    if (prop.getPosition() == 1) {
                        r++;
                        //prop.setRendererType(rRight);
                        switch (rRight) {
                            case 0:
                                lsr_R.setSeriesPaint(i - l, prop.getSeriesPaint());
                                lsr_R.setSeriesStroke(i - l, prop.getSeriesStroke());
                                lsr_R.setSeriesShape(i - l, prop.getSeriesShape());
                                lsr_R.setSeriesShapesVisible(i - l, prop.getShapesVisible());
                                lsr_R.setSeriesLinesVisible(i - l, prop.getLinesVisible());
                                lsr_R.setDrawOutlines(prop.getOutlineVisible());
                                lsr_R.setUseOutlinePaint(prop.getOutlineVisible());
                                lsr_R.setSeriesFillPaint(i - l, prop.getSeriesFillPaint());
                                lsr_R.setUseFillPaint(true);
                                lsr_R.setSeriesOutlineStroke(i - l, prop.getSeriesOutlineStroke());
                                lsr_R.setSeriesOutlinePaint(i - l, prop.getSeriesOutlinePaint());

                                rendererRight = lsr_R;
                                break;

                            case 1:
                                brr_R.setSeriesPaint(i - l, prop.getSeriesPaint());
                                brr_R.setSeriesStroke(i - l, prop.getSeriesStroke());
                                brr_R.setSeriesOutlineStroke(i - l, prop.getSeriesOutlineStroke());
                                brr_R.setSeriesOutlinePaint(i - l, prop.getSeriesOutlinePaint());

                                rendererRight = brr_R;
                                //set Margin
                                break;

                            case 2:
                                ar_R.setSeriesPaint(i - l, prop.getSeriesPaint());
                                ar_R.setSeriesStroke(i - l, prop.getSeriesStroke());
                                ar_R.setSeriesShape(i - l, prop.getSeriesShape());
                                ar_R.setSeriesOutlineStroke(i - l, prop.getSeriesOutlineStroke());
                                ar_R.setSeriesOutlinePaint(i - l, prop.getSeriesOutlinePaint());

                                rendererRight = ar_R;

                                break;

                            case 3:
                                str_R.setSeriesPaint(i - l, prop.getSeriesPaint());
                                str_R.setSeriesStroke(i - l, prop.getSeriesStroke());
                                str_R.setSeriesShape(i - l, prop.getSeriesShape());
                                str_R.setSeriesOutlineStroke(i - l, prop.getSeriesOutlineStroke());
                                str_R.setSeriesOutlinePaint(i - l, prop.getSeriesOutlinePaint());

                                rendererRight = str_R;

                                break;

                            case 4:
                                sar_R.setSeriesPaint(i - l, prop.getSeriesPaint());
                                sar_R.setSeriesStroke(i - l, prop.getSeriesStroke());
                                sar_R.setSeriesShape(i - l, prop.getSeriesShape());
                                sar_R.setSeriesOutlineStroke(i - l, prop.getSeriesOutlineStroke());
                                sar_R.setSeriesOutlinePaint(i - l, prop.getSeriesOutlinePaint());

                                rendererRight = sar_R;

                                break;

                            case 5:
                                dfr_R.setSeriesPaint(i - l, prop.getSeriesPaint());
                                dfr_R.setSeriesStroke(i - l, prop.getSeriesStroke());
                                dfr_R.setSeriesShape(i - l, prop.getSeriesShape());
                                dfr_R.setSeriesOutlineStroke(i - l, prop.getSeriesOutlineStroke());
                                dfr_R.setSeriesOutlinePaint(i - l, prop.getSeriesOutlinePaint());
                                dfr_R.setShapesVisible(prop.getShapesVisible());
                                rendererRight = dfr_R;

                                break;

                            default:
                                lsr_R.setSeriesPaint(i - l, prop.getSeriesPaint());
                                lsr_R.setSeriesStroke(i - l, prop.getSeriesStroke());
                                lsr_R.setSeriesShape(i - l, prop.getSeriesShape());
                                lsr_R.setSeriesShapesVisible(i - l, prop.getShapesVisible());
                                lsr_R.setSeriesLinesVisible(i - l, prop.getLinesVisible());
                                lsr_R.setSeriesOutlineStroke(i - l, prop.getSeriesOutlineStroke());
                                lsr_R.setSeriesOutlinePaint(i - l, prop.getSeriesOutlinePaint());

                                rendererRight = lsr_R;
                                break;
                        }

//                        prop.setColorLabelColor();

//                        if(!output_ttp) prop.applyTSProperties();
//                        else prop.applySTPProperties(arrayVector, timeVector);
                        

                    }
                    
                   
                }

                
                
                ////////////////////////////////////////////////////////////////////////////
                //Renderer direkt ÃƒÆ’Ã†â€™Ãƒâ€šÃ‚Â¼bernehmen! //
                jts.setPropVector(propVector);
try{
                if (l > 0) {
                    jts.plotLeft(rendererLeft, edLeftField.getText(), edXAxisField.getText(), invLeftBox.isSelected());
                }
                if (r > 0) {
                    jts.plotRight(rendererRight, edRightField.getText(), edXAxisField.getText(), invRightBox.isSelected());
                }
                if (r == 0 && l == 0) {
                    jts.plotEmpty();
                }

                jts.setTitle(edTitleField.getText());
                jts.setDateFormat(timeFormat_yy.isSelected(), timeFormat_mm.isSelected(),
                        timeFormat_dd.isSelected(), timeFormat_hm.isSelected());
}catch(Exception ex){
    
}
        repaint();
        
    }

    public void updateGUI(){
        //Property Panels update!

        repaint();
    }

    public void handleRenderer() {
        int r = 0, l = 0;
        for (int i = 0; i < propVector.size(); i++) {
            if (propVector.get(i).getPosition() == 0) {
                l++;
            }
            if (propVector.get(i).getPosition() == 1) {
                r++;
            }
        }

        if ((l < 2 || l > 2) && rLeftBox.getItemCount() == 6) {
            rLeftBox.removeItemAt(5);
        }

        if ((r < 2 || r > 2) && rRightBox.getItemCount() == 6) {
            rRightBox.removeItemAt(5);
        }

        if ((l == 2) && rLeftBox.getItemCount() == 5) {
            rLeftBox.addItem("Difference");
        }

        if ((r == 2) && rRightBox.getItemCount() == 5) {
            rRightBox.addItem("Difference");
        }
    }

    public int getRendererLeft() {
        return rLeftBox.getSelectedIndex();
    }

    public int getRendererRight() {
        return rRightBox.getSelectedIndex();
    }

    public void setRendererLeft(int type) {
        rLeftBox.setSelectedIndex(type);
    }

    public void setRendererRight(int type) {
        rRightBox.setSelectedIndex(type);
    }

    private void createOptionPanel() {
        GroupLayout optLayout = new GroupLayout(optionpanel);
        JPanel timeFormatPanel = new JPanel();
        timeFormatPanel.add(timeFormat_dd);
        timeFormatPanel.add(timeFormat_mm);
        timeFormatPanel.add(timeFormat_yy);
        timeFormatPanel.add(timeFormat_hm);

        timeFormat_yy.setSelected(true);
        timeFormat_mm.setSelected(true);
        timeFormat_dd.setSelected(true);
        timeFormat_hm.setSelected(false);

        addButton.addActionListener(addbuttonclick);

        optionpanel.setLayout(optLayout);
        optLayout.setAutoCreateGaps(true);
        optLayout.setAutoCreateContainerGaps(true);

        GroupLayout.SequentialGroup optHGroup = optLayout.createSequentialGroup();
        GroupLayout.SequentialGroup optVGroup = optLayout.createSequentialGroup();

        optVGroup.addGroup(optLayout.createParallelGroup().addComponent(edTitle).addComponent(edTitleField));
        optVGroup.addGroup(optLayout.createParallelGroup().addComponent(edLeft).addComponent(edLeftField));
        optVGroup.addGroup(optLayout.createParallelGroup().addComponent(edRight).addComponent(edRightField));
        optVGroup.addGroup(optLayout.createParallelGroup().addComponent(edXAxis).addComponent(edXAxisField));
        optVGroup.addGroup(optLayout.createParallelGroup().addComponent(rLeftLabel).addComponent(rLeftBox));
        optVGroup.addGroup(optLayout.createParallelGroup().addComponent(rRightLabel).addComponent(rRightBox));
        optVGroup.addGroup(optLayout.createParallelGroup().addComponent(invLeftBox).addComponent(addButton));
        optVGroup.addGroup(optLayout.createParallelGroup().addComponent(invRightBox));
        optVGroup.addGroup(optLayout.createParallelGroup().addComponent(timeFormatLabel));
        optVGroup.addGroup(optLayout.createParallelGroup().addComponent(timeFormatPanel).addComponent(applyButton));


        optHGroup.addGroup(optLayout.createParallelGroup().
                addComponent(edTitle).addComponent(edLeft).addComponent(edRight).addComponent(edXAxis).addComponent(rLeftLabel).addComponent(rRightLabel).addComponent(invLeftBox).addComponent(invRightBox).addComponent(timeFormatLabel).addComponent(timeFormatPanel));

        optHGroup.addGroup(optLayout.createParallelGroup().
                addComponent(edTitleField).addComponent(edLeftField).addComponent(edRightField).addComponent(edXAxisField).addComponent(rLeftBox).addComponent(rRightBox).addComponent(addButton).addGap(1, 1, 1).addComponent(applyButton));


        optLayout.setHorizontalGroup(optHGroup);
        optLayout.setVerticalGroup(optVGroup);
    }

    private void initGroupUI() {

        graphpanel.removeAll();

//        JLabel nameLabel = new JLabel("Name");
//        JLabel posLabel = new JLabel("Position");
        JLabel typeLabel = new JLabel("Colour / Position");
//        JLabel colorLabel = new JLabel("Type/Colour");
        JLabel dataLabel = new JLabel("Data / Legend Entry");
        JLabel timeLabel = new JLabel("Time Interval");
//        JLabel emptyTimeLabel = new JLabel("    ");
//        JLabel legendLabel = new JLabel("Legend Entry: ");

        gLayout = new GroupLayout(graphpanel);
        graphpanel.setLayout(gLayout);
        gLayout.setAutoCreateGaps(true);
        gLayout.setAutoCreateContainerGaps(true);

        hGroup = gLayout.createSequentialGroup();
        vGroup = gLayout.createSequentialGroup();
        group1 = gLayout.createParallelGroup();
        group2 = gLayout.createParallelGroup();
        group3 = gLayout.createParallelGroup();
        group4 = gLayout.createParallelGroup();
        group5 = gLayout.createParallelGroup();
        group6 = gLayout.createParallelGroup();
        group7 = gLayout.createParallelGroup();
        group8 = gLayout.createParallelGroup();
        group9 = gLayout.createParallelGroup();
        group10 = gLayout.createParallelGroup();
        group11 = gLayout.createParallelGroup();
        group12 = gLayout.createParallelGroup();
        group13 = gLayout.createParallelGroup();
        group14 = gLayout.createParallelGroup();
        group15 = gLayout.createParallelGroup();



        group1.addComponent(dataLabel);
        group2.addComponent(timeLabel);
        group3.addComponent(typeLabel);
        //group4.addComponent(colorLabel);

//        group9.addComponent();
//        group10.addComponent(emptyTimeLabel);
//        group11.addComponent(emptyTimeLabel);
//        group12.addComponent(emptyTimeLabel);
//        group13.addComponent(emptyTimeLabel);
//        group14.addComponent(emptyTimeLabel);
//        group15.addComponent(emptyTimeLabel);

        vGroup.addGroup(gLayout.createParallelGroup(Alignment.LEADING).addComponent(dataLabel).addComponent(timeLabel).addComponent(typeLabel));

//        vGroup.addGroup(gLayout.createParallelGroup(Alignment.BASELINE)
//        .addComponent(dataLabel).addComponent(timeLabel).addComponent(typeLabel));

    }

    private void addPropGroup(PropertyPanel ppanel) {
        JLabel space1 = new JLabel(" ");
        JLabel space2 = new JLabel(" ");
        JLabel space3 = new JLabel(" ");
        JLabel space4 = new JLabel(" ");
        JLabel space5 = new JLabel("   ");
        JLabel space6 = new JLabel("   ");
        JLabel lf = ppanel.getLegendLabel();

        group6.addComponent(space5).addComponent(space6);

        group1.addComponent(ppanel.getDataChoice()).addComponent(lf).addGap(20);
        group2.addComponent(ppanel.getTimeChoiceSTART()).addComponent(ppanel.getTimeChoiceEND());
        group3.addComponent(ppanel.getCustomizeButton()).addComponent(ppanel.getPosChoice());

        group9.addComponent(space3);

        group11.addComponent(space4);

        group13.addComponent(ppanel.getColorLabel()).addComponent(ppanel.getRemButton());
        group14.addComponent(ppanel.getSColorLabel()).addComponent(ppanel.getUpButton());
        group15.addComponent(ppanel.getDownButton());

        vGroup.addGroup(gLayout.createParallelGroup(Alignment.LEADING).addComponent(ppanel.getDataChoice()).addComponent(ppanel.getTimeChoiceSTART()).addComponent(space5).addComponent(ppanel.getCustomizeButton()).addGap(10).addComponent(ppanel.getColorLabel()).addComponent(ppanel.getSColorLabel()));
        vGroup.addGroup(gLayout.createParallelGroup(Alignment.TRAILING).addComponent(lf).addComponent(ppanel.getTimeChoiceEND()).addComponent(space6).addComponent(ppanel.getPosChoice()).addComponent(space3).addComponent(space4).addComponent(ppanel.getRemButton()).addComponent(ppanel.getUpButton()).addComponent(ppanel.getDownButton()));
        vGroup.addGroup(gLayout.createParallelGroup().addGap(20));

//            vGroup.addGroup(gLayout.createParallelGroup(Alignment.BASELINE)
//            .addComponent(prop.getNameLabel()).addComponent(prop.getPosChoice())
//            .addComponent(prop.getTypeChoice()).addComponent(prop.getColorChoice())
//            .addComponent(prop.getDataChoice()).addComponent(prop.getLegendField())
//            .addComponent(prop.getTimeChoiceSTART()).addComponent(prop.getTimeChoiceEND())
//            .addComponent(space1).addComponent(prop.getPlotButton())
//            .addComponent(space2).addComponent(prop.getAddButton())
//            .addComponent(prop.getRemButton())
//            .addComponent(prop.getUpButton()).addComponent(prop.getDownButton()));
    }

    private void finishGroupUI() {

        hGroup.addGroup(group1);
        hGroup.addGroup(group2);
        hGroup.addGroup(group6);
        hGroup.addGroup(group3);
//        hGroup.addGroup(group4);
//        hGroup.addGroup(group5);
//        hGroup.addGroup(group6);
//        hGroup.addGroup(group7);
//        hGroup.addGroup(group8);

        hGroup.addGroup(group9);
        hGroup.addGroup(group10);
        hGroup.addGroup(group11);
        hGroup.addGroup(group12);
        hGroup.addGroup(group13);
        hGroup.addGroup(group14);
        hGroup.addGroup(group15);

        gLayout.setHorizontalGroup(hGroup);
        gLayout.setVerticalGroup(vGroup);


    }

    public JPanel getPanel() {
        return mainpanel;
    }

    public JPanel getCTSPlot() {
        return ctsplot.getPanel();
    }

    public void setIndex(int index) {
        this.index = index;
    }

    public void setParent(JFrame parent) {
        this.parent = parent;
    }

    /*
    public void addGraph(){
    for(int i=0; i<headers.length; i++){

    datapanels.get(i).add(datachoice.get(i));
    datapanels.get(i).add(poschoice.get(i));
    datapanels.get(i).add(typechoice.get(i));
    datapanels.get(i).add(colorchoice.get(i));

    graphpanel.add(datapanels.get(i));

    }
    }
     */
//    private void editProperties(){
//        JDialog propDlg = new JDialog(parent,"Properties");
//        int ct = headers.length;
//        
//        JLabel[] labels = new JLabel[ct];
//        JTextField[] textFields = new JTextField[ct];
//        JPanel[] inputpanels = new JPanel[ct];
//        
//        JPanel proppanel = new JPanel();
//        proppanel.setLayout(new GridLayout(ct,1));
//        
//        for(int i=0; i<ct ; i++){
//            labels[i] = new JLabel(headers[i]);
//            textFields[i] = new JTextField(headers[i]);
//            inputpanels[i] = new JPanel();
//            inputpanels[i].setLayout(new FlowLayout());
//            inputpanels[i].add(labels[i]);
//            inputpanels[i].add(textFields[i]);
//        }
//        
//        
//        JScrollPane propPane = new JScrollPane(proppanel);    
//    }

    private String saveTemplate() {

        Properties properties = new Properties();
        int no_of_props = propVector.size();
        
        String store = "";
        try{
//            store = sheet.getStore().getID();
            store = sheet.getID();
        } catch (NullPointerException npe){
            store = "DEFAULT";
        }
        String output;
        String names = "";
        String name;
        String[] legendname;
        String number = "" + no_of_props;
        String stroke_type;
        String stroke_color;
        //String stroke_color_G;
        //String stroke_color_B;
        String lines_vis;
        String shapes_vis;
        String shape_type;
        String size_type;
        String shape_color;
        //String shape_color_G;
        //String shape_color_B;
        String outline_type;
        String outline_color;
        //String outline_color_G;
        //String outline_color_B;
        Color linecolor_load;
        Color fillcolor_load;
        Color outcolor_load;
        
        //Input / Output Sheet
        if(sheet.isOutputSheet()){
            output = "true";
        }else{
            output = "false";
        }
        
        properties.setProperty("output", output);

        //TYPE
        properties.setProperty("template_type", "TIME");

        //Header Name


        properties.setProperty("number", number);
        //Store
        properties.setProperty("store", store);
        //Titles
        properties.setProperty("title", edTitleField.getText());
        properties.setProperty("axisLTitle", edLeftField.getText());
        properties.setProperty("axisRTitle", edRightField.getText());
        properties.setProperty("xAxisTitle", edXAxisField.getText());
        //RENDERER
        properties.setProperty("renderer_left", "" + rLeftBox.getSelectedIndex());
        properties.setProperty("renderer_right", "" + rRightBox.getSelectedIndex());
        properties.setProperty("inv_left", "" + invLeftBox.isSelected());
        properties.setProperty("inv_right", "" + invRightBox.isSelected());

        //X-Col
        properties.setProperty("x_series_index", "DEFAULT");
        properties.setProperty("dataSTART", "DEFAULT");
        properties.setProperty("dataEND", "DEFAULT");

        //TimeFormat
        properties.setProperty("timeFormat_yy", "" + timeFormat_yy.isSelected());
        properties.setProperty("timeFormat_mmy", "" + timeFormat_mm.isSelected());
        properties.setProperty("timeFormat_dd", "" + timeFormat_dd.isSelected());
        properties.setProperty("timeFormat_hm", "" + timeFormat_hm.isSelected());


        for (int i = 0; i < no_of_props; i++) {

            GraphProperties gprop = propVector.get(i);

            name = gprop.getName();
            if (i == 0) {
                names = name;
            } else {
                names = names + "," + name;
            }


            //Legend Name
            properties.setProperty(name + ".legendname", gprop.getLegendName());
            //POSITION left/right
            properties.setProperty(name + ".position", ""+gprop.getPosition());
            //TIME INTERVAL
            //start
            properties.setProperty(name + ".timeSTART", gprop.getTimeIntervals()[gprop.getTimeSTART()]);
            //end
            properties.setProperty(name + ".timeEND", gprop.getTimeIntervals()[gprop.getTimeEND()]);
            //STROKE
            stroke_type = "" + gprop.getStrokeType();
            properties.setProperty(name + ".linestroke", stroke_type);
            //STROKE COLOR
            linecolor_load = gprop.getSeriesPaint();
            stroke_color = "" + linecolor_load.getRed() + "," + linecolor_load.getGreen() + "," + linecolor_load.getBlue();
            //stroke_color_R = "" + gprop.getSeriesPaint().getRed();
            properties.setProperty(name + ".linecolor", stroke_color);

            //LINES VISIBLE
            lines_vis = "" + gprop.getLinesVisible();
            properties.setProperty(name + ".linesvisible", lines_vis);
            //SHAPES VISIBLE
            shapes_vis = "" + gprop.getShapesVisible();
            properties.setProperty(name + ".shapesvisible", shapes_vis);
            //SHAPE TYPE
            shape_type = "" + gprop.getShapeType();
            properties.setProperty(name + ".shapetype", shape_type);
            //SHAPE SIZE
            size_type = "" + gprop.getSizeType();
            properties.setProperty(name + ".shapesize", size_type);
            //SHAPE COLOR
            fillcolor_load = gprop.getSeriesFillPaint();
            shape_color = "" + fillcolor_load.getRed() + "," + fillcolor_load.getGreen() + "," + fillcolor_load.getBlue();
            properties.setProperty(name + ".shapecolor", shape_color);
//            
            //OUTLINE STROKE
            outline_type = "" + gprop.getOutlineType();
            properties.setProperty(name + ".outlinestroke", outline_type);
            //OUTLINE COLOR
            outcolor_load = gprop.getSeriesOutlinePaint();
            outline_color = "" + outcolor_load.getRed() + "," + outcolor_load.getGreen() + "," + outcolor_load.getBlue();
            properties.setProperty(name + ".outlinecolor", outline_color);
//            
        }
        properties.setProperty("names", names);

        //Save Parameter File
        String filename = "";
        String inputString = "";
        StringTokenizer name_tokenizer = new StringTokenizer(store,".");
            String storename = "";
            if(name_tokenizer.hasMoreTokens()){
                storename = name_tokenizer.nextToken();
            }else{
                storename=store;
            }
        
        
        try {

            boolean dont_save = true;
            while(dont_save){
                
                inputString = GUIHelper.showInputDlg(this, SpreadsheetConstants.INFO_MSG_SAVETEMP, storename);
                if(!(inputString == null)){
                    
                    inputString+= ".ttp";

                    if(sheet.isOutputSheet()){
//                       
                        File file = new File(sheet.getOutputDSDir(), inputString);

                        if(!file.exists()){
                            filename = file.getName();
                            FileOutputStream fout = new FileOutputStream(file);
                            properties.store(fout, "");
                            fout.close();
                            dont_save = false;
                        }else{
                            String fileexists = "The File "+file+" already exists.\n Overwrite?";
                            int result = GUIHelper.showYesNoDlg(this, fileexists, "File already exists");
                            if(result==0){ //overwrite
                                filename = file.getName();
                                FileOutputStream fout = new FileOutputStream(file);
                                properties.store(fout, "");
                                fout.close();
                                dont_save = false;
                            }

                        }
                    }else{
                        File file = new File(workspace.getDirectory().toString()+SpreadsheetConstants.FILE_EXPLORER_DIR_NAME, inputString);
                        if(!file.exists()){
                            filename = file.getName();
                            FileOutputStream fout = new FileOutputStream(file);
                            properties.store(fout, "");
                            fout.close();
                            dont_save = false;
                        }else{
                            String fileexists = "The File "+file+" already exists.\n Overwrite?";
                            int result = GUIHelper.showYesNoDlg(this, fileexists, "File already exists");
                            if(result==0){ //overwrite
                                filename = file.getName();
                                FileOutputStream fout = new FileOutputStream(file);
                                properties.store(fout, "");
                                fout.close();
                                dont_save = false;
                            }

                        }
                    }
                    }else{
                        dont_save = false; //CANCEL OPTION!
                    }
                }
//            }
        } catch (Exception fnfex) {
        }
        
        return filename;
    }
    
    private void loadOutputTemplate(File templateFile) {
            
    Properties properties = new Properties();
        boolean load_prop = false;

        String names;
        String name;
        String stroke_color;
        String shape_color;
        String outline_color;
        int no_of_props;
        int returnVal = -1;

        try {
            FileInputStream fin = new FileInputStream(templateFile);
            properties.load(fin);
            fin.close();
        } catch (Exception e) {
        }

//        this.propVector = new Vector<GraphProperties>();
        
//        datasetID = (String) properties.getProperty("store");
        names = (String) properties.getProperty("names");

        no_of_props = new Integer(properties.getProperty("number"));

        this.graphCount = no_of_props;

        StringTokenizer nameTokenizer = new StringTokenizer(names, ",");

        for (int i = 0; i < no_of_props; i++) {

            load_prop = false;
            GraphProperties gprop;
            //if(type == INPUT){
                gprop = new GraphProperties(this);
            //}else{
//                gprop = new GraphProperties(sheet, this);
            //}

            if (nameTokenizer.hasMoreTokens()) {

                name = nameTokenizer.nextToken();

                for (int k = 0; k < graphCount; k++) {
                    if (headers[k+1].compareTo(name) == 0) {

                        gprop.setSelectedColumn(k);
                        load_prop = true;
                        break;
                    }
                }

                boolean readStart = false, readEnd = false;
                gprop.setTimeSTART(0);
                gprop.setTimeEND(rows_cnt - 1);

                if (load_prop) {
                    //Legend Name
                    gprop.setLegendName(properties.getProperty(name + ".legendname", "legend name"));
                    //POSITION left/right
                    int pos = new Integer(properties.getProperty(name + ".position"));
                    gprop.setPosition(pos);
                    //INTERVAL
                    String timeSTART = properties.getProperty(name + ".timeSTART");
                    String timeEND = properties.getProperty(name + ".timeEND");
                    String read = null;

                    for (int tc = 0; tc < rows_cnt; tc++) {

                        if (readStart && readEnd) {
                            break;
                        }

                        read = gprop.getTimeIntervals()[tc].toString();

                        if (!readStart) {
                            //start
                            if (read.equals(timeSTART)) {
                                gprop.setTimeSTART(tc);
                                readStart = true;
                            }
                        } else {
                            //end
                            if (read.equals(timeEND)) {
                                gprop.setTimeEND(tc);
                                readEnd = true;
                            }
                        }
                    }


//                    gprop.setTimeSTART(0);
//                    gprop.setTimeEND(table.getRowCount() - 1);

                    //NAME
                    gprop.setName(name);

                    //STROKE
                    gprop.setStroke(new Integer(properties.getProperty(name + ".linestroke", "2")));
//                    gprop.setStrokeSlider(gprop.getStrokeType());

                    //STROKE COLOR
                    stroke_color = properties.getProperty(name + ".linecolor", "255,0,0");

                    StringTokenizer colorTokenizer = new StringTokenizer(stroke_color, ",");

                    gprop.setSeriesPaint(new Color(new Integer(colorTokenizer.nextToken()),
                            new Integer(colorTokenizer.nextToken()),
                            new Integer(colorTokenizer.nextToken())));

                    //LINES VISIBLE
                    boolean lv = new Boolean(properties.getProperty(name + ".linesvisible"));
                    gprop.setLinesVisible(lv);
//                    gprop.setLinesVisBox(lv);
                    //SHAPES VISIBLE
                    boolean sv = new Boolean(properties.getProperty(name + ".shapesvisible"));
                    gprop.setShapesVisible(sv);
//                    gprop.setShapesVisBox(sv);

                    //SHAPE TYPE AND SIZE
                    int stype = new Integer(properties.getProperty(name + ".shapetype", "0"));
                    int ssize = new Integer(properties.getProperty(name + ".shapesize"));
                    gprop.setShape(stype, ssize);
//                    gprop.setShapeBox(stype);
//                    gprop.setShapeSlider(ssize);

                    //SHAPE COLOR
                    shape_color = properties.getProperty(name + ".shapecolor", "255,0,0");

                    StringTokenizer shapeTokenizer = new StringTokenizer(shape_color, ",");

                    gprop.setSeriesFillPaint(new Color(new Integer(shapeTokenizer.nextToken()),
                            new Integer(shapeTokenizer.nextToken()),
                            new Integer(shapeTokenizer.nextToken())));

                    //OUTLINE STROKE
                    int os = new Integer(properties.getProperty(name + ".outlinestroke"));
                    gprop.setOutlineStroke(os);
//                    gprop.setOutlineSlider(os);

                    //OUTLINE COLOR
                    outline_color = properties.getProperty(name + ".outlinecolor", "255,0,0");

                    StringTokenizer outTokenizer = new StringTokenizer(outline_color, ",");

                    gprop.setSeriesOutlinePaint(new Color(new Integer(outTokenizer.nextToken()),
                            new Integer(outTokenizer.nextToken()),
                            new Integer(outTokenizer.nextToken())));

//                    gprop.setColorLabelColor();
                    PropertyPanel ppanel = new PropertyPanel(this, gprop);
                    propVector.add(gprop);
                    panelVector.add(ppanel);
                    //addPropGroup(gprop);
                }
            }
        }

        //////////////// hier implementieren!! /////////////////////////
        //}
        
        //Titles
        edTitleField.setText(properties.getProperty("title"));
        edLeftField.setText(properties.getProperty("axisLTitle"));
        edRightField.setText(properties.getProperty("axisRTitle"));
        edXAxisField.setText(properties.getProperty("xAxisTitle"));
        //RENDERER
        rLeftBox.setSelectedIndex(new Integer(properties.getProperty("renderer_left")));
        rRightBox.setSelectedIndex(new Integer(properties.getProperty("renderer_right")));
        invLeftBox.setSelected(new Boolean(properties.getProperty("inv_left")));
        invRightBox.setSelected(new Boolean(properties.getProperty("inv_right")));

        //TimeFormat
        timeFormat_yy.setSelected(new Boolean(properties.getProperty("timeFormat_yy")));
        timeFormat_mm.setSelected(new Boolean(properties.getProperty("timeFormat_mmy")));
        timeFormat_dd.setSelected(new Boolean(properties.getProperty("timeFormat_dd")));
        timeFormat_hm.setSelected(new Boolean(properties.getProperty("timeFormat_hm")));

    }
    
    private void loadTemplate(File templateFile) {

        //int no_of_props = propVector.size();

        Properties properties = new Properties();
        boolean load_prop = false;

        String names;
        String name;
        String stroke_color;
        String shape_color;
        String outline_color;
        int no_of_props;
        int returnVal = -1;

        try {
            FileInputStream fin = new FileInputStream(templateFile);
            properties.load(fin);
            fin.close();
        } catch (Exception e) {
        }

        this.propVector = new Vector<GraphProperties>();

        names = properties.getProperty("names");
        no_of_props = new Integer(properties.getProperty("number"));

        this.graphCount = no_of_props;

        StringTokenizer nameTokenizer = new StringTokenizer(names, ",");

        initGroupUI();

        for (int i = 0; i < no_of_props; i++) {

            load_prop = false;
            GraphProperties gprop = new GraphProperties(this);

            if (nameTokenizer.hasMoreTokens()) {

                name = nameTokenizer.nextToken();

                for (int k = 0; k < table.getColumnCount(); k++) {
                    if (table.getColumnName(k).compareTo(name) == 0) { //stringcompare?

                        gprop.setSelectedColumn(k);
                        load_prop = true;
                        break;
                    }
                }

                boolean readStart = false, readEnd = false;
                gprop.setTimeSTART(0);
                gprop.setTimeEND(table.getRowCount() - 1);

                if (load_prop) {
                    //Legend Name
                    gprop.setLegendName(properties.getProperty(name + ".legendname", "legend name"));
//                    gprop.setLegendField(properties.getProperty(name + ".legendname", "legend name"));
                    //POSITION left/right
                    int pos = new Integer(properties.getProperty(name + ".position"));
                    gprop.setPosition(pos);
                    //INTERVAL
                    String timeSTART = properties.getProperty(name + ".timeSTART");
                    String timeEND = properties.getProperty(name + ".timeEND");
                    String read = null;

                    if(timeSTART.compareTo("DEFAULT") != 0){

                        for (int tc = 0; tc < table.getRowCount(); tc++) {


                            if (readStart && readEnd) {
                                break;
                            }

                            read = gprop.getTimeIntervals()[tc].toString();

                            if (!readStart) {
                                //start
                                if (read.equals(timeSTART)) {
                                    gprop.setTimeSTART(tc);
                                    readStart = true;
                                }
                            } else {
                                //end
                                if (read.equals(timeEND)) {
                                    gprop.setTimeEND(tc);
                                    readEnd = true;
                                }
                            }

                        }

                    }else{
                        gprop.setTimeSTART(0);
                        gprop.setTimeEND(table.getRowCount()-1);

                    }


//                    gprop.setTimeSTART(0);
//                    gprop.setTimeEND(table.getRowCount() - 1);

                    //NAME
                    gprop.setName(name);

                    //STROKE
                    gprop.setStroke(new Integer(properties.getProperty(name + ".linestroke", "2")));
//                    gprop.setStrokeSlider(gprop.getStrokeType());

                    //STROKE COLOR
                    stroke_color = properties.getProperty(name + ".linecolor", "255,0,0");

                    StringTokenizer colorTokenizer = new StringTokenizer(stroke_color, ",");

                    gprop.setSeriesPaint(new Color(new Integer(colorTokenizer.nextToken()),
                            new Integer(colorTokenizer.nextToken()),
                            new Integer(colorTokenizer.nextToken())));

                    //LINES VISIBLE
                    boolean lv = new Boolean(properties.getProperty(name + ".linesvisible"));
                    gprop.setLinesVisible(lv);
//                    gprop.setLinesVisBox(lv);
                    //SHAPES VISIBLE
                    boolean sv = new Boolean(properties.getProperty(name + ".shapesvisible"));
                    gprop.setShapesVisible(sv);
//                    gprop.setShapesVisBox(sv);

                    //SHAPE TYPE AND SIZE
                    int stype = new Integer(properties.getProperty(name + ".shapetype", "0"));
                    int ssize = new Integer(properties.getProperty(name + ".shapesize"));
                    gprop.setShape(stype, ssize);
//                    gprop.setShapeBox(stype);
//                    gprop.setShapeSlider(ssize);

                    //SHAPE COLOR
                    shape_color = properties.getProperty(name + ".shapecolor", "255,0,0");

                    StringTokenizer shapeTokenizer = new StringTokenizer(shape_color, ",");

                    gprop.setSeriesFillPaint(new Color(new Integer(shapeTokenizer.nextToken()),
                            new Integer(shapeTokenizer.nextToken()),
                            new Integer(shapeTokenizer.nextToken())));

                    //OUTLINE STROKE
                    int os = new Integer(properties.getProperty(name + ".outlinestroke"));
                    gprop.setOutlineStroke(os);
//                    gprop.setOutlineSlider(os);

                    //OUTLINE COLOR
                    outline_color = properties.getProperty(name + ".outlinecolor", "255,0,0");

                    StringTokenizer outTokenizer = new StringTokenizer(outline_color, ",");

                    gprop.setSeriesOutlinePaint(new Color(new Integer(outTokenizer.nextToken()),
                            new Integer(outTokenizer.nextToken()),
                            new Integer(outTokenizer.nextToken())));


                    PropertyPanel ppanel = new PropertyPanel(this, gprop);

//                    gprop.setColorLabelColor();
                    propVector.add(gprop);
                    panelVector.add(ppanel);
                    addPropGroup(ppanel);
                }


            }
        }

        //}
        //Titles
        edTitleField.setText(properties.getProperty("title"));
        edLeftField.setText(properties.getProperty("axisLTitle"));
        edRightField.setText(properties.getProperty("axisRTitle"));
        edXAxisField.setText(properties.getProperty("xAxisTitle"));
        //RENDERER
        rLeftBox.setSelectedIndex(new Integer(properties.getProperty("renderer_left")));
        rRightBox.setSelectedIndex(new Integer(properties.getProperty("renderer_right")));
        invLeftBox.setSelected(new Boolean(properties.getProperty("inv_left")));
        invRightBox.setSelected(new Boolean(properties.getProperty("inv_right")));

        //TimeFormat
        timeFormat_yy.setSelected(new Boolean(properties.getProperty("timeFormat_yy")));
        timeFormat_mm.setSelected(new Boolean(properties.getProperty("timeFormat_mmy")));
        timeFormat_dd.setSelected(new Boolean(properties.getProperty("timeFormat_dd")));
        timeFormat_hm.setSelected(new Boolean(properties.getProperty("timeFormat_hm")));



//        Runnable r = new Runnable(){
//      
//            public void run() {
//                    for (int j = 0; j < propVector.size(); j++) {
//                        propVector.get(j).applyTSProperties();
//                    }
//                }
//            };
//            
//            WorkerDlg dlg = new WorkerDlg(this, "Preparing Data...");
//            dlg.setLocationRelativeTo(null);
//            dlg.setTask(r);
//            dlg.execute();

        finishGroupUI();

        jts.setPropVector(propVector);
//        jts.createPlot();
//        handleRenderer();


    }
    
    private void loadOutputTTPData(File file){
        
        arrayVector = new Vector<double[]>();
        timeVector = new Vector<Attribute.Calendar>();
        StringTokenizer st = new StringTokenizer("\t");
        
        ArrayList<String> headerList = new ArrayList<String>();
//        ArrayList<Double> rowList = new ArrayList<Double>();
        double[] rowBuffer;
        boolean b_headers = false;
        boolean b_data = false;
        boolean time_set = false;
        boolean stop = false;
        
        int file_columns = 0;
        
        final String ST_DATA =      "#data";
        final String ST_HEADERS =   "#headers";
        final String ST_END =       "#end";
        
        
        
        try{
            BufferedReader in = new BufferedReader(new FileReader(file));
          
            while(in.ready()){
                
//                System.out.println("in.ready");
                //NEXT LINE
                String s = in.readLine();
                st = new StringTokenizer(s ,"\t");
                
                String actual_string = "";
                Double val;
                
                if(b_data){
                    int i = 0;
                    Attribute.Calendar timeval = DefaultDataFactory.getDataFactory().createCalendar();
                    rowBuffer = new double[file_columns];
                    while(st.hasMoreTokens()){
                        actual_string = st.nextToken();
                        if(actual_string.compareTo(ST_END) != 0){
                            if(!time_set){
//                                System.out.print("time: "+actual_string+"\t");
                                
                                //JAMSCalendar(int year, int month, int dayOfMonth, int hourOfDay, int minute, int second)
                                    timeval.setValue(actual_string, "yyyy-MM-dd hh:mm");

                                timeVector.add(timeval);
                                time_set = true;
                            }else{
                                try{
//                                    System.out.println("value: "+actual_string+"\t");
                                    val = new Double(actual_string);
                                    rowBuffer[i++] = val.doubleValue();
                                }catch(Exception pe2){
                                    Logger.getLogger(JTSConfigurator.class.getName()).log(Level.SEVERE, null, pe2);
                                }
                            }
                        }else{
                            stop = true;
                        }
                    }
                    if(!stop){
                        arrayVector.add(rowBuffer);
                        time_set = false;
                    }
                    
                }else{
                
                    while(st.hasMoreTokens()){
                        //NEXT STRING
                        String test = st.nextToken();
                        
                        if(test.compareTo(ST_DATA) == 0){
                            b_data = true;
                            b_headers = false;
                            file_columns = headerList.size();
                            
                        }
                        if(b_headers){ //TIME HEADER/COL???
                            headerList.add(test);
                        } 
                        if(test.compareTo(ST_HEADERS) == 0){
                            b_headers = true;
                        }

                    }
                }
            }
            in.close();
            headers = new String[file_columns];
            headers = headerList.toArray(headers);
//            headers[0] = "";
            graphCount = file_columns-1;
            this.rows_cnt = arrayVector.size();
           
        }catch(FileNotFoundException fnfex){
            final String ERROR_NODAT_MSG ="File not found: "+file.getName()+"!";
            GUIHelper.showErrorDlg(this, ERROR_NODAT_MSG, "DAT file not found!");
        }catch(Exception eee){
            Logger.getLogger(JTSConfigurator.class.getName()).log(Level.SEVERE, null, eee);
        }

    }
    /****** EVENT HANDLING ******/
    ActionListener titleListener = new ActionListener() {

        public void actionPerformed(ActionEvent te) {
            ctsplot.getChart().setTitle(edTitleField.getText());
        }
    };

    ActionListener rendererColorListener = new ActionListener() {

        public void actionPerformed(ActionEvent te) {
            for(int i=0;i<panelVector.size();i++){
                panelVector.get(i).setColorLabelColor();

            }
        }
    };

    ActionListener timeListener = new ActionListener() {

        public void actionPerformed(ActionEvent te) {
            jts.setDateFormat(timeFormat_yy.isSelected(), timeFormat_mm.isSelected(),
                    timeFormat_dd.isSelected(), timeFormat_hm.isSelected());
        }
    };

    ActionListener propbuttonclick = new ActionListener() {

        public void actionPerformed(ActionEvent e) {
            ctsplot.getChartPanel().doEditChartProperties();
        }
    };

    ActionListener addbuttonclick = new ActionListener() {

        public void actionPerformed(ActionEvent e) {
            GraphProperties prop;
            if (propVector.size() > 0) {
                prop = propVector.get(0);
            } else {
                prop = new GraphProperties(JTSConfigurator.this);
            }
            //String[] colors = getColorScheme(addGraphDlg);
            //prop.setSeriesPaint(colorTable.get())
            addGraph(prop);
        }
    };

    ActionListener plotbuttonclick = new ActionListener() {

        public void actionPerformed(ActionEvent e) {
            plotAllGraphs();
            setVisible(true);
        }
    };

    ActionListener actChanged = new ActionListener() {

        public void actionPerformed(ActionEvent e) {
            //timePlot();
        }
    };

    ActionListener saveImageAction = new ActionListener() {

        public void actionPerformed(ActionEvent e) {

//            showHiRes();

            try {
                JFileChooser chooser = sheet.getEPSFileChooser();
                int returnVal = chooser.showSaveDialog(JTSConfigurator.this);
                if (returnVal == JFileChooser.APPROVE_OPTION) {
                    final File file = chooser.getSelectedFile();
                    Runnable r = new Runnable(){
                        public void run(){
                            jts.saveAsEPS(file);
                        }
                    };
                    WorkerDlg dlg = new WorkerDlg(parent, "EPS Export");
                    dlg.setTask(r);
                    dlg.execute();
                }
            } catch (Exception ex) {
            }
        }
    };

    ActionListener saveTempListener = new ActionListener() {

        public void actionPerformed(ActionEvent e) {
            String fileID = saveTemplate();
            StringTokenizer name_tokenizer = new StringTokenizer(fileID,".");
            String filename = "";
            if(name_tokenizer.hasMoreTokens()){
                filename = name_tokenizer.nextToken()+SpreadsheetConstants.FILE_ENDING_DAT;
            }else{
                filename = fileID+SpreadsheetConstants.FILE_ENDING_DAT;
            }
//            System.out.println("output_sheet="+sheet.isOutputSheet());
            if(sheet.isOutputSheet()){
                String[] headers_with_time = new String[headers.length+1];
                headers_with_time[0] = "ID";
                java.lang.System.arraycopy(headers, 0, headers_with_time, 1, headers.length);
//                sheet.save(filename, headers_with_time);//String ID zurückgeben
                sheet.saveAll(filename);
                //daten speichern im falle eines output sheets
            }
        }
    };

    ActionListener loadTempListener = new ActionListener() {

        public void actionPerformed(ActionEvent e) {

            int returnVal = -1;

            try {

                returnVal = sheet.getTemplateChooser().showOpenDialog(JTSConfigurator.this);

                if (returnVal == JFileChooser.APPROVE_OPTION) {
                    File file = sheet.getTemplateChooser().getSelectedFile();
                    loadTemplate(file);
                    plotAllGraphs();
                }

            } catch (Exception fnfexc) {
                returnVal = -1;
            }


        }
    };

//    ActionListener rendererListener_L = new ActionListener(){
//        public void actionPerformed(ActionEvent e) {
//            
//            GraphProperties prop;
//            for(int i=0; i<propVector.size(); i++){
//                prop = propVector.get(i);
//                prop.setRendererType(rLeftBox.getSelectedIndex());
//                
//                
//            }
//            
//        }
//    };
    public void createActionListener() {

        Vector<ActionListener> addAction = new Vector<ActionListener>();

        for (int k = 0; k < graphCount; k++) {
            /* reicht hier ein listener fÃƒÆ’Ã†â€™Ãƒâ€šÃ‚Â¼r alle boxes? scheint so... */
            activationChange[k] = new ActionListener() {

                public void actionPerformed(ActionEvent e) {
                    //timePlot();
                }
            };
        }
    }

    private class HiResPanel extends JPanel {

        BufferedImage bi;

        public HiResPanel(BufferedImage bi) {
            this.bi = bi;
        }

        public void paint(Graphics g) {
            g.drawImage(bi, 0, 0, this);
        }
    }

    private class AddGraphDlg extends JDialog {

        boolean result = false;

        int max;

        String side;

        int side_index;

        int position;

        JSpinner posSpinner;

        JComboBox sideChoice;

        JButton okButton;

        JLabel pos_label;

        JLabel side_label;

        public AddGraphDlg() {
            super(JTSConfigurator.this, "Add Graph", true);
//            URL url = this.getClass().getResource("resources/JAMSicon16.png");
//            ImageIcon icon = new ImageIcon(url);
//            setIconImage(icon.getImage());
            Point parentloc = parent.getLocation();
            setLocation(parentloc.x + 50, parentloc.y + 50);
            createPanel();
        }

        void createPanel() {
            setLayout(new FlowLayout());

            max = propVector.size();
            String[] posArray = {"left", "right"};
            if (max > 0) {
                posSpinner = new JSpinner(new SpinnerNumberModel(max, 1, max, 1));
            } else {
                posSpinner = new JSpinner(new SpinnerNumberModel(0, 0, 0, 0));
            }
            sideChoice = new JComboBox(posArray);
            sideChoice.setSelectedIndex(0);
            JButton okButton = new JButton("OK");
            pos_label = new JLabel("position after: ");
            side_label = new JLabel("side: ");

            add(side_label);
            add(sideChoice);
            add(pos_label);
            add(posSpinner);
            add(okButton);

            okButton.addActionListener(ok);
            pack();
        }

        int getSide() {
//            if (side_index == 0) {
//                side = "left";
//            } else {
//                side = "right";
//            }

            return side_index;

//            return side;
        }

        int getPosition() {
            return position;
        }

        boolean getResult() {
            return result;
        }
        ActionListener ok = new ActionListener() {

            public void actionPerformed(ActionEvent e) {

                side_index = sideChoice.getSelectedIndex();
                position = (Integer) posSpinner.getValue();

                result = true;
                setVisible(false);
            }
        };

    }
}





