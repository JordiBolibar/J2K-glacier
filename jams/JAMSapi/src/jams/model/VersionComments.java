/*
 * VersionComments.java
 * Created on 09.05.2013, 19:11:41
 *
 * This file is part of JAMS
 * Copyright (C) FSU Jena
 *
 * JAMS is free software; you can redistribute it and/or
 * modify it under the terms of the GNU Lesser General Public License
 * as published by the Free Software Foundation; either version 3
 * of the License, or (at your option) any later version.
 *
 * JAMS is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU Lesser General Public License for more details.
 *
 * You should have received a copy of the GNU Lesser General Public License
 * along with JAMS. If not, see <http://www.gnu.org/licenses/>.
 *
 */

package jams.model;

import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;

/**
 *
 * @author Sven Kralisch <sven.kralisch at uni-jena.de>
 */
@Retention(RetentionPolicy.RUNTIME)
public @interface VersionComments {
    Entry[] entries();
    
    public @interface Entry {
        String version();
        String date() default "";
        String author() default "";
        String comment();
    }
}