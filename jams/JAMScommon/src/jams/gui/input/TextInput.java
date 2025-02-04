/*
 * TextInput.java
 * Created on 29. August 2006, 15:15
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
package jams.gui.input;

import java.awt.BorderLayout;
import java.awt.Color;
import javax.swing.JComponent;
import javax.swing.JPanel;
import javax.swing.JTextField;
import javax.swing.event.DocumentEvent;
import javax.swing.event.DocumentListener;

/**
 *
 * @author S. Kralisch
 */
public class TextInput extends JPanel implements InputComponent {

    private JTextField text = new JTextField();
    private ValueChangeListener l;

    public TextInput() {
        super();
        setLayout(new BorderLayout());
        add(text, BorderLayout.WEST);
    }

    public String getValue() {
        return text.getText();
    }

    public void setValue(String value) {
        text.setText(value);
    }

    public JComponent getComponent() {
        return text;
    }

    public void setRange(double lower, double upper) {
    }
    
    public boolean verify() {
        return true;
    }

    public int getErrorCode() {
        return INPUT_OK;
    }

    public void setLength(int length) {
        text.setColumns(length);
    }
    
    public void addValueChangeListener(ValueChangeListener l) {
        this.l = l;
        this.text.getDocument().addDocumentListener(new DocumentListener() {

            @Override
            public void insertUpdate(DocumentEvent e) {
                TextInput.this.l.valueChanged();
            }

            @Override
            public void removeUpdate(DocumentEvent e) {
                TextInput.this.l.valueChanged();
            }

            @Override
            public void changedUpdate(DocumentEvent e) {
                TextInput.this.l.valueChanged();
            }
        });
    }

    private Color oldColor;
    public void setMarked(boolean marked) {
        if (marked == true) {
            oldColor = text.getBackground();
            text.setBackground(new Color(255, 0, 0));
        } else {
            text.setBackground(oldColor);
        }
    }

    public void setHelpText(String text) {
        text = "<html>" + text + "</html>";
        getComponent().setToolTipText(text);
    }
}
