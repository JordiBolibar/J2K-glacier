/*
 * SpreadSheetPanel.java
 * Created on 5. Mai 2009, 13:26
 *
 * This file is part of JAMS
 * Copyright (C) FSU Jena
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
package jams.explorer.gui;

import javax.swing.JPanel;
import jams.explorer.spreadsheet.JAMSSpreadSheet;

/**
 *
 * @author Sven Kralisch <sven.kralisch at uni-jena.de>
 */
public class SpreadSheetPanel extends JPanel {

    private JAMSSpreadSheet spreadSheet;

    public SpreadSheetPanel() {

    }

    /**
     * @return the spreadSheet
     */
    public JAMSSpreadSheet getSpreadSheet() {
        return spreadSheet;
    }

    /**
     * @param spreadSheet the spreadSheet to set
     */
    public void setSpreadSheet(JAMSSpreadSheet spreadSheet) {
        this.spreadSheet = spreadSheet;
    }
}