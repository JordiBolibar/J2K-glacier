package optas.tools;

import com.keypoint.PngEncoder;
import java.awt.BasicStroke;
import java.awt.Color;
import java.awt.Font;
import java.awt.image.BufferedImage;
import java.io.BufferedOutputStream;
import java.io.FileOutputStream;
import java.io.OutputStream;
import org.jfree.chart.ChartPanel;

/* ===========================================================
 * JFreeChart : a free chart library for the Java(tm) platform
 * ===========================================================
 *
 * (C) Copyright 2000-2013, by Object Refinery Limited and Contributors.
 *
 * Project Info:  http://www.jfree.org/jfreechart/index.html
 *
 * This library is free software; you can redistribute it and/or modify it
 * under the terms of the GNU Lesser General Public License as published by
 * the Free Software Foundation; either version 2.1 of the License, or
 * (at your option) any later version.
 *
 * This library is distributed in the hope that it will be useful, but
 * WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY
 * or FITNESS FOR A PARTICULAR PURPOSE. See the GNU Lesser General Public
 * License for more details.
 *
 * You should have received a copy of the GNU Lesser General Public
 * License along with this library; if not, write to the Free Software
 * Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301,
 * USA.
 *
 * [Oracle and Java are registered trademarks of Oracle and/or its affiliates. 
 * Other names may be trademarks of their respective owners.]
 *
 * ---------------
 * ChartPanel.java
 * ---------------
 * (C) Copyright 2000-2013, by Object Refinery Limited and Contributors.
 *
 * Original Author:  David Gilbert (for Object Refinery Limited);
 * Contributor(s):   Andrzej Porebski;
 *                   Soren Caspersen;
 *                   Jonathan Nash;
 *                   Hans-Jurgen Greiner;
 *                   Andreas Schneider;
 *                   Daniel van Enckevort;
 *                   David M O'Donnell;
 *                   Arnaud Lelievre;
 *                   Matthias Rose;
 *                   Onno vd Akker;
 *                   Sergei Ivanov;
 *                   Ulrich Voigt - patch 2686040;
 *                   Alessandro Borges - patch 1460845;
 *                   Martin Hoeller;
 *
 * Changes (from 28-Jun-2001)
 * --------------------------
 * 28-Jun-2001 : Integrated buffering code contributed by S???ren
 *               Caspersen (DG);
 * 18-Sep-2001 : Updated header and fixed DOS encoding problem (DG);
 * 22-Nov-2001 : Added scaling to improve display of charts in small sizes (DG);
 * 26-Nov-2001 : Added property editing, saving and printing (DG);
 * 11-Dec-2001 : Transferred saveChartAsPNG method to new ChartUtilities
 *               class (DG);
 * 13-Dec-2001 : Added tooltips (DG);
 * 16-Jan-2002 : Added an optional crosshair, based on the implementation by
 *               Jonathan Nash. Renamed the tooltips class (DG);
 * 23-Jan-2002 : Implemented zooming based on code by Hans-Jurgen Greiner (DG);
 * 05-Feb-2002 : Improved tooltips setup.  Renamed method attemptSaveAs()
 *               --> doSaveAs() and made it public rather than private (DG);
 * 28-Mar-2002 : Added a new constructor (DG);
 * 09-Apr-2002 : Changed initialisation of tooltip generation, as suggested by
 *               Hans-Jurgen Greiner (DG);
 * 27-May-2002 : New interactive zooming methods based on code by Hans-Jurgen
 *               Greiner. Renamed JFreeChartPanel --> ChartPanel, moved
 *               constants to ChartPanelConstants interface (DG);
 * 31-May-2002 : Fixed a bug with interactive zooming and added a way to
 *               control if the zoom rectangle is filled in or drawn as an
 *               outline. A mouse drag gesture towards the top left now causes
 *               an autoRangeBoth() and is a way to undo zooms (AS);
 * 11-Jun-2002 : Reinstated handleClick method call in mouseClicked() to get
 *               crosshairs working again (DG);
 * 13-Jun-2002 : Added check for null popup menu in mouseDragged method (DG);
 * 18-Jun-2002 : Added get/set methods for minimum and maximum chart
 *               dimensions (DG);
 * 25-Jun-2002 : Removed redundant code (DG);
 * 27-Aug-2002 : Added get/set methods for popup menu (DG);
 * 26-Sep-2002 : Fixed errors reported by Checkstyle (DG);
 * 22-Oct-2002 : Added translation methods for screen <--> Java2D, contributed
 *               by Daniel van Enckevort (DG);
 * 05-Nov-2002 : Added a chart reference to the ChartMouseEvent class (DG);
 * 22-Nov-2002 : Added test in zoom method for inverted axes, supplied by
 *               David M O'Donnell (DG);
 * 14-Jan-2003 : Implemented ChartProgressListener interface (DG);
 * 14-Feb-2003 : Removed deprecated setGenerateTooltips method (DG);
 * 12-Mar-2003 : Added option to enforce filename extension (see bug id
 *               643173) (DG);
 * 08-Sep-2003 : Added internationalization via use of properties
 *               resourceBundle (RFE 690236) (AL);
 * 18-Sep-2003 : Added getScaleX() and getScaleY() methods (protected) as
 *               requested by Irv Thomae (DG);
 * 12-Nov-2003 : Added zooming support for the FastScatterPlot class (DG);
 * 24-Nov-2003 : Minor Javadoc updates (DG);
 * 04-Dec-2003 : Added anchor point for crosshair calculation (DG);
 * 17-Jan-2004 : Added new methods to set tooltip delays to be used in this
 *               chart panel. Refer to patch 877565 (MR);
 * 02-Feb-2004 : Fixed bug in zooming trigger and added zoomTriggerDistance
 *               attribute (DG);
 * 08-Apr-2004 : Changed getScaleX() and getScaleY() from protected to
 *               public (DG);
 * 15-Apr-2004 : Added zoomOutFactor and zoomInFactor (DG);
 * 21-Apr-2004 : Fixed zooming bug in mouseReleased() method (DG);
 * 13-Jul-2004 : Added check for null chart (DG);
 * 04-Oct-2004 : Renamed ShapeUtils --> ShapeUtilities (DG);
 * 11-Nov-2004 : Moved constants back in from ChartPanelConstants (DG);
 * 12-Nov-2004 : Modified zooming mechanism to support zooming within
 *               subplots (DG);
 * 26-Jan-2005 : Fixed mouse zooming for horizontal category plots (DG);
 * 11-Apr-2005 : Added getFillZoomRectangle() method, renamed
 *               setHorizontalZoom() --> setDomainZoomable(),
 *               setVerticalZoom() --> setRangeZoomable(), added
 *               isDomainZoomable() and isRangeZoomable(), added
 *               getHorizontalAxisTrace() and getVerticalAxisTrace(),
 *               renamed autoRangeBoth() --> restoreAutoBounds(),
 *               autoRangeHorizontal() --> restoreAutoDomainBounds(),
 *               autoRangeVertical() --> restoreAutoRangeBounds() (DG);
 * 12-Apr-2005 : Removed working areas, added getAnchorPoint() method,
 *               added protected accessors for tracelines (DG);
 * 18-Apr-2005 : Made constants final (DG);
 * 26-Apr-2005 : Removed LOGGER (DG);
 * 01-Jun-2005 : Fixed zooming for combined plots - see bug report
 *               1212039, fix thanks to Onno vd Akker (DG);
 * 25-Nov-2005 : Reworked event listener mechanism (DG);
 * ------------- JFREECHART 1.0.x ---------------------------------------------
 * 01-Aug-2006 : Fixed minor bug in restoreAutoRangeBounds() (DG);
 * 04-Sep-2006 : Renamed attemptEditChartProperties() -->
 *               doEditChartProperties() and made public (DG);
 * 13-Sep-2006 : Don't generate ChartMouseEvents if the panel's chart is null
 *               (fixes bug 1556951) (DG);
 * 05-Mar-2007 : Applied patch 1672561 by Sergei Ivanov, to fix zoom rectangle
 *               drawing for dynamic charts (DG);
 * 17-Apr-2007 : Fix NullPointerExceptions in zooming for combined plots (DG);
 * 24-May-2007 : When the look-and-feel changes, update the popup menu if there
 *               is one (DG);
 * 06-Jun-2007 : Fixed coordinates for drawing buffer image (DG);
 * 24-Sep-2007 : Added zoomAroundAnchor flag, and handle clearing of chart
 *               buffer (DG);
 * 25-Oct-2007 : Added default directory attribute (DG);
 * 07-Nov-2007 : Fixed (rare) bug in refreshing off-screen image (DG);
 * 07-May-2008 : Fixed bug in zooming that triggered zoom for a rectangle
 *               outside of the data area (DG);
 * 08-May-2008 : Fixed serialization bug (DG);
 * 15-Aug-2008 : Increased default maxDrawWidth/Height (DG);
 * 18-Sep-2008 : Modified creation of chart buffer (DG);
 * 18-Dec-2008 : Use ResourceBundleWrapper - see patch 1607918 by
 *               Jess Thrysoee (DG);
 * 13-Jan-2009 : Fixed zooming methods to trigger only one plot
 *               change event (DG);
 * 16-Jan-2009 : Use XOR for zoom rectangle only if useBuffer is false (DG);
 * 18-Mar-2009 : Added mouse wheel support (DG);
 * 19-Mar-2009 : Added panning on mouse drag support - based on Ulrich 
 *               Voigt's patch 2686040 (DG);
 * 26-Mar-2009 : Changed fillZoomRectangle default to true, and only change
 *               cursor for CTRL-mouse-click if panning is enabled (DG);
 * 01-Apr-2009 : Fixed panning, and added different mouse event mask for
 *               MacOSX (DG);
 * 08-Apr-2009 : Added copy to clipboard support, based on patch 1460845
 *               by Alessandro Borges (DG);
 * 09-Apr-2009 : Added overlay support (DG);
 * 10-Apr-2009 : Set chartBuffer background to match ChartPanel (DG);
 * 05-May-2009 : Match scaling (and insets) in doCopy() (DG);
 * 01-Jun-2009 : Check for null chart in mousePressed() method (DG);
 * 08-Jun-2009 : Fixed bug in setMouseWheelEnabled() (DG);
 * 06-Jul-2009 : Clear off-screen buffer to fully transparent (DG);
 * 10-Oct-2011 : localization fix: bug #3353913 (MH);
 * 05-Jul-2012 : Remove reflection for MouseWheelListener - only needed for 
 *               JRE 1.3.1 (DG);
 * 02-Jul-2013 : Use ParamChecks class (DG);
 * 
 */
import java.awt.Graphics2D;
import java.awt.Rectangle;
import java.awt.Toolkit;
import java.awt.event.ActionListener;
import java.awt.event.MouseListener;
import java.awt.event.MouseMotionListener;
import java.awt.geom.AffineTransform;
import java.awt.geom.Rectangle2D;
import java.awt.print.Printable;
import java.io.File;
import java.io.IOException;
import java.io.Serializable;
import java.util.ArrayList;

import javax.swing.JFileChooser;
import javax.swing.JOptionPane;
import org.apache.xmlgraphics.java2d.ps.EPSDocumentGraphics2D;
import org.jfree.chart.JFreeChart;
import org.jfree.chart.annotations.XYTitleAnnotation;
import org.jfree.chart.block.BlockContainer;

import org.jfree.chart.event.ChartChangeListener;
import org.jfree.chart.event.ChartProgressListener;
import org.jfree.chart.event.OverlayChangeListener;
import org.jfree.chart.plot.XYPlot;
import org.jfree.chart.renderer.xy.XYItemRenderer;
import org.jfree.chart.title.LegendItemBlockContainer;
import org.jfree.chart.title.LegendTitle;
import org.jfree.ui.ExtensionFileFilter;
import org.jfree.ui.RectangleInsets;

/**
 * A Swing GUI component for displaying a {@link JFreeChart} object.
 * <P>
 * The panel registers with the chart to receive notification of changes to any
 * component of the chart. The chart is redrawn automatically whenever this
 * notification is received.
 */
