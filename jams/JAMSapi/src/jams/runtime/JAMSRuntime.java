/*
 * JAMSRuntime.java
 * Created on 2. Juni 2006, 14:15
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
package jams.runtime;

import jams.data.DataFactory;
import java.io.Serializable;
import java.util.*;
import javax.swing.JFrame;
import jams.data.JAMSData;
import jams.model.SmallModelState;
import jams.model.GUIComponent;
import jams.model.Model;
import org.w3c.dom.Document;

/**
 *
 * @author S. Kralisch
 */
public interface JAMSRuntime extends Serializable {

    /**
     * Run state causing runtime to stop model execution
     */
    public static final int STATE_STOP = 0;
    /**
     * Run state causing runtime to continue model execution
     */
    public static final int STATE_RUN = 1;
    public static final int STATE_PAUSE = 2;

    public int getDebugLevel();

    public void setDebugLevel(int aDebugLevel);

    public void println(String s, int debugLevel);

    public void println(String s);

    public void handle(Throwable t);

    public HashMap<String, JAMSData> getDataHandles();

    public void handle(Throwable t, String cName);

    public void handle(Throwable t, boolean proceed);

    public void sendHalt();

    public void sendHalt(String str);

    public int getState();

    public void resume(SmallModelState state) throws Exception;

    public void pause();

    public void addStateObserver(Observer o);

    public void addInfoLogObserver(Observer o);

    public void addErrorLogObserver(Observer o);

    public void deleteInfoLogObserver(Observer o);

    public void deleteInfoLogObservers();

    public void deleteErrorLogObserver(Observer o);

    public void deleteErrorLogObservers();

    public String getErrorLog();

    public String getInfoLog();

    public void sendErrorMsg(String str);

    public void sendInfoMsg(String str);

    public void addGUIComponent(GUIComponent component);

    public void initGUI(String title, boolean ontop, int width, int height);

    public JFrame getFrame();

    public void runModel() throws Exception;

    public void loadModel(Document modelDocument, String defaultWorkspacePath, String modelFilePath);

    public Model getModel();

    public DataFactory getDataFactory();

    public Document getModelDocument();

    public ClassLoader getClassLoader();

}
