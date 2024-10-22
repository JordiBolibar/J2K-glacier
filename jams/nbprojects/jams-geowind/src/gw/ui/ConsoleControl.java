/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

/*
 * ConsoleControl.java
 *
 * Created on Dec 9, 2008, 4:41:53 PM
 */
package gw.ui;

import gw.ui.util.console.CommandHandler;
import gw.ui.util.console.JConsolePanel;
import java.awt.BorderLayout;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.awt.event.MouseAdapter;
import java.awt.event.MouseEvent;
import javax.swing.JScrollPane;
import net.java.balloontip.BalloonTip;

/**
 *
 * @author od
 */
public class ConsoleControl extends javax.swing.JPanel {

    JConsolePanel cp = new JConsolePanel();

    /** Creates new form ConsoleControl */
    public ConsoleControl() {
        initComponents();
        setupComponents();
    }

    public void setCommandHandler(CommandHandler h) {
        cp.setCommandHandler(h);
    }

    private void setupComponents() {
        clearButton.addActionListener(new ActionListener() {

            @Override
            public void actionPerformed(ActionEvent e) {
                cp.clear();
            }
        });

        helpLabel.addMouseListener(new MouseAdapter() {

            @Override
            public void mouseClicked(MouseEvent e) {
                BalloonTip help = new BalloonTip(helpLabel, "<html> <H3>Using the Console</H3><br>" +
                        "<b> 1. Column operations, printing results.</b>" +
                        "<ul> " +
                        "<li> <code>mean(C2)</code> (print the mean of all cells in column C2)" +
                        "<li> <code>range(C2)</code> (print the range of all cells in column C2)" +
                        "<li> <code>max(C3) + PI</code> (print out the maximum value of column C3)" +
                        "<li> <code>rmse(C2,C3)</code> (print root mean sqare error)" +
                        "<li> <code>nashsut(C2,C3,1)</code> (print Nash-sutcliff value)" +
                        "<li> Note: type <code>?</code> and see all the availables functions." +
                        "</ul>" +
                        "<b> 2. Expression on rows, printing results</b>" +
                        "<ul> " +
                        "<li> <code>$C2</code> (Printing all C2 cell values)" +
                        "<li> <code>$C6 - $C5 / $C4</code> (Printing the result of the operation)" +
                        "</ul>" +
                        "<b> 3. Row manupulation</b>" +
                        "<ul> " +
                        "<li> <code>$C2 = 1.23</code> (Assigning 1.23 to all cells in col C2)" +
                        "<li> <code>$C2 = $C2*1.1</code>  (Increasing all cells in column C2 by 10%)" +
                        "<li> <code>$C2 = $C3</code>  (Copy all values from C3 to C2)" +
                        "<li> <code>$C2 = ramp(1.0, 0.5)</code> (Creates a ramped data set starting from 1.0 in steps of 0.5)" +
                        "<li> <code>$C2 = random()</code> (Creates uniform distributed random values (0 ... 1.0)" +
                        "<li> <code>$C2 = 2 + random()*3</code> (Creates uniform distributed random values (2 ... 5)" +
                        "<li> <code>$C3 = random(2,3) * $C4</code> (Creates uniform distributed random values (2 ... 5), multiplied by C4)" +
                        "<li> <code>$C4 = sin($C1) + PI * random(-1, 1)</code>  (Sinus of value in C1 added to PI multiplied with random number)" +
                        "<li> <code>$C4 = round($C4, 1)</code>  (Round C4 to the first digit)" +
                        "<li> <code>$C4 = abs($C4)</code>  (Making all exising values positive)" +
                        "<li> <code>$C5 = ($C7 > 75) ? 2.5 : 1.0</code>  (Assign to each element in C5 the value 2.5 if the corresponding)" +
                        "<li> <code>$C5 = max(1.0, $C7)</code> (C5 will be 1.0 or the value in C7, whatever is bigger)" +
                        "</ul>" +
                        "<b> 4. Row selection, result of a boolean expression.</b>" +
                        "<ul> " +
                        "<li> <code>$C7 > 77  || $C8 <82</code> (Select all rows where the cell in C7 is greater than 77 or C8 less than 82)" +
                        "<li> <code>$C5 - $C4) > 10</code> (Select all the rows where the value difference between C5 and C4)" +
                        "</ul>");
            }
        });

        JScrollPane sp = new JScrollPane();
        cp.setRows(3);
        sp.setHorizontalScrollBarPolicy(JScrollPane.HORIZONTAL_SCROLLBAR_NEVER);
        sp.setVerticalScrollBarPolicy(JScrollPane.VERTICAL_SCROLLBAR_ALWAYS);
        centerPanel.add(sp, BorderLayout.CENTER);
        sp.setViewportView(cp);
    }

    /** This method is called from within the constructor to
     * initialize the form.
     * WARNING: Do NOT modify this code. The content of this method is
     * always regenerated by the Form Editor.
     */
    @SuppressWarnings("unchecked")
    // <editor-fold defaultstate="collapsed" desc="Generated Code">//GEN-BEGIN:initComponents
    private void initComponents() {

        jSeparator1 = new javax.swing.JSeparator();
        jLabel2 = new javax.swing.JLabel();
        jPanel1 = new javax.swing.JPanel();
        toolbar = new javax.swing.JToolBar();
        clearButton = new javax.swing.JButton();
        helpLabel = new javax.swing.JLabel();
        centerPanel = new javax.swing.JPanel();

        jLabel2.setText("jLabel1");

        setBorder(javax.swing.BorderFactory.createTitledBorder(null, "Console", javax.swing.border.TitledBorder.DEFAULT_JUSTIFICATION, javax.swing.border.TitledBorder.BOTTOM));
        setLayout(new java.awt.BorderLayout());

        jPanel1.setLayout(new java.awt.BorderLayout());

        toolbar.setFloatable(false);
        toolbar.setOrientation(1);
        toolbar.setRollover(true);

        clearButton.setIcon(new javax.swing.ImageIcon(getClass().getResource("/gw/resources/icon-delete.gif"))); // NOI18N
        clearButton.setFocusable(false);
        clearButton.setHorizontalTextPosition(javax.swing.SwingConstants.CENTER);
        clearButton.setVerticalTextPosition(javax.swing.SwingConstants.BOTTOM);
        toolbar.add(clearButton);

        jPanel1.add(toolbar, java.awt.BorderLayout.LINE_START);

        helpLabel.setHorizontalAlignment(javax.swing.SwingConstants.CENTER);
        helpLabel.setIcon(new javax.swing.ImageIcon(getClass().getResource("/gw/resources/help.png"))); // NOI18N
        jPanel1.add(helpLabel, java.awt.BorderLayout.SOUTH);

        add(jPanel1, java.awt.BorderLayout.WEST);

        centerPanel.setLayout(new java.awt.BorderLayout());
        add(centerPanel, java.awt.BorderLayout.CENTER);
    }// </editor-fold>//GEN-END:initComponents
    // Variables declaration - do not modify//GEN-BEGIN:variables
    private javax.swing.JPanel centerPanel;
    private javax.swing.JButton clearButton;
    private javax.swing.JLabel helpLabel;
    private javax.swing.JLabel jLabel2;
    private javax.swing.JPanel jPanel1;
    private javax.swing.JSeparator jSeparator1;
    private javax.swing.JToolBar toolbar;
    // End of variables declaration//GEN-END:variables
}
