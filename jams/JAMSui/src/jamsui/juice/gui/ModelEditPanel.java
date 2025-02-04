/*
 * ModelEditPanel.java
 * Created on 12. Dezember 2006, 22:43
 *
 * This file is part of JAMS
 * Copyright (C) 2006 FSU Jena
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
package jamsui.juice.gui;

import java.awt.Dimension;
import java.awt.GridBagLayout;
import javax.swing.JLabel;
import javax.swing.JPanel;
import javax.swing.JScrollPane;
import javax.swing.JTextPane;
import javax.swing.event.DocumentEvent;
import javax.swing.event.DocumentListener;
import jams.gui.tools.GUIHelper;
import jams.gui.input.InputComponent;
import jams.gui.input.ValueChangeListener;
import java.awt.GridBagConstraints;
import javax.swing.BorderFactory;
import jams.gui.input.InputComponentFactory;
import javax.swing.JButton;
import jams.JAMS;
import jams.data.Attribute;
import jamsui.juice.JUICE;
import java.awt.Image;
import javax.swing.ImageIcon;
import javax.swing.text.BadLocationException;

/**
 *
 * @author S. Kralisch
 *
 * Panel that provides swing components for defining model author,
 * date, description and help-baseURL
 *
 */
public class ModelEditPanel extends JPanel {

    private static final int TEXTAREA_WIDTH = 450, TEXTAREA_HEIGHT = 100, TEXTFIELD_WIDTH = 35;

    private JPanel componentPanel;

    private GridBagLayout mainLayout;

    private ModelView view;

    private InputComponent workspace, author, date, helpBaseURL;

    private JTextPane description;

//    private JButton explorerButton;

    public ModelEditPanel(ModelView view) {
        super();
        this.view = view;
        init();
    }

    private void init() {

        componentPanel = new JPanel();
        //setBorder(BorderFactory.createTitledBorder("Model Properties"));

        mainLayout = new GridBagLayout();
        componentPanel.setLayout(mainLayout);

        GUIHelper.addGBComponent(componentPanel, mainLayout, new JLabel(JAMS.i18n("Workspace:")), 1, 0, 1, 1, 0, 0);
        GUIHelper.addGBComponent(componentPanel, mainLayout, new JLabel(JAMS.i18n("Author:")), 1, 1, 1, 1, 0, 0);
        GUIHelper.addGBComponent(componentPanel, mainLayout, new JLabel(JAMS.i18n("Help_Base_URL:")), 1, 5, 1, 1, 0, 0);
        GUIHelper.addGBComponent(componentPanel, mainLayout, new JLabel(JAMS.i18n("Date:")), 1, 3, 1, 1, 0, 0);
        GUIHelper.addGBComponent(componentPanel, mainLayout, new JLabel(JAMS.i18n("Description:")), 1, 4, 1, 1, 0, 0);

        workspace = InputComponentFactory.createInputComponent(Attribute.DirName.class);
        workspace.setLength(TEXTFIELD_WIDTH);

        author = InputComponentFactory.createInputComponent(Attribute.String.class);
        author.setLength(TEXTFIELD_WIDTH);

        date = InputComponentFactory.createInputComponent(Attribute.Calendar.class);
        date.setLength(TEXTFIELD_WIDTH);

        helpBaseURL = InputComponentFactory.createInputComponent(Attribute.String.class);
        helpBaseURL.setLength(TEXTFIELD_WIDTH);

        description = new JTextPane();
        description.setContentType("text/plain;charset=UTF-8");
        description.setEditable(true);
        JScrollPane scroll = new JScrollPane(description);
        scroll.setBorder(BorderFactory.createEtchedBorder());
        scroll.setPreferredSize(new Dimension(TEXTAREA_WIDTH, TEXTAREA_HEIGHT));

//        explorerButton = new JButton(JUICE.getJuiceFrame().getJADEAction());
//        explorerButton.setIcon(new ImageIcon(new ImageIcon(getClass().getResource("/resources/images/Layers.png")).getImage().getScaledInstance(64, 64, Image.SCALE_SMOOTH)));
//        explorerButton.setText("");
//        explorerButton.setToolTipText(JAMS.i18n("DATA_EXPLORER"));

        GUIHelper.addGBComponent(componentPanel, mainLayout, workspace.getComponent(), 2, 0, 1, 1, 1.0, 1.0,
                GridBagConstraints.NONE, GridBagConstraints.WEST);
//        GUIHelper.addGBComponent(componentPanel, mainLayout, explorerButton, 3, 0, 1, 4, 1.0, 1.0,
//                GridBagConstraints.NONE, GridBagConstraints.WEST);
        GUIHelper.addGBComponent(componentPanel, mainLayout, author.getComponent(), 2, 1, 1, 1, 1.0, 1.0,
                GridBagConstraints.NONE, GridBagConstraints.WEST);
        GUIHelper.addGBComponent(componentPanel, mainLayout, helpBaseURL.getComponent(), 2, 5, 1, 1, 1.0, 1.0,
                GridBagConstraints.NONE, GridBagConstraints.WEST);
        GUIHelper.addGBComponent(componentPanel, mainLayout, date.getComponent(), 2, 3, 1, 1, 1.0, 1.0,
                GridBagConstraints.NONE, GridBagConstraints.WEST);
        GUIHelper.addGBComponent(componentPanel, mainLayout, scroll, 2, 4, 2, 1, 1.0, 1.0);

        workspace.addValueChangeListener(new ValueChangeListener() {

            @Override
            public void valueChanged() {
                view.getModelDescriptor().setWorkspacePath(workspace.getValue());
            }
        });

        author.addValueChangeListener(new ValueChangeListener() {

            @Override
            public void valueChanged() {
                updateAuthor();
            }
        });

        date.addValueChangeListener(new ValueChangeListener() {

            @Override
            public void valueChanged() {
                updateDate();
            }
        });

        helpBaseURL.addValueChangeListener(new ValueChangeListener() {

            @Override
            public void valueChanged() {
                updateHelpBaseUrl();
            }
        });

        description.getDocument().addDocumentListener(new DocumentListener() {

            public void changedUpdate(DocumentEvent e) {
                updateDescription();
            }

            public void insertUpdate(DocumentEvent e) {
                updateDescription();
            }

            public void removeUpdate(DocumentEvent e) {
                updateDescription();
            }
        });

        /*
        textFields.get("author").addFocusListener(new java.awt.event.FocusAdapter() {
        public void focusLost(java.awt.event.FocusEvent evt) {
        updateAuthor();
        }
        });
        textFields.get("date").addFocusListener(new java.awt.event.FocusAdapter() {
        public void focusLost(java.awt.event.FocusEvent evt) {
        updateDate();
        }
        });
        textAreas.get("description").addFocusListener(new java.awt.event.FocusAdapter() {
        public void focusLost(java.awt.event.FocusEvent evt) {
        updateDescription();
        }
        });
         */
        add(componentPanel);
    }

    public void updatePanel() {
        author.setValue(view.getModelDescriptor().getAuthor());
        date.setValue(view.getModelDescriptor().getDate());
        helpBaseURL.setValue(view.getModelDescriptor().getHelpBaseUrl());
        description.setText(view.getModelDescriptor().getDescription());
        workspace.setValue(view.getModelDescriptor().getWorkspacePath());
    }

//    private void openExplorer() {
//        try {
//            File workspaceFile = new File(view.getWorkspace());
//            if (!workspaceFile.exists()) {
//                GUIHelper.showErrorDlg(this, "\"" + workspaceFile + "\"" + JAMS.i18n("Invalid_Workspace"), JAMS.i18n("Error"));
//                return;
//            }
//            JAMSExplorer explorer = new JAMSExplorer(null, false, false);
//            explorer.getExplorerFrame().setVisible(true);
//            explorer.getExplorerFrame().open(workspaceFile);
//        } catch (NoClassDefFoundError ncdfe) {
//            GUIHelper.showInfoDlg(this, jams.JAMS.i18n("ExplorerDisabled"), jams.JAMS.i18n("Info"));
//            explorerAction.setEnabled(false);
//        }
//    }

    private void updateAuthor() {
        view.getModelDescriptor().setAuthor(author.getValue());
    }

    private void updateDate() {
        view.getModelDescriptor().setDate(date.getValue());
    }

    private void updateDescription() {
        try {
            view.getModelDescriptor().setDescription(description.getDocument().getText(0, description.getDocument().getLength()));
        } catch (BadLocationException ex) {}
    }

    private void updateHelpBaseUrl() {
        view.getModelDescriptor().setHelpBaseUrl(helpBaseURL.getValue());
    }
}
