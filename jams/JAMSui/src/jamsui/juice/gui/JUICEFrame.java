/*
 * JUICEFrame.java
 * Created on 4. April 2006, 14:18
 *
 * This file is part of JAMS
 * Copyright (C) 2005 FSU Jena
 *
 * This program is free software; you can redistribute it and/or
 * modify it under the terms of the GNU General Public License
 * as published by the Free Software Foundation; either version 2
 * modify it under the terms of the GNU Lesser General Public License
 * as published by the Free Software Foundation; either version 3
 * of the License, or (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 * GNU Lesser General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program; if not, write to the Free Software
 * Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301, USA
 * You should have received a copy of the GNU Lesser General Public License
 * along with this program; if not, see <http://www.gnu.org/licenses/>.
 *
 */
package jamsui.juice.gui;

import java.awt.event.*;
import java.beans.PropertyVetoException;
import java.io.File;
import java.io.IOException;
import java.util.*;
import javax.swing.*;
import jams.JAMS;
import jams.JAMSFileFilter;
import jams.JAMSLogging;
import jams.SystemProperties;
import jams.tools.JAMSTools;
import jams.gui.AboutDlg;
import jams.gui.tools.GUIHelper;
import jams.gui.LogViewDlg;
import jams.gui.PropertyDlg;
import jams.gui.RuntimeManagerPanel;
import jams.gui.WorkerDlg;
import jams.gui.WorkspaceDlg;
import jams.gui.tools.GUIState;
import jams.meta.ModelDescriptor;
import jams.server.client.gui.BrowseJAMSCloudDlg;
import jams.workspace.InvalidWorkspaceException;
import jams.workspace.JAMSWorkspace;
import jamsui.juice.*;
import jamsui.juice.documentation.DocumentationWizard;
import jamsui.juice.gui.tree.LibTree;
import jamsui.juice.gui.tree.ModelTree;
import java.awt.BorderLayout;
import java.awt.Dimension;
import java.awt.Toolkit;
import java.util.logging.Level;
import java.util.logging.Logger;
import optas.gui.wizard.ObjectiveConfiguration;
import optas.gui.wizard.OptimizerConfiguration;
import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.Node;

/**
 *
 * @author S. Kralisch
 */
public class JUICEFrame extends JFrame {

    static final Logger log = Logger.getLogger(JUICEFrame.class.getName());
    private static final int TREE_PANE_WIDTH = 250, RT_MANAGER_HEIGHT = 600;
    private static final int DIVIDER_WIDTH = 8;
    private PropertyDlg propertyDlg;
    private BrowseJAMSCloudDlg jamsCloudBrowser = null;
    private JFileChooser jfcProps, jfcParams, jfcModels;
    private TreePanel libTreePanel;
    private JDesktopPane modelPanel = new JDesktopPane();
    private JMenu windowMenu, modelMenu, recentMenu;
    private JMenuItem OptimizationWizardItem, ObjectiveWizardItem;
    private JLabel statusLabel;
    private JAMSCloudToolbar jamsServerToolbar = null;
    private final LogViewDlg infoDlg = new LogViewDlg(this, 400, 400, JAMS.i18n("Info_Log"));
    private final LogViewDlg errorDlg = new LogViewDlg(this, 400, 400, JAMS.i18n("Error_Log"));
    private Node modelProperties;
    WorkerDlg loadModelDlg;
    private SearchDlg searchDlg;
    private String modelPath;
    private Action editPrefsAction;
    private Action remoteControlAction;
    private Action reloadLibsAction;
    private Action newModelAction;
    private Action loadPrefsAction;
    private Action savePrefsAction;
    private Action loadModelAction;
    private Action saveModelAction;
    private Action saveAsModelAction;
    private Action exitAction;
    private Action aboutAction;
    private Action searchAction;
    private Action copyModelGUIAction;
    private Action pasteModelGUIAction;
    private Action OptimizationWizardAction;
    private Action ObjectiveWizardAction;
    private Action GenerateDocumentationGUIAction;
    private Action loadModelParamAction;
    private Action saveModelParamAction;
    private Action runModelAction;
    private Action runModelFromLauncherAction;
    private Action jadeAction;
    private Action wsBrowseAction;
    private Action infoLogAction;
    private Action errorLogAction;
    private Action onlineAction;
    private Action outputDSAction;
    private Action wsPrefsAction;
    private Action wsCreateAction;

    public JUICEFrame() {
        JAMSLogging.registerLogger(JAMSLogging.LogOption.Show, log);
        init();
    }

    private void init() {
        setDefaultCloseOperation(WindowConstants.DO_NOTHING_ON_CLOSE);

        GUIState.setMainWindow(this);

        this.addWindowListener(new WindowListener() {
            @Override
            public void windowActivated(WindowEvent e) {
            }

            @Override
            public void windowClosed(WindowEvent e) {
            }

            @Override
            public void windowClosing(WindowEvent e) {
                exit();
            }

            @Override
            public void windowDeactivated(WindowEvent e) {
            }

            @Override
            public void windowDeiconified(WindowEvent e) {
            }

            @Override
            public void windowIconified(WindowEvent e) {
            }

            @Override
            public void windowOpened(WindowEvent e) {
            }
        });

        remoteControlAction = new AbstractAction(JAMS.i18n("Start_Remote_Control")) {
            @Override
            public void actionPerformed(ActionEvent e) {
                if (jamsCloudBrowser == null) {
                    jamsCloudBrowser = new BrowseJAMSCloudDlg(JUICEFrame.this, JUICE.getJamsProperties());
                    jamsCloudBrowser.init();
                    jamsCloudBrowser.setDefaultCloseOperation(JDialog.DISPOSE_ON_CLOSE);
                }
                GUIHelper.centerOnParent(jamsCloudBrowser, true);
                jamsCloudBrowser.setVisible(true);
            }
        };

        editPrefsAction = new AbstractAction(JAMS.i18n("Edit_Preferences...")) {
            @Override
            public void actionPerformed(ActionEvent e) {
                propertyDlg.setProperties(JUICE.getJamsProperties());
                propertyDlg.setVisible(true);
                if (propertyDlg.getResult() == PropertyDlg.APPROVE_OPTION) {
                    propertyDlg.validateProperties();
                }
            }
        };

        reloadLibsAction = new AbstractAction(JAMS.i18n("Reload")) {
            @Override
            public void actionPerformed(ActionEvent e) {
                JUICE.updateLibs();
            }
        };

        newModelAction = new AbstractAction(JAMS.i18n("New_Model")) {
            @Override
            public void actionPerformed(ActionEvent e) {
                newModel();
            }
        };

        loadPrefsAction = new AbstractAction(JAMS.i18n("Load_Preferences...")) {
            @Override
            public void actionPerformed(ActionEvent e) {
                jfcProps.setSelectedFile(new File(""));
                int result = jfcProps.showOpenDialog(JUICEFrame.this);

                if (result == JFileChooser.APPROVE_OPTION) {
                    String stringValue = jfcProps.getSelectedFile().getAbsolutePath();
                    try {
                        SystemProperties properties = JUICE.getJamsProperties();
                        properties.load(stringValue);

                    } catch (IOException ioe) {
                        JAMSTools.handle(ioe);
                    }
                }
            }
        };

        savePrefsAction = new AbstractAction(JAMS.i18n("Save_Preferences...")) {
            @Override
            public void actionPerformed(ActionEvent e) {
                jfcProps.setSelectedFile(new File(""));
                int result = jfcProps.showSaveDialog(JUICEFrame.this);

                if (result == JFileChooser.APPROVE_OPTION) {
                    String stringValue = jfcProps.getSelectedFile().getAbsolutePath();
                    try {
                        SystemProperties properties = JUICE.getJamsProperties();
                        properties.save(stringValue);
                    } catch (IOException ioe) {
                        JAMSTools.handle(ioe);
                    }
                }
            }
        };

        loadModelAction = new AbstractAction(JAMS.i18n("Open_Model...")) {
            @Override
            public void actionPerformed(ActionEvent e) {
                loadModel(getCurrentView());
            }
        };

        saveModelAction = new AbstractAction(JAMS.i18n("Save_Model")) {
            @Override
            public void actionPerformed(ActionEvent e) {
                saveModel(getCurrentView());
            }
        };
        saveModelAction.setEnabled(false);

        saveAsModelAction = new AbstractAction(JAMS.i18n("Save_Model_As...")) {
            @Override
            public void actionPerformed(ActionEvent e) {
                saveModelAs(getCurrentView());
            }
        };
        saveAsModelAction.setEnabled(false);

        exitAction = new AbstractAction(JAMS.i18n("Exit")) {
            @Override
            public void actionPerformed(ActionEvent e) {
                exit();
            }
        };

        aboutAction = new AbstractAction(JAMS.i18n("About")) {
            @Override
            public void actionPerformed(ActionEvent e) {
                new AboutDlg(JUICEFrame.this).setVisible(true);
            }
        };

        searchAction = new AbstractAction(JAMS.i18n("Find...")) {
            @Override
            public void actionPerformed(ActionEvent e) {
                if (searchDlg == null) {
                    searchDlg = new SearchDlg(JUICEFrame.this);
                }
                searchDlg.setVisible(true);
            }
        };

        copyModelGUIAction = new AbstractAction(JAMS.i18n("Copy_Model_GUI")) {
            @Override
            public void actionPerformed(ActionEvent e) {
                pasteModelGUIAction.setEnabled(true);
                ModelView view = getCurrentView();
                modelProperties = view.getModelDoc().getElementsByTagName("launcher").item(0).cloneNode(true);
            }
        };

        pasteModelGUIAction = new AbstractAction(JAMS.i18n("Paste_Model_GUI")) {
            @Override
            public void actionPerformed(ActionEvent e) {
                ModelView view = getCurrentView();

                view.getModelDescriptor().setModelParameters((Element) modelProperties);

            }
        };

        OptimizationWizardAction = new AbstractAction(JAMS.i18n("Configure_Optimizer")) {
            @Override
            public void actionPerformed(ActionEvent e) {
                final ModelView view = getCurrentView();
                try {

                    OptimizerConfiguration conf = new OptimizerConfiguration(view.getModelDescriptor(),
                            Logger.getLogger(JUICE.class.getName()));

                    conf.addActionListener(new ActionListener() {
                        @Override
                        public void actionPerformed(ActionEvent e) {

                            OptimizerConfiguration wizard = (OptimizerConfiguration) e.getSource();
                            if (wizard.getSuccessState()) {
                                ModelDescriptor newModelDoc = wizard.getModelDescriptor();
                                view.setModelDescriptor(newModelDoc);
                                view.loadModel(view.getModelDoc());
                            }
                        }
                    });

                    conf.showDialog(JUICEFrame.this);
                } catch (Throwable ex) {
                    ex.printStackTrace();
                    JOptionPane.showMessageDialog(JUICEFrame.this, "Unable to run optimization wizard!\n" + ex.toString());
                }
            }
        };

        ObjectiveWizardAction = new AbstractAction(JAMS.i18n("Configure_Efficiencies")) {
            @Override
            public void actionPerformed(ActionEvent e) {
                final ModelView view = getCurrentView();
                try {

                    ObjectiveConfiguration conf = new ObjectiveConfiguration(view.getModelDescriptor(), view.getSavePath(),
                            Logger.getLogger(JUICE.class.getName()));

                    conf.addActionListener(new ActionListener() {
                        @Override
                        public void actionPerformed(ActionEvent e) {
                            ObjectiveConfiguration wizard = (ObjectiveConfiguration) e.getSource();
                            ModelDescriptor newModelDoc = wizard.getModelDescriptor();
                            view.setModelDescriptor(newModelDoc);
                            view.loadModel(view.getModelDoc());

                        }
                    });

                    conf.showDialog(JUICEFrame.this);
                } catch (Throwable ex) {
                    ex.printStackTrace();
                    JOptionPane.showMessageDialog(JUICEFrame.this, "Unable to run objective wizard!\n" + ex.toString());
                }
            }
        };

        GenerateDocumentationGUIAction = new AbstractAction(JAMS.i18n("Generate_Docu")) {
            @Override
            public void actionPerformed(ActionEvent e) {
                ModelView view = getCurrentView();

                DocumentationWizard docuWiz = new DocumentationWizard();

                docuWiz.createDocumentation(JUICEFrame.this, view.getModelDoc(), JUICE.getJamsProperties(), view.getSavePath());
                /*DocumentationWizard.(JUICEFrame.this, view.getModelDoc() ,
                 JUICE.getJamsProperties(), view.getSavePath().getParent()).setVisible(true);*/
            }
        };

        loadModelParamAction = new AbstractAction(JAMS.i18n("Load_Model_Parameter...")) {
            @Override
            public void actionPerformed(ActionEvent e) {
                jfcParams.setSelectedFile(new File(getCurrentView().getWorkspace().getDirectory(), "."));
                int result = jfcParams.showOpenDialog(JUICEFrame.this);

                if (result == JFileChooser.APPROVE_OPTION) {
                    String path = jfcParams.getSelectedFile().getAbsolutePath();
                    File file = new File(path);
                    getCurrentView().loadParams(file);
                }
            }
        };

        saveModelParamAction = new AbstractAction(JAMS.i18n("Save_Model_Parameter...")) {
            @Override
            public void actionPerformed(ActionEvent e) {
                jfcParams.setSelectedFile(new File(""));
                int result = jfcParams.showSaveDialog(JUICEFrame.this);

                if (result == JFileChooser.APPROVE_OPTION) {
                    String path = jfcParams.getSelectedFile().getAbsolutePath();
                    File file = new File(path);
                    getCurrentView().saveParams(file);
                }
            }
        };

        runModelAction = new AbstractAction(JAMS.i18n("Run_Model")) {
            @Override
            public void actionPerformed(ActionEvent e) {
                ModelView view = getCurrentView();
                view.runModel();
            }
        };

        runModelFromLauncherAction = new AbstractAction(JAMS.i18n("Run_model_from_JAMS_Launcher")) {
            @Override
            public void actionPerformed(ActionEvent e) {
                ModelView view = getCurrentView();
                view.runModelFromLauncher();
            }
        };

        infoLogAction = new AbstractAction(JAMS.i18n("Info_Log...")) {
            @Override
            public void actionPerformed(ActionEvent e) {
                infoDlg.setVisible(true);
            }
        };

        errorLogAction = new AbstractAction(JAMS.i18n("Error_Log...")) {
            @Override
            public void actionPerformed(ActionEvent e) {
                errorDlg.setVisible(true);
            }
        };

        onlineAction = new AbstractAction(JAMS.i18n("JAMS_online...")) {
            @Override
            public void actionPerformed(ActionEvent e) {
                GUIHelper.openURL(JAMS.i18n("JAMS_URL"));
            }
        };

        outputDSAction = new AbstractAction(JAMS.i18n("Model_output")) {
            @Override
            public void actionPerformed(ActionEvent e) {
                getCurrentView().getOutputDSDlg().setVisible(true);
            }
        };

        jadeAction = new AbstractAction(JAMS.i18n("DATA_EXPLORER")) {
            @Override
            public void actionPerformed(ActionEvent e) {
                ModelView view = getCurrentView();
                view.openExplorer();
            }
        };

        wsBrowseAction = new AbstractAction(JAMS.i18n("Browse_WS_Dir")) {
            @Override
            public void actionPerformed(ActionEvent e) {
                ModelView view = getCurrentView();
                view.openWSBrowser();
            }
        };

        wsCreateAction = new AbstractAction(JAMS.i18n("Create_WS_Dir")) {
            @Override
            public void actionPerformed(ActionEvent e) {
                ModelView view = getCurrentView();
                view.createWS();
            }
        };

        wsPrefsAction = new AbstractAction(JAMS.i18n("EDIT_WORKSPACE...")) {
            @Override
            public void actionPerformed(ActionEvent e) {
                WorkspaceDlg wsDlg = new WorkspaceDlg(JUICEFrame.this);
                ModelView view = getCurrentView();

                JAMSWorkspace ws = view.getWorkspace();
                if (ws == null) {
                    GUIHelper.showErrorDlg(JUICE.getJuiceFrame(), JAMS.i18n("Invalid_Workspace"), JAMS.i18n("Error"));
                    return;
                }

                try {
                    ws.init();
                    wsDlg.setVisible(ws);
                } catch (InvalidWorkspaceException ex) {
                    GUIHelper.showErrorDlg(JUICE.getJuiceFrame(), JAMS.i18n("Invalid_Workspace"), JAMS.i18n("Error"));
                }

            }
        };

        setIconImages(JAMSTools.getJAMSIcons());
        setTitle(JUICE.APP_TITLE);

        loadModelDlg = new WorkerDlg(this, JAMS.i18n("Loading_Model"));

        propertyDlg = new PropertyDlg(this, JUICE.getJamsProperties());

        jfcModels = GUIHelper.getJFileChooser(JAMSFileFilter.getModelFilter());
        jfcModels.setFileSelectionMode(JFileChooser.FILES_ONLY);
        jfcModels.setCurrentDirectory(JAMS.getBaseDir());

        jfcParams = GUIHelper.getJFileChooser(JAMSFileFilter.getParameterFilter());
        jfcParams.setFileSelectionMode(JFileChooser.FILES_ONLY);
        jfcParams.setCurrentDirectory(JAMS.getBaseDir());

        jfcProps = GUIHelper.getJFileChooser(JAMSFileFilter.getPropertyFilter());
        jfcProps.setFileSelectionMode(JFileChooser.FILES_ONLY);
        jfcProps.setCurrentDirectory(JAMS.getBaseDir());

        // use outline or live drag mode for performance or look
        if (System.getProperty("os.name").contains("Windows")) {
            modelPanel.setDragMode(JDesktopPane.LIVE_DRAG_MODE);
        } else {
            modelPanel.setDragMode(JDesktopPane.OUTLINE_DRAG_MODE);
        }

        JButton reloadLibsButton = new JButton(reloadLibsAction);

        libTreePanel = new TreePanel();
        libTreePanel.addCustomButton(reloadLibsButton);

        JPanel rtManagerPanel = new JPanel();
        rtManagerPanel.setLayout(new BorderLayout());
        rtManagerPanel.add(new JLabel(" " + JAMS.i18n("Runtime_Manager") + ":"), BorderLayout.NORTH);
        rtManagerPanel.add(new RuntimeManagerPanel(), BorderLayout.CENTER);

        JSplitPane leftSplitPane = new JSplitPane();
        leftSplitPane.setAutoscrolls(true);
        leftSplitPane.setContinuousLayout(true);
        leftSplitPane.setOrientation(JSplitPane.VERTICAL_SPLIT);
        leftSplitPane.setTopComponent(libTreePanel);
        leftSplitPane.setBottomComponent(rtManagerPanel);

        JSplitPane mainSplitPane = new JSplitPane();
        mainSplitPane.setAutoscrolls(true);
        mainSplitPane.setContinuousLayout(true);
        mainSplitPane.setLeftComponent(leftSplitPane);
        mainSplitPane.setRightComponent(modelPanel);
        mainSplitPane.setDividerLocation(TREE_PANE_WIDTH);
        mainSplitPane.setOneTouchExpandable(true);
        mainSplitPane.setDividerSize(DIVIDER_WIDTH);

        getContentPane().add(mainSplitPane, java.awt.BorderLayout.CENTER);

        JToolBar toolBar = new JToolBar();
        //toolBar.setPreferredSize(new Dimension(0, JAMS.TOOLBAR_HEIGHT));

        /*
         * toolbar buttons
         */
        JButton modelNewButton = new JButton(newModelAction);
        modelNewButton.setText("");
        modelNewButton.setToolTipText(JAMS.i18n("New_Model"));
        modelNewButton.setIcon(new ImageIcon(getClass().getResource("/resources/images/ModelNew.png")));
        toolBar.add(modelNewButton);

        JButton modelOpenButton = new JButton(loadModelAction);
        modelOpenButton.setText("");
        modelOpenButton.setToolTipText(JAMS.i18n("Open_Model..."));
        modelOpenButton.setIcon(new ImageIcon(getClass().getResource("/resources/images/ModelOpen.png")));
        toolBar.add(modelOpenButton);

        JButton modelSaveButton = new JButton(saveModelAction);
        modelSaveButton.setText("");
        modelSaveButton.setToolTipText(JAMS.i18n("Save_Model"));
        modelSaveButton.setIcon(new ImageIcon(getClass().getResource("/resources/images/ModelSave.png")));
        toolBar.add(modelSaveButton);

        toolBar.addSeparator();

        JButton searchButton = new JButton(searchAction);
        searchButton.setText("");
        searchButton.setToolTipText(JAMS.i18n("Find..."));
        searchButton.setIcon(new ImageIcon(getClass().getResource("/resources/images/Search.png")));
        toolBar.add(searchButton);

        JButton prefsButton = new JButton(editPrefsAction);
        prefsButton.setText("");
        prefsButton.setToolTipText(JAMS.i18n("Edit_Preferences..."));
        prefsButton.setIcon(new ImageIcon(getClass().getResource("/resources/images/Preferences.png")));
        toolBar.add(prefsButton);

        JButton infoLogButton = new JButton(infoLogAction);
        infoLogButton.setText("");
        infoLogButton.setToolTipText(JAMS.i18n("Show_Info_Log..."));
        infoLogButton.setIcon(new ImageIcon(getClass().getResource("/resources/images/InfoLog.png")));
        toolBar.add(infoLogButton);

        JButton errorLogButton = new JButton(errorLogAction);
        errorLogButton.setText("");
        errorLogButton.setToolTipText(JAMS.i18n("Show_Error_Log..."));
        errorLogButton.setIcon(new ImageIcon(getClass().getResource("/resources/images/ErrorLog.png")));
        toolBar.add(errorLogButton);

        toolBar.addSeparator();

        JButton modelRunButton = new JButton(runModelAction);
        modelRunButton.setText("");
        modelRunButton.setToolTipText(JAMS.i18n("Run_Model"));
        modelRunButton.setIcon(new ImageIcon(getClass().getResource("/resources/images/ModelRun.png")));
        toolBar.add(modelRunButton);

        JButton modelGUIRunButton = new JButton(runModelFromLauncherAction);
        modelGUIRunButton.setText("");
        modelGUIRunButton.setToolTipText(JAMS.i18n("Run_model_from_JAMS_Launcher"));
        modelGUIRunButton.setIcon(new ImageIcon(getClass().getResource("/resources/images/ModelRunLauncher.png")));
        toolBar.add(modelGUIRunButton);

//        JButton modelRunRemoteButton = new JButton(runModelRemoteAction);
//        modelRunRemoteButton.setText("");
//        modelRunRemoteButton.setToolTipText(JAMS.i18n("Run_Model_Remote"));
//        modelRunRemoteButton.setIcon(new ImageIcon(getClass().getResource("/resources/images/ModelRunCloud.png")));
//        toolBar.add(modelRunRemoteButton);
        toolBar.addSeparator();

        JButton outputDSButton = new JButton(outputDSAction);
        outputDSButton.setText("");
        outputDSButton.setToolTipText(JAMS.i18n("Model_output"));
        outputDSButton.setIcon(new ImageIcon(getClass().getResource("/resources/images/DataOutput2.png")));
        toolBar.add(outputDSButton);

        JButton wsBrowseButton = new JButton(wsBrowseAction);
        wsBrowseButton.setText("");
        wsBrowseButton.setToolTipText(JAMS.i18n("Browse_WS_Dir"));
        wsBrowseButton.setIcon(new ImageIcon(getClass().getResource("/resources/images/ws_browse.png")));
        toolBar.add(wsBrowseButton);

        JButton wsPrefsButton = new JButton(wsPrefsAction);
        wsPrefsButton.setText("");
        wsPrefsButton.setToolTipText(JAMS.i18n("EDIT_WORKSPACE..."));
        wsPrefsButton.setIcon(new ImageIcon(getClass().getResource("/resources/images/ws_prefs.png")));
        toolBar.add(wsPrefsButton);

        JButton jadeButton = new JButton(jadeAction);
        jadeButton.setText("");
        jadeButton.setToolTipText(JAMS.i18n("JADE"));
        jadeButton.setIcon(new ImageIcon(getClass().getResource("/resources/images/ws_jade.png")));
        toolBar.add(jadeButton);

//        JButton wsCreateButton = new JButton(wsCreateAction);
//        wsCreateButton.setText("");
//        wsCreateButton.setToolTipText(JAMS.i18n("Create_WS_Dir"));
//        wsCreateButton.setIcon(new ImageIcon(getClass().getResource("/resources/images/ws_new.png")));
//        toolBar.add(wsCreateButton);
//        toolBar.addSeparator();
//        JButton copyGUIButton = new JButton(copyModelGUIAction);
//        copyGUIButton.setText("");
//        copyGUIButton.setToolTipText(JAMS.i18n("Copy_Model_GUI"));
//        copyGUIButton.setIcon(new ImageIcon(getClass().getResource("/resources/images/Copy.png")));
//        toolBar.add(copyGUIButton);
//
//        JButton pasteGUIButton = new JButton(pasteModelGUIAction);
//        pasteGUIButton.setText("");
//        pasteGUIButton.setToolTipText(JAMS.i18n("Paste_Model_GUI"));
//        pasteGUIButton.setIcon(new ImageIcon(getClass().getResource("/resources/images/Paste.png")));
//        toolBar.add(pasteGUIButton);
//        toolBar.addSeparator();
//
//        JButton helpButton = new JButton(onlineAction);
//        helpButton.setText("");
//        helpButton.setToolTipText(JAMS.i18n("JAMS_online..."));
//        helpButton.setIcon(new ImageIcon(getClass().getResource("/resources/images/Browser.png")));
//        toolBar.add(helpButton);
//
//        JButton exitButton = new JButton(exitAction);
//        exitButton.setText("");
//        exitButton.setToolTipText(JAMS.i18n("Exit"));
//        exitButton.setIcon(new ImageIcon(getClass().getResource("/resources/images/system-shutdown.png")));
//        toolBar.add(exitButton);
        JPanel toolbarPanel = new JPanel();
        toolbarPanel.setLayout(new BoxLayout(toolbarPanel, BoxLayout.X_AXIS));
        jamsServerToolbar = new JAMSCloudToolbar(this, JUICE.getJamsProperties());

        toolbarPanel.add(toolBar);
        toolbarPanel.add(jamsServerToolbar);
        getContentPane().add(toolbarPanel, BorderLayout.PAGE_START);


        /*
         * status panel
         */
        JPanel statusPanel = new JPanel();
        statusPanel.setLayout(new java.awt.BorderLayout());
        statusPanel.setBorder(BorderFactory.createEtchedBorder());
        statusPanel.setPreferredSize(new java.awt.Dimension(14, 20));
        statusLabel = new JLabel();
        statusLabel.setText(JAMS.i18n("JAMS_Status"));
        statusPanel.add(statusLabel, java.awt.BorderLayout.CENTER);
        getContentPane().add(statusPanel, java.awt.BorderLayout.SOUTH);

        /*
         * menu stuff
         */
        JMenuBar mainMenu = new JMenuBar();

        /*
         * file menu
         */
        JMenu fileMenu = new JMenu(JAMS.i18n("File"));
        mainMenu.add(fileMenu);

        JMenuItem newModelItem = new JMenuItem(newModelAction);
        newModelItem.setAccelerator(KeyStroke.getKeyStroke(KeyEvent.VK_N, ActionEvent.CTRL_MASK));
        fileMenu.add(newModelItem);

        JMenuItem loadModelItem = new JMenuItem(loadModelAction);
        loadModelItem.setAccelerator(KeyStroke.getKeyStroke(KeyEvent.VK_L, ActionEvent.CTRL_MASK));
        fileMenu.add(loadModelItem);

        recentMenu = new JMenu(JAMS.i18n("Recent_Files"));
        updateRecentMenu();
        fileMenu.add(recentMenu);

        JMenuItem saveModelItem = new JMenuItem(saveModelAction);
        saveModelItem.setAccelerator(KeyStroke.getKeyStroke(KeyEvent.VK_S, ActionEvent.CTRL_MASK));
        fileMenu.add(saveModelItem);

        JMenuItem saveAsModelItem = new JMenuItem(saveAsModelAction);
        saveAsModelItem.setAccelerator(KeyStroke.getKeyStroke(KeyEvent.VK_A, ActionEvent.CTRL_MASK));
        fileMenu.add(saveAsModelItem);

        fileMenu.add(new JSeparator());

        JMenuItem remoteControlItem = new JMenuItem(remoteControlAction);
        remoteControlItem.setAccelerator(KeyStroke.getKeyStroke(KeyEvent.VK_R, ActionEvent.CTRL_MASK));
        fileMenu.add(remoteControlItem);

        JMenuItem exitItem = new JMenuItem(exitAction);
        exitItem.setAccelerator(KeyStroke.getKeyStroke(KeyEvent.VK_X, ActionEvent.CTRL_MASK));
        fileMenu.add(exitItem);

        /*
         * edit menu
         */
        JMenu extrasMenu = new JMenu(JAMS.i18n("Edit"));
        mainMenu.add(extrasMenu);

        JMenuItem editPrefsItem = new JMenuItem(editPrefsAction);
        editPrefsItem.setAccelerator(KeyStroke.getKeyStroke(KeyEvent.VK_P, ActionEvent.CTRL_MASK));
        extrasMenu.add(editPrefsItem);

        JMenuItem loadPrefsItem = new JMenuItem(loadPrefsAction);
        extrasMenu.add(loadPrefsItem);

        JMenuItem savePrefsItem = new JMenuItem(savePrefsAction);
        extrasMenu.add(savePrefsItem);

        extrasMenu.add(new JSeparator());

        JMenuItem searchItem = new JMenuItem(searchAction);
        searchItem.setAccelerator(KeyStroke.getKeyStroke(KeyEvent.VK_F, ActionEvent.CTRL_MASK));
        extrasMenu.add(searchItem);


        /*
         * model menu
         */
        modelMenu = new JMenu(JAMS.i18n("Model"));
        modelMenu.setEnabled(false);
        mainMenu.add(modelMenu);

        JMenuItem runModelItem = new JMenuItem(runModelAction);
        runModelAction.setEnabled(false);
        runModelItem.setAccelerator(KeyStroke.getKeyStroke(KeyEvent.VK_R, ActionEvent.CTRL_MASK));
        modelMenu.add(runModelItem);

        JMenuItem runModelInLauncherItem = new JMenuItem(runModelFromLauncherAction);
        runModelFromLauncherAction.setEnabled(false);
        modelMenu.add(runModelInLauncherItem);

//        JMenuItem runModelRemoteItem = new JMenuItem(runModelRemoteAction);
//        runModelRemoteAction.setEnabled(false);
//        runModelRemoteItem.setAccelerator(KeyStroke.getKeyStroke(KeyEvent.VK_C, ActionEvent.CTRL_MASK));
//        modelMenu.add(runModelRemoteItem);
        modelMenu.add(new JSeparator());

        JMenuItem dsItem = new JMenuItem(outputDSAction);
        outputDSAction.setEnabled(false);
        dsItem.setAccelerator(KeyStroke.getKeyStroke(KeyEvent.VK_O, ActionEvent.CTRL_MASK));
        modelMenu.add(dsItem);

        JMenuItem jadeItem = new JMenuItem(jadeAction);
        jadeAction.setEnabled(false);
        jadeItem.setAccelerator(KeyStroke.getKeyStroke(KeyEvent.VK_J, ActionEvent.CTRL_MASK));
        modelMenu.add(jadeItem);

        JMenuItem browserItem = new JMenuItem(wsBrowseAction);
        wsBrowseAction.setEnabled(false);
        browserItem.setAccelerator(KeyStroke.getKeyStroke(KeyEvent.VK_E, ActionEvent.CTRL_MASK));
        modelMenu.add(browserItem);

        JMenuItem workspaceDlgItem = new JMenuItem(wsPrefsAction);
        wsPrefsAction.setEnabled(false);
        workspaceDlgItem.setAccelerator(KeyStroke.getKeyStroke(KeyEvent.VK_W, ActionEvent.CTRL_MASK));
        modelMenu.add(workspaceDlgItem);

        JMenuItem workspaceNewItem = new JMenuItem(wsCreateAction);
        wsCreateAction.setEnabled(false);
//        workspaceNewItem.setAccelerator(KeyStroke.getKeyStroke(KeyEvent.VK_C, ActionEvent.CTRL_MASK));
        modelMenu.add(workspaceNewItem);

        modelMenu.add(new JSeparator());

        JMenuItem loadModelParamItem = new JMenuItem(loadModelParamAction);
        //loadModelParamItem.setAccelerator(KeyStroke.getKeyStroke(KeyEvent.VK_R, ActionEvent.CTRL_MASK));
        modelMenu.add(loadModelParamItem);

        JMenuItem saveModelParamItem = new JMenuItem(saveModelParamAction);
        //loadModelParamItem.setAccelerator(KeyStroke.getKeyStroke(KeyEvent.VK_R, ActionEvent.CTRL_MASK));
        modelMenu.add(saveModelParamItem);

        modelMenu.add(new JSeparator());

        JMenuItem copyModelParameterItem = new JMenuItem(copyModelGUIAction);
        copyModelGUIAction.setEnabled(false);
        modelMenu.add(copyModelParameterItem);

        JMenuItem pasteModelParameterItem = new JMenuItem(pasteModelGUIAction);
        pasteModelGUIAction.setEnabled(false);
        modelMenu.add(pasteModelParameterItem);

        modelMenu.add(new JSeparator());
        OptimizationWizardItem = new JMenuItem(OptimizationWizardAction);
        OptimizationWizardAction.setEnabled(false);
        modelMenu.add(OptimizationWizardItem);

        ObjectiveWizardItem = new JMenuItem(ObjectiveWizardAction);
        ObjectiveWizardAction.setEnabled(false);
        modelMenu.add(ObjectiveWizardItem);

        modelMenu.add(new JSeparator());

        JMenuItem GenerateDocumentationItem = new JMenuItem(GenerateDocumentationGUIAction);
        GenerateDocumentationGUIAction.setEnabled(true);
        modelMenu.add(GenerateDocumentationItem);
        /*
         * logs menu
         */
        JMenu logsMenu = new JMenu(JAMS.i18n("Logs"));
        mainMenu.add(logsMenu);

        JMenuItem infoLogItem = new JMenuItem(infoLogAction);
        logsMenu.add(infoLogItem);

        JMenuItem errorLogItem = new JMenuItem(errorLogAction);
        logsMenu.add(errorLogItem);

        /*
         * windows menu
         */
        windowMenu = new JMenu(JAMS.i18n("Windows"));
        windowMenu.setEnabled(false);
        ModelView.viewList.addObserver(new Observer() {
            @Override
            public void update(Observable o, Object arg) {
                JUICEFrame.this.windowMenu.removeAll();
                ArrayList<ModelView> mViews = ModelView.viewList.getViewList();
                for (int i = 0; i < mViews.size(); i++) {
                    JInternalFrame frame = mViews.get(i).getFrame();
                    WindowItem windowItem = new WindowItem(frame.getTitle(), frame);
                    windowItem.addActionListener(new ActionListener() {
                        @Override
                        public void actionPerformed(ActionEvent e) {
                            WindowItem item = (WindowItem) e.getSource();
                            try {
                                item.frame.setSelected(true);
                            } catch (PropertyVetoException pve) {
                                JAMSTools.handle(pve);
                            }
                        }
                    });
                    JUICEFrame.this.windowMenu.add(windowItem);
                }
                if (mViews.size() == 0) {
                    JUICEFrame.this.windowMenu.setEnabled(false);
                    return;
                } else {
                    JUICEFrame.this.windowMenu.setEnabled(true);
                }
            }
        });
        mainMenu.add(windowMenu);

        /*
         * help menu
         */
        JMenu helpMenu = new JMenu(JAMS.i18n("Help"));
        mainMenu.add(helpMenu);

        JMenuItem onlineItem = new JMenuItem(onlineAction);
        helpMenu.add(onlineItem);

        JMenuItem aboutItem = new JMenuItem(aboutAction);
        helpMenu.add(aboutItem);

        /*
         * register observer for ModelView.viewList
         */
        ModelView.viewList.addObserver(new Observer() {
            @Override
            public void update(Observable o, Object arg) {
                if (ModelView.viewList.getViewList().size() > 0) {
                    JUICEFrame.this.modelMenu.setEnabled(true);
                    JUICEFrame.this.saveModelAction.setEnabled(true);
                    JUICEFrame.this.outputDSAction.setEnabled(true);
                    JUICEFrame.this.runModelAction.setEnabled(true);
//                    JUICEFrame.this.runModelRemoteAction.setEnabled(true);
                    JUICEFrame.this.runModelFromLauncherAction.setEnabled(true);
                    JUICEFrame.this.jadeAction.setEnabled(true);
                    JUICEFrame.this.wsBrowseAction.setEnabled(true);
                    JUICEFrame.this.wsPrefsAction.setEnabled(true);
                    JUICEFrame.this.wsCreateAction.setEnabled(true);
                    JUICEFrame.this.copyModelGUIAction.setEnabled(true);
                    JUICEFrame.this.saveAsModelAction.setEnabled(true);
                    JUICEFrame.this.OptimizationWizardAction.setEnabled(true);
                    JUICEFrame.this.ObjectiveWizardAction.setEnabled(true);
                } else {
                    JUICEFrame.this.modelMenu.setEnabled(false);
                    JUICEFrame.this.outputDSAction.setEnabled(false);
                    JUICEFrame.this.runModelAction.setEnabled(false);
//                    JUICEFrame.this.runModelRemoteAction.setEnabled(false);
                    JUICEFrame.this.runModelFromLauncherAction.setEnabled(false);
                    JUICEFrame.this.jadeAction.setEnabled(false);
                    JUICEFrame.this.wsBrowseAction.setEnabled(false);
                    JUICEFrame.this.wsPrefsAction.setEnabled(false);
                    JUICEFrame.this.wsCreateAction.setEnabled(false);
                    JUICEFrame.this.copyModelGUIAction.setEnabled(false);
                    JUICEFrame.this.pasteModelGUIAction.setEnabled(false);
                    JUICEFrame.this.saveModelAction.setEnabled(false);
                    JUICEFrame.this.saveAsModelAction.setEnabled(false);
                }
            }
        });

        /*
         * set main menu and initial size
         */
        setJMenuBar(mainMenu);
        Dimension d = Toolkit.getDefaultToolkit().getScreenSize();

        int height = Math.min((int) (d.height * 0.95), JUICE.SCREEN_HEIGHT);
        int width = Math.min((int) (d.width * 0.95), JUICE.SCREEN_WIDTH);

        setSize(width, height);
        leftSplitPane.setDividerLocation((int) (height * 0.6));

        this.libTreePanel.requestFocus();
    }

    public void setLibTree(LibTree tree) {
        this.libTreePanel.setTree(tree);
    }

    public void newModel() {
        SwingWorker w = new SwingWorker() {
            @Override
            protected Object doInBackground() throws Exception {
                ModelView mView = new ModelView(modelPanel);
                mView.setTree(new ModelTree(mView, null));
                mView.setInitialState();
                mView.getFrame().setVisible(true);
                mView.getFrame().requestFocus();
                return mView;
            }
        };
        w.execute();
    }
    //this method is necessary if we like to create a view and set a doc

    public void newModel(final Document doc) {
        SwingWorker w = new SwingWorker() {
            @Override
            protected Object doInBackground() throws Exception {
                ModelView mView = new ModelView(modelPanel);
                mView.setTree(new ModelTree(mView, null));
                mView.setInitialState();
                mView.getFrame().setVisible(true);
                mView.getFrame().requestFocus();
                mView.setTree(new ModelTree(mView, doc));
//                System.out.println(XMLTools.getStringFromDocument(doc));
                return mView;
            }
        };
        w.execute();
    }

    public void loadModel(String path) {
        File f = new File(path);
        if (f.exists()) {
            try {
                this.modelPath = f.getCanonicalPath();
            } catch (IOException ex) {
                GUIHelper.showErrorDlg(this, ex.toString(), JAMS.i18n("File_Open_Error"));
            }
            this.loadModel();
        } else {
            GUIHelper.showErrorDlg(this, JAMS.i18n("File_") + path + JAMS.i18n("_does_not_exist"), JAMS.i18n("File_Open_Error"));
        }
    }

    private void loadModel() {
        loadModelDlg.setTask(new Runnable() {
            public void run() {
                boolean isCurrentFrameMaximized = true;
                if (modelPanel.getSelectedFrame() != null) {
                    isCurrentFrameMaximized = modelPanel.getSelectedFrame().isMaximum();
                }
                String path = JUICEFrame.this.modelPath;
                ModelView mView = new ModelView(path, modelPanel);
                mView.loadModel(path);
                mView.getFrame().setVisible(true);
                mView.getFrame().requestFocus();

                if (isCurrentFrameMaximized) {
                    try {
                        mView.getFrame().setMaximum(true);
                    } catch (PropertyVetoException ex) {
                        Logger.getLogger(JUICE.class.getName()).log(Level.SEVERE, null, ex);
                    }
                }
                JAMSTools.addToRecentFiles(JUICE.getJamsProperties(), SystemProperties.RECENT_FILES, path);
                updateRecentMenu();
            }
        });
        loadModelDlg.execute();
        //JUICE.focusNotificationDlg();
    }

    private void saveModelAs(ModelView view) {
        if (view.getSavePath() != null) {
            jfcModels.setSelectedFile(view.getSavePath());
        } else {
            jfcModels.setSelectedFile(new File(""));
        }
        int result = jfcModels.showSaveDialog(JUICEFrame.this);

        if (result == JFileChooser.APPROVE_OPTION) {
            String path = jfcModels.getSelectedFile().getAbsolutePath();
            File savePath = new File(path);
            view.setSavePath(savePath);
            saveModel(view);
            JAMSTools.addToRecentFiles(JUICE.getJamsProperties(), SystemProperties.RECENT_FILES, path);
        }
    }

    public void saveModel(ModelView view) {
        if (view.getSavePath() != null) {
            if (!view.save()) {
                GUIHelper.showErrorDlg(this, JAMS.i18n("Error_saving_model_to_") + view.getSavePath() + "\"", JAMS.i18n("Error"));
                view.setSavePath(null);
            } else {
                view.setInitialState();
            }
        } else {
            saveModelAs(view);
        }
    }

    public void loadModel(ModelView view) {
        if ((view != null) && (view.getSavePath() != null)) {
            jfcModels.setSelectedFile(getCurrentView().getSavePath());
        } else {
            jfcModels.setSelectedFile(new File(""));
        }
        int result = jfcModels.showOpenDialog(JUICEFrame.this);

        if (result == JFileChooser.APPROVE_OPTION) {
            loadModel(jfcModels.getSelectedFile().getAbsolutePath());
        }
    }

    public ModelView getCurrentView() {
        if (modelPanel.getAllFrames().length == 0) {
            return null;
        }
        JInternalFrame frame = modelPanel.getSelectedFrame();
        ModelView view = ModelView.viewList.getMViews().get(frame);
        return view;
    }

    public TreePanel getLibTreePanel() {
        return libTreePanel;
    }

    public Action getJADEAction() {
        return jadeAction;
    }

    private class WindowItem extends JMenuItem {

        JInternalFrame frame;

        public WindowItem(String title, JInternalFrame frame) {
            super(title);
            this.frame = frame;
        }
    }

    public JLabel getStatusLabel() {
        return statusLabel;
    }

    public void setStatusLabel(JLabel statusLabel) {
        this.statusLabel = statusLabel;
    }

    public LogViewDlg getInfoDlg() {
        return infoDlg;
    }

    public LogViewDlg getErrorDlg() {
        return errorDlg;
    }

    private void exit() {

        ModelView[] views = ModelView.viewList.getViewList().toArray(new ModelView[ModelView.viewList.getViewList().size()]);

        for (ModelView view : views) {
            if (!view.exit()) {
                return;
            }
        }
        if (ModelView.viewList.getViewList().isEmpty()) {

            // finally write property file to default location
            try {
                JUICE.getJamsProperties().save();
            } catch (IOException ioe) {
                JAMSTools.handle(ioe);
            }

            this.setVisible(false);
            this.dispose();
            System.exit(0);
        }
    }

    private void updateRecentMenu() {
        recentMenu.removeAll();
        String[] recentFiles = JAMSTools.getRecentFiles(JUICE.getJamsProperties(), SystemProperties.RECENT_FILES);
        for (String fileName : recentFiles) {
            Action openAction = new AbstractAction(fileName) {
                @Override
                public void actionPerformed(ActionEvent e) {
                    loadModel(this.getValue(Action.NAME).toString());
                }
            };
            JMenuItem recentItem = new JMenuItem(openAction);
            recentMenu.add(recentItem);
        }
    }
}
