/*
 * InvalidWorkspaceException.java
 * Created on 24. September 2009, 20:39
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
package jams.workspace;

/**
 *
 * @author Sven Kralisch <sven.kralisch at uni-jena.de>
 */
public class InvalidWorkspaceException extends Exception {

    public InvalidWorkspaceException(String msg) {
        super(msg);
    }
}
