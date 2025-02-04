/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package jams.server.client.gui;

import jams.ErrorCatchingRunnable;
import jams.JAMSLogging;
import jams.SystemProperties;
import jams.gui.CancelableWorkerDlg;
import jams.gui.ObserverWorkerDlg;
import jams.gui.WorkerDlg;
import jams.gui.tools.GUIState;
import jams.server.client.Controller;
import jams.server.client.FileController;
import jams.server.client.JAMSWorkspaceUploader;
import jams.server.client.JobController;
import jams.server.client.UserController;
import jams.server.client.WorkspaceController;
import jams.server.client.error.DefaultFileUploadErrorHandling;
import jams.server.entities.Job;
import jams.server.entities.Workspace;
import jams.server.entities.WorkspaceFileAssociation;
import jams.tools.LogTools;
import jams.tools.LogTools.ObservableLogHandler;
import java.awt.Window;
import java.io.File;
import java.io.IOException;
import java.util.Observable;
import java.util.logging.Filter;
import java.util.logging.Level;
import java.util.logging.LogRecord;
import java.util.logging.Logger;
import javax.swing.DefaultComboBoxModel;
import javax.swing.JCheckBox;
import javax.swing.JComboBox;
import javax.swing.JLabel;
import javax.swing.JOptionPane;
import javax.swing.JPasswordField;
import javax.swing.JTextField;
import javax.ws.rs.ProcessingException;
import javax.ws.rs.client.ResponseProcessingException;

/**
 *
 * @author christian
 */
public class JAMSCloudGraphicalController extends Observable {

    private static final Logger log = Logger.getLogger(JAMSCloudGraphicalController.class.getName());

    //saved data
    private String[] recentUrls = {"http://localhost:8080/jamscloud/webresources"};
    private String user = "jams", pw = "jamscloud", serverUrl = "";
    private boolean saveAccount = true;
    private SystemProperties p;
    private Controller client;
    private Window parent;

    private ObserverWorkerDlg worker;

    private ObservableLogHandler observable = new ObservableLogHandler(new Logger[]{
        Logger.getLogger(Controller.class.getName()),
        Logger.getLogger(FileController.class.getName()),
        Logger.getLogger(WorkspaceController.class.getName()),
        Logger.getLogger(JobController.class.getName()),
        Logger.getLogger(UserController.class.getName())});

    private static JAMSCloudGraphicalController instance = null;

    public enum JAMSCloudEvents {

        CONNECT, CONNECTING, DISCONNECT
    };

    private JAMSCloudGraphicalController(Window parent, SystemProperties p) {
        this.p = p;
        this.parent = parent;
        JAMSLogging.registerLogger(JAMSLogging.LogOption.Show,
                Logger.getLogger(JAMSCloudGraphicalController.class.getName()));

        worker = new ObserverWorkerDlg(new CancelableWorkerDlg(
                new WorkerDlg(parent, "Uploading Workspace")).getWorkerDlg());

        //init logs
        observable.deleteObservers();
        observable.getHandler().setFilter(new Filter() {

            @Override
            public boolean isLoggable(LogRecord record) {
                return record.getLevel() == Level.FINE
                        || record.getLevel() == Level.INFO;
            }
        });
        observable.addObserver(worker);

        if (p != null) {
            user = p.getProperty("jams_server_user");
            pw = p.getProperty("jams_server_pw");
            String s = p.getProperty("jams_server_save_account");
            if (s != null) {
                try {
                    saveAccount = Boolean.parseBoolean(s);
                } catch (Exception e) {
                    e.printStackTrace();
                }
            }
            s = p.getProperty("jams_server_recent_urls");
            if (s != null) {
                recentUrls = s.split(";");
            }
        }
    }

    /**
     *
     * @param parent
     * @param p
     * @return
     */
    public static JAMSCloudGraphicalController createInstance(Window parent, SystemProperties p) {
        if (instance == null) {
            instance = new JAMSCloudGraphicalController(parent, p);
        }
        return instance;
    }

    /**
     *
     * @return
     */
    public String getServerUrl() {
        return serverUrl;
    }

    /**
     *
     * @return
     */
    public String[] getRecentUrls() {
        return recentUrls;
    }

    /**
     *
     * @return
     */
    public String getUser() {
        return user;
    }

    /**
     *
     * @return
     */
    public boolean isConnected() {
        return client != null && client.isConnected();
    }

    /**
     *
     * @return
     */
    public Controller getClient() {
        return client;
    }

    /**
     *
     */
    public void disconnect() {
        client.close();
        client = null;
        setChanged();
        notifyObservers(JAMSCloudEvents.DISCONNECT);
    }

    /**
     *
     * @return @throws IOException
     */
    public Controller connect() throws IOException {
        if (!isConnected()) {
            return reconnect();
        }
        return client;
    }

    private boolean showReconnectDialog() {
        JLabel jServerName = new JLabel("Server");
        JComboBox serverUrls = new JComboBox(recentUrls);
        serverUrls.setEditable(true);
        JLabel jUserName = new JLabel("User Name");
        JTextField userName = new JTextField();
        JLabel jPassword = new JLabel("Password");
        JTextField password = new JPasswordField();
        JLabel jCredentials = new JLabel("Save Credentials");
        JCheckBox cred = new JCheckBox();
        cred.setSelected(saveAccount);
        if (saveAccount) {
            userName.setText(user);
            password.setText(pw);
        }
        Object[] ob = {jServerName, serverUrls, jUserName, userName, jPassword, password, jCredentials, cred};
        int result = JOptionPane.showConfirmDialog(parent, ob, "Please input server URL / username / password", JOptionPane.OK_CANCEL_OPTION);

        if (result != JOptionPane.OK_OPTION) {
            return false;
        }
        user = userName.getText();
        pw = password.getText();
        serverUrl = serverUrls.getSelectedItem().toString();
        saveAccount = cred.isSelected();

        if (p != null) {
            if (saveAccount) {
                p.setProperty("jams_server_user", user);
                p.setProperty("jams_server_pw", pw);
            }
            p.setProperty("jams_server_save_account", Boolean.toString(saveAccount));

            String recentUrls = "";
            String curS = serverUrls.getSelectedItem().toString();
            for (int i = 0; i < serverUrls.getModel().getSize(); i++) {
                if (i >= 9) {
                    break;
                }
                String s = serverUrls.getModel().getElementAt(i).toString();
                if (s.compareTo(curS) != 0) {
                    recentUrls += s + ";";
                }
            }
            recentUrls = curS + ";" + recentUrls;
            p.setProperty("jams_server_recent_urls", recentUrls);
            ((DefaultComboBoxModel) serverUrls.getModel()).insertElementAt(curS, 0);
            try {
                p.save();
            } catch (IOException ioe) {
                log.log(Level.SEVERE, ioe.toString(), ioe);
            }
        }
        return true;
    }

    /**
     *
     * @return @throws IOException
     */
    public Controller reconnect() throws IOException {
        try {
            if (isConnected()) {
                disconnect();
            }
        } catch (Throwable t) {
            LogTools.log(getClass(), Level.WARNING, t, t.toString());
        }
        this.setChanged();
        this.notifyObservers(JAMSCloudEvents.CONNECTING);
        if (showReconnectDialog()) {
            try {
                client = new Controller(serverUrl, user, pw);
            } catch (ResponseProcessingException pe) {
                if (pe.getResponse().getStatus() == 403) {
                    LogTools.log(getClass(), Level.SEVERE, pe, "You provided a wrong username and/or password or you are not allowed to access this server");
                    if (pe.getResponse().getStatus() == 404) {
                        LogTools.log(getClass(), Level.SEVERE, pe, "The url %1 was not found!".replace("%1", serverUrl));
                    }
                } else {
                    LogTools.log(getClass(), Level.SEVERE, pe, pe.getResponse().getStatusInfo().getReasonPhrase());
                }
            } catch (ProcessingException pe) {
                //TODO: need function processingException to Log
                if (pe.toString().contains("Connection refused")) {
                    LogTools.log(getClass(), Level.SEVERE, pe, "Connection was refused.");
                } else {
                    LogTools.log(getClass(), Level.SEVERE, pe, pe.getMessage().isEmpty() ? pe.toString() : pe.getMessage());
                }
                this.setChanged();
                this.notifyObservers(JAMSCloudEvents.DISCONNECT);
            }
            this.setChanged();
            this.notifyObservers(JAMSCloudEvents.CONNECT);
            return client;
        } else {
            this.setChanged();
            this.notifyObservers(JAMSCloudEvents.DISCONNECT);
            return null;
            //throw new IOException("User canceled connection!");
        }
    }

    private class DownloadRunnable extends ErrorCatchingRunnable {

        Workspace ws;
        WorkspaceFileAssociation wfa;
        File target;

        public DownloadRunnable(Workspace ws, File target) {
            this.ws = ws;
            this.target = target;
            this.wfa = null;
        }

        public DownloadRunnable(WorkspaceFileAssociation wfa, File target) {
            this.wfa = wfa;
            this.ws = null;
            this.target = target;
        }

        @Override
        public void safeRun() throws Exception {
            if (ws != null) {
                client.workspaces().downloadWorkspace(target, ws);
            } else if (wfa != null) {
                client.workspaces().downloadFile(target, wfa);
            }
        }
    }

    /**
     *
     * @param ws
     * @param target
     */
    public void downloadWorkspace(Workspace ws, File target) {
        WorkerDlg dlg = new WorkerDlg(GUIState.getMainWindow(), "Download Workspace ... ");
        dlg.setInderminate(true);
        dlg.setTask(new DownloadRunnable(ws, target));
        dlg.execute();
    }

    /**
     *
     * @param wfa
     * @param target
     */
    public void downloadFile(WorkspaceFileAssociation wfa, File target) {
        WorkerDlg dlg = new WorkerDlg(GUIState.getMainWindow(), "Download file ... ");
        dlg.setInderminate(true);
        dlg.setTask(new DownloadRunnable(wfa, target));
        dlg.execute();
    }

    private class UploadWorkspaceRunnable extends ErrorCatchingRunnable {

        private final jams.workspace.Workspace jamsWorkspace;
        private final String fileFilter;
        private final File[] compLibFile;
        private final File rtLibFile;
        private Workspace ws;

        public UploadWorkspaceRunnable(jams.workspace.Workspace jamsWorkspace, File[] compLibFile, File rtLibFile, String fileFilter) {
            this.jamsWorkspace = jamsWorkspace;
            this.compLibFile = compLibFile;
            this.rtLibFile = rtLibFile;
            this.fileFilter = fileFilter;
        }

        @Override
        public void safeRun() throws Exception {
            JAMSWorkspaceUploader uploader = new JAMSWorkspaceUploader(client);
            ws = uploader.uploadWorkspace(jamsWorkspace, compLibFile, rtLibFile, fileFilter, new DefaultFileUploadErrorHandling());
        }

        public Workspace getWorkspace() {
            return ws;
        }
    }

    /**
     *
     * @param jamsWorkspace
     * @param compLibFile
     * @param rtLibFile
     * @param fileFilter
     * @return
     * @throws IOException
     */
    public Workspace uploadWorkspace(
            jams.workspace.Workspace jamsWorkspace,
            File[] compLibFile, File rtLibFile,
            String fileFilter) throws IOException {

        if (!isConnected()) {
            throw new IOException("Not connected to server!");
        }

        if (!rtLibFile.exists() || !rtLibFile.isDirectory()) {
            throw new IOException("Unable to upload workspace! Runtime libraries path is incorrect!");
        }

        observable.deleteObserver(worker);
        observable.addObserver(worker);
        worker.getWorkerDlg().setInderminate(true);
        worker.getWorkerDlg().setModal(true);
        UploadWorkspaceRunnable uploadWsTask = new UploadWorkspaceRunnable(jamsWorkspace, compLibFile, rtLibFile, fileFilter);
        worker.getWorkerDlg().setTask(uploadWsTask);
        worker.getWorkerDlg().execute();

        return uploadWsTask.getWorkspace();
    }

    private class StartJobRunnable implements Runnable {

        private Workspace ws = null;
        private WorkspaceFileAssociation wfa = null;
        private Job job = null;

        public StartJobRunnable(Workspace ws, WorkspaceFileAssociation wfa) {
            this.ws = ws;
            this.wfa = wfa;
        }

        @Override
        public void run() {
            try {
                job = client.jobs().create(ws, wfa);
            } catch (Throwable t) {
                log.log(Level.SEVERE, t.toString(), t);
            }
            if (job != null && job.getId() != -1) {
                log.log(Level.INFO, "Job was started successfully! It has ID = %1.".replace("%1", job.getId().toString()));
            } else {
                log.log(Level.INFO, "Failed to start job!");
            }
        }

        public Job getResult() {
            return job;
        }
    }

    /**
     *
     * @param ws
     * @param modelFile
     * @return
     */
    public Job startJob(Workspace ws, File modelFile) {
        if (ws == null) {
            return null;
        }

        WorkspaceFileAssociation model = null;
        for (WorkspaceFileAssociation wfa : ws.getFiles()) {
            if (wfa.getPath().endsWith(modelFile.getName())) {
                model = wfa;
            }
        }

        return startJob(ws, model);
    }

    /**
     *
     * @param ws
     * @param model
     * @return
     */
    public Job startJob(Workspace ws, WorkspaceFileAssociation model) {
        if (ws == null) {
            return null;
        }

        if (model == null) {
            return null;
        }

        observable.deleteObserver(worker);
        observable.addObserver(worker);
        worker.getWorkerDlg().setInderminate(true);
        worker.getWorkerDlg().setModal(true);
        StartJobRunnable task = new StartJobRunnable(ws, model);
        worker.getWorkerDlg().setTask(task);
        worker.getWorkerDlg().execute();
        return task.getResult();
        
//        SYNC?
    }
}