public class PatchedChartPanel extends ChartPanel implements ChartChangeListener,
        ChartProgressListener, ActionListener, MouseListener,
        MouseMotionListener, OverlayChangeListener, Printable, Serializable {

    static public final int DEFAULT_DPI = 300;

    public PatchedChartPanel(JFreeChart chart) {
        super(chart);
    }

    /**
     * Constructs a panel containing a chart. The <code>useBuffer</code> flag
     * controls whether or not an offscreen <code>BufferedImage</code> is
     * maintained for the chart. If the buffer is used, more memory is consumed,
     * but panel repaints will be a lot quicker in cases where the chart itself
     * hasn't changed (for example, when another frame is moved to reveal the
     * panel). WARNING: If you set the <code>useBuffer</code> flag to false,
     * note that the mouse zooming rectangle will (in that case) be drawn using
     * XOR, and there is a SEVERE performance problem with that on JRE6 on
     * Windows.
     *
     * @param chart the chart.
     * @param useBuffer a flag controlling whether or not an off-screen buffer
     * is used (read the warning above before setting this to
     * <code>false</code>).
     */
    public PatchedChartPanel(JFreeChart chart, boolean useBuffer) {

        super(chart, useBuffer);

    }

    /**
     * Constructs a JFreeChart panel.
     *
     * @param chart the chart.
     * @param properties a flag indicating whether or not the chart property
     * editor should be available via the popup menu.
     * @param save a flag indicating whether or not save options should be
     * available via the popup menu.
     * @param print a flag indicating whether or not the print option should be
     * available via the popup menu.
     * @param zoom a flag indicating whether or not zoom options should be added
     * to the popup menu.
     * @param tooltips a flag indicating whether or not tooltips should be
     * enabled for the chart.
     */
    public PatchedChartPanel(JFreeChart chart,
            boolean properties,
            boolean save,
            boolean print,
            boolean zoom,
            boolean tooltips) {

        super(chart, properties, save, print, zoom, tooltips);

    }

    /**
     * Constructs a JFreeChart panel.
     *
     * @param chart the chart.
     * @param width the preferred width of the panel.
     * @param height the preferred height of the panel.
     * @param minimumDrawWidth the minimum drawing width.
     * @param minimumDrawHeight the minimum drawing height.
     * @param maximumDrawWidth the maximum drawing width.
     * @param maximumDrawHeight the maximum drawing height.
     * @param useBuffer a flag that indicates whether to use the off-screen
     * buffer to improve performance (at the expense of memory).
     * @param properties a flag indicating whether or not the chart property
     * editor should be available via the popup menu.
     * @param save a flag indicating whether or not save options should be
     * available via the popup menu.
     * @param print a flag indicating whether or not the print option should be
     * available via the popup menu.
     * @param zoom a flag indicating whether or not zoom options should be added
     * to the popup menu.
     * @param tooltips a flag indicating whether or not tooltips should be
     * enabled for the chart.
     */
    public PatchedChartPanel(JFreeChart chart, int width, int height,
            int minimumDrawWidth, int minimumDrawHeight, int maximumDrawWidth,
            int maximumDrawHeight, boolean useBuffer, boolean properties,
            boolean save, boolean print, boolean zoom, boolean tooltips) {

        super(chart, width, height, minimumDrawWidth, minimumDrawHeight,
                maximumDrawWidth, maximumDrawHeight, useBuffer, properties,
                true, save, print, zoom, tooltips);
    }

    /**
     * Constructs a JFreeChart panel.
     *
     * @param chart the chart.
     * @param width the preferred width of the panel.
     * @param height the preferred height of the panel.
     * @param minimumDrawWidth the minimum drawing width.
     * @param minimumDrawHeight the minimum drawing height.
     * @param maximumDrawWidth the maximum drawing width.
     * @param maximumDrawHeight the maximum drawing height.
     * @param useBuffer a flag that indicates whether to use the off-screen
     * buffer to improve performance (at the expense of memory).
     * @param properties a flag indicating whether or not the chart property
     * editor should be available via the popup menu.
     * @param copy a flag indicating whether or not a copy option should be
     * available via the popup menu.
     * @param save a flag indicating whether or not save options should be
     * available via the popup menu.
     * @param print a flag indicating whether or not the print option should be
     * available via the popup menu.
     * @param zoom a flag indicating whether or not zoom options should be added
     * to the popup menu.
     * @param tooltips a flag indicating whether or not tooltips should be
     * enabled for the chart.
     *
     * @since 1.0.13
     */
    public PatchedChartPanel(JFreeChart chart, int width, int height,
            int minimumDrawWidth, int minimumDrawHeight, int maximumDrawWidth,
            int maximumDrawHeight, boolean useBuffer, boolean properties,
            boolean copy, boolean save, boolean print, boolean zoom,
            boolean tooltips) {
        super(chart, width, height, minimumDrawWidth, minimumDrawHeight, maximumDrawWidth, maximumDrawHeight, useBuffer, properties, copy, save, print, zoom, tooltips);
    }

    /**
     * Opens a file chooser and gives the user an opportunity to save the chart
     * in PNG format.
     *
     * @throws IOException if there is an I/O error.
     */
    public void doSaveAs() throws IOException {

        JFileChooser fileChooser = new JFileChooser();
        fileChooser.setCurrentDirectory(getDefaultDirectoryForSaveAs());
        ExtensionFileFilter filterPng = new ExtensionFileFilter(
                localizationResources.getString("PNG_Image_Files"), ".png");
        ExtensionFileFilter filterEps = new ExtensionFileFilter("EPS Image Files",".eps");

        fileChooser.addChoosableFileFilter(filterPng);
        fileChooser.addChoosableFileFilter(filterEps);

        int option = fileChooser.showSaveDialog(this);
        if (option == JFileChooser.APPROVE_OPTION) {
            String filename = fileChooser.getSelectedFile().getPath();
            if (isEnforceFileExtensions()) {
                if (fileChooser.getFileFilter() == filterPng) {
                    if (!filename.endsWith(".png")) {
                        filename = filename + ".png";
                    }
                } else if (fileChooser.getFileFilter() == filterPng) {
                    if (!filename.endsWith(".eps")) {
                        filename = filename + ".eps";
                    }
                }
            }
            String results = JOptionPane.showInputDialog("specify width, height of image", +getWidth() + "," + getHeight());
            String result[] = results.split(",");

            int width = 0, height = 0;
            if (result.length == 2) {
                try {
                    width = Integer.parseInt(result[0]);
                    height = Integer.parseInt(result[1]);
                } catch (Exception e) {

                }
            }
            if (fileChooser.getFileFilter() == filterPng) {
                OutputStream out = new BufferedOutputStream(new FileOutputStream(new File(filename)));
                PngEncoder encoder = null;
                if (width == 0 || height == 0) {
                    encoder = new PngEncoder(getHighResChartImage(DEFAULT_DPI), false, 0, 9);
                } else {
                    encoder = new PngEncoder(getHighResChartImage(width, height), false, 0, 9);
                }
                encoder.setDpi(DEFAULT_DPI, DEFAULT_DPI);
                byte[] pngData = encoder.pngEncode();
                out.write(pngData);
                out.close();
            } else {
                try {

                    OutputStream out = new java.io.FileOutputStream(new File(filename));
                    EPSDocumentGraphics2D g2d = new EPSDocumentGraphics2D(false);
                    g2d.setGraphicContext(new org.apache.xmlgraphics.java2d.GraphicContext());

                    g2d.setupDocument(out, width, height); //400pt x 200pt
                    this.getChart().draw(g2d, new Rectangle(width, height));
                    g2d.finish();
                    out.flush();
                    out.close();

                } catch (IOException fnfe) {
                    fnfe.printStackTrace();
                }
            }
        }
    }

    /**
     * Returns a high resolution BufferedImage of the chart. Uses the default
     * DPI_FILE_RESOLUTION.
     *
     * @return the buffered image.
     */
    private BufferedImage getHighResChartImage() {
        return getHighResChartImage(DEFAULT_DPI);
    }

    /**
     * Returns a high resolution BufferedImage of the chart. Uses the default
     * DPI_FILE_RESOLUTION.
     *     
* @param resolution The resolution, in dots per inch, of the image to
     * generate.
     * @return the buffered image.
     */
    private BufferedImage getHighResChartImage(int resolution) {
        int screenResolution
                = Toolkit.getDefaultToolkit().getScreenResolution();
        double scaleRatio = resolution / screenResolution;
        int rasterWidth = (int) (getWidth() * scaleRatio);
        int rasterHeight = (int) (getHeight() * scaleRatio);
        BufferedImage image = new BufferedImage(rasterWidth, rasterHeight,
                BufferedImage.TYPE_INT_RGB);
        Graphics2D g2 = image.createGraphics();
        g2.transform(AffineTransform.getScaleInstance(scaleRatio,
                scaleRatio));
        getChart().draw(g2, new Rectangle2D.Double(0,
                0, getWidth(), getHeight()), null);
        g2.dispose();
        return image;
    }

    private BufferedImage getHighResChartImage(int rasterWidth, int rasterHeight) {
        BufferedImage image = new BufferedImage(rasterWidth, rasterHeight,
                BufferedImage.TYPE_INT_RGB);
        Graphics2D g2 = image.createGraphics();

        float scaleFactor = (float) Math.max((double) rasterWidth / getWidth(), (double) rasterHeight / getHeight());

        g2.transform(AffineTransform.getScaleInstance((double) rasterWidth / getWidth(),
                (double) rasterHeight / getHeight()));

        if (getChart().getPlot() instanceof XYPlot) {
            XYPlot p = getChart().getXYPlot();

            Font f1 = p.getDomainAxis().getTickLabelFont();
            Font f2 = p.getRangeAxis().getTickLabelFont();
            Font f3 = p.getDomainAxis().getLabelFont();
            Font f4 = p.getRangeAxis().getLabelFont();
            Font f5 = null;
            if (getChart().getLegend() != null) {
                f5 = getChart().getLegend().getItemFont();
            }
            Font f6 = getChart().getTitle().getFont();

            BasicStroke stroke1 = null, stroke2 = null, stroke3 = null, stroke4 = null;
            if (p.getDomainGridlineStroke() instanceof BasicStroke) {
                stroke1 = (BasicStroke) p.getDomainGridlineStroke();
                getChart().getXYPlot().setDomainGridlineStroke(new BasicStroke(stroke1.getLineWidth() * scaleFactor));
            }
            if (p.getDomainMinorGridlineStroke() instanceof BasicStroke) {
                stroke3 = (BasicStroke) p.getDomainMinorGridlineStroke();
                p.setDomainMinorGridlineStroke(new BasicStroke(stroke3.getLineWidth() * scaleFactor));
            }
            if (p.getRangeGridlineStroke() instanceof BasicStroke) {
                stroke2 = (BasicStroke) p.getRangeGridlineStroke();
                p.setRangeGridlineStroke(new BasicStroke(stroke2.getLineWidth() * scaleFactor));
            }
            if (p.getRangeGridlineStroke() instanceof BasicStroke) {
                stroke4 = (BasicStroke) p.getRangeMinorGridlineStroke();
                p.setRangeMinorGridlineStroke(new BasicStroke(stroke4.getLineWidth() * scaleFactor));
            }

            ArrayList<BasicStroke> list = new ArrayList<BasicStroke>();
            for (int i = 0; i < p.getDatasetCount(); i++) {
                XYItemRenderer r = p.getRendererForDataset(p.getDataset(i));
                if (r == null) {
                    continue;
                }
                for (int j = 0; j < p.getDataset(i).getSeriesCount(); j++) {
                    if (r.getSeriesStroke(j) instanceof BasicStroke) {
                        BasicStroke s = (BasicStroke) r.getSeriesStroke(j);
                        r.setSeriesStroke(j, new BasicStroke(s.getLineWidth() * scaleFactor));
                        list.add(s);
                    }
                }
            }

            //TODO: das muss noch gespeichert werden um es später zurückzusetzen
            for (Object o : p.getAnnotations()) {
                if (o instanceof XYTitleAnnotation) {
                    XYTitleAnnotation annotation = (XYTitleAnnotation) o;
                    if (annotation.getTitle() instanceof LegendTitle) {
                        LegendTitle l = (LegendTitle) annotation.getTitle();

                        Font f = l.getItemFont();
                        l.setItemFont(f.deriveFont(f1.getSize() * scaleFactor));

                        RectangleInsets insets = l.getItemLabelPadding();
                        l.setItemLabelPadding(new RectangleInsets(2 * insets.getTop() * scaleFactor, 2 * insets.getLeft() * scaleFactor, 2 * insets.getBottom() * scaleFactor, 2 * insets.getRight() * scaleFactor));
                    }
                }
            }

            p.getDomainAxis().setTickLabelFont(f1.deriveFont((float) (f1.getSize() * scaleFactor)));
            p.getRangeAxis().setTickLabelFont(f2.deriveFont((float) (f2.getSize() * scaleFactor)));
            p.getDomainAxis().setLabelFont(f3.deriveFont((float) (f3.getSize() * scaleFactor)));
            p.getRangeAxis().setLabelFont(f4.deriveFont((float) (f4.getSize() * scaleFactor)));
            if (f5 != null) {
                getChart().getLegend().setItemFont(f5.deriveFont((float) (f5.getSize() * scaleFactor)));
            }

            getChart().setBackgroundPaint(Color.white);

            RectangleInsets insets = null;
            if (getChart().getLegend() != null) {
                insets = getChart().getLegend().getItemLabelPadding();
                getChart().getLegend().setItemLabelPadding(new RectangleInsets(2 * insets.getTop() * scaleFactor, 2 * insets.getLeft() * scaleFactor, 2 * insets.getBottom() * scaleFactor, 2 * insets.getRight() * scaleFactor));
            }
            getChart().getTitle().setFont(f6.deriveFont((float) (f6.getSize() * scaleFactor)));

            BufferedImage img = getChart().createBufferedImage(rasterWidth, rasterHeight);

            getChart().getXYPlot().getDomainAxis().setTickLabelFont(f1);
            getChart().getXYPlot().getRangeAxis().setTickLabelFont(f2);
            getChart().getXYPlot().getDomainAxis().setLabelFont(f3);
            getChart().getXYPlot().getRangeAxis().setLabelFont(f4);
            if (f5 != null) {
                getChart().getLegend().setItemFont(f5);
            }

            getChart().getTitle().setFont(f6);
            if (insets != null) {
                getChart().getLegend().setItemLabelPadding(insets);
            }
            int counter = 0;
            for (int i = 0; i < p.getDatasetCount(); i++) {
                XYItemRenderer r = p.getRendererForDataset(p.getDataset(i));
                if (r == null) {
                    continue;
                }
                for (int j = 0; j < p.getDataset(i).getSeriesCount(); j++) {
                    if (r.getSeriesStroke(j) instanceof BasicStroke) {
                        r.setSeriesStroke(j, list.get(counter++));
                    }
                }

            }

            if (stroke1 != null) {
                getChart().getXYPlot().setDomainGridlineStroke(stroke1);
            }
            if (stroke2 != null) {
                getChart().getXYPlot().setDomainMinorGridlineStroke(stroke2);
            }
            if (stroke3 != null) {
                getChart().getXYPlot().setRangeGridlineStroke(stroke3);
            }
            if (stroke4 != null) {
                getChart().getXYPlot().setRangeMinorGridlineStroke(stroke4);
            }

            return img;
        } else {
            //apply no font sclaing
            BufferedImage img = getChart().createBufferedImage(rasterWidth, rasterHeight);
            return img;
        }
        /*getChart().draw(g2, new Rectangle2D.Double(0,
         0, getWidth(), getHeight()), null);
         g2.dispose();
         return image;*/
    }

}
