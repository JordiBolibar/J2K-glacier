/*
 * InputComponent.java
 * Created on 29. August 2006, 14:59
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

import javax.swing.JComponent;

/**
 *
 * @author S. Kralisch
 */
public interface InputComponent {
    
    public static final int INPUT_OK = 0, INPUT_WRONG_FORMAT = -1, INPUT_OUT_OF_RANGE  = -2;
    
    public String getValue();
    public void setValue(String value);
    public JComponent getComponent();
    public void setRange(double lower, double upper);
    public void setLength(int length);
    public boolean verify();
    public int getErrorCode();
    public void addValueChangeListener(ValueChangeListener l);
    public void setMarked(boolean marked);
    public void setEnabled(boolean enabled);
    public void setHelpText(String text);
}
