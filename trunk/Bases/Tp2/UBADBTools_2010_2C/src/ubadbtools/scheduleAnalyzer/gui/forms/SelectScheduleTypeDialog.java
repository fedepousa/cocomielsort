/*
 * SelectScheduleTypeDialog.java
 *
 * Created on 6 de abril de 2009, 15:44
 */

package ubadbtools.scheduleAnalyzer.gui.forms;

import java.awt.Frame;

import ubadbtools.scheduleAnalyzer.common.ScheduleType;

@SuppressWarnings("serial")
public class SelectScheduleTypeDialog extends javax.swing.JDialog {
    
    private ScheduleType scheduleType;
    
    /** Creates new form SelectScheduleTypeDialog */
    public SelectScheduleTypeDialog(java.awt.Frame parent, boolean modal) {
        super(parent, modal);
        initComponents();
        
        scheduleType = null;
    }
    
    /** This method is called from within the constructor to
     * initialize the form.
     * WARNING: Do NOT modify this code. The content of this method is
     * always regenerated by the Form Editor.
     */
    private void initComponents() {//GEN-BEGIN:initComponents

        buttonGroup1 = new javax.swing.ButtonGroup();
        jLabel1 = new javax.swing.JLabel();
        jPanel1 = new javax.swing.JPanel();
        rbNonLocking = new javax.swing.JRadioButton();
        rbBinaryLocking = new javax.swing.JRadioButton();
        rbTernaryLocking = new javax.swing.JRadioButton();
        jButton1 = new javax.swing.JButton();

        setDefaultCloseOperation(javax.swing.WindowConstants.DISPOSE_ON_CLOSE);
        setName("Form"); // NOI18N

        jLabel1.setText("Seleccione el tipo de historia"); // NOI18N
        jLabel1.setName("jLabel1"); // NOI18N

        jPanel1.setName("jPanel1"); // NOI18N

        buttonGroup1.add(rbNonLocking);
        rbNonLocking.setSelected(true);
        rbNonLocking.setText("Sin Locking (R / W)"); // NOI18N
        rbNonLocking.setName("rbNonLocking"); // NOI18N

        buttonGroup1.add(rbBinaryLocking);
        rbBinaryLocking.setText("Locking Binario (LOCK / UNLOCK)"); // NOI18N
        rbBinaryLocking.setName("rbBinaryLocking"); // NOI18N

        buttonGroup1.add(rbTernaryLocking);
        rbTernaryLocking.setText("Locking Ternario (RLOCK / WLOCK / UNLOCK)"); // NOI18N
        rbTernaryLocking.setName("rbTernaryLocking"); // NOI18N

        javax.swing.GroupLayout jPanel1Layout = new javax.swing.GroupLayout(jPanel1);
        jPanel1.setLayout(jPanel1Layout);
        jPanel1Layout.setHorizontalGroup(
            jPanel1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(jPanel1Layout.createSequentialGroup()
                .addContainerGap()
                .addGroup(jPanel1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                    .addComponent(rbTernaryLocking)
                    .addComponent(rbBinaryLocking)
                    .addComponent(rbNonLocking))
                .addContainerGap(javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE))
        );
        jPanel1Layout.setVerticalGroup(
            jPanel1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(jPanel1Layout.createSequentialGroup()
                .addGap(16, 16, 16)
                .addComponent(rbNonLocking)
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                .addComponent(rbBinaryLocking)
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                .addComponent(rbTernaryLocking)
                .addContainerGap(javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE))
        );

        jButton1.setText("Aceptar"); // NOI18N
        jButton1.setName("jButton1"); // NOI18N
        jButton1.addMouseListener(new java.awt.event.MouseAdapter() {
            public void mouseClicked(java.awt.event.MouseEvent evt) {
                jButton1MouseClicked(evt);
            }
        });

        javax.swing.GroupLayout layout = new javax.swing.GroupLayout(getContentPane());
        getContentPane().setLayout(layout);
        layout.setHorizontalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(layout.createSequentialGroup()
                .addGap(21, 21, 21)
                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                    .addGroup(layout.createSequentialGroup()
                        .addGap(10, 10, 10)
                        .addComponent(jLabel1))
                    .addGroup(layout.createSequentialGroup()
                        .addGap(92, 92, 92)
                        .addComponent(jButton1))
                    .addComponent(jPanel1, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE))
                .addContainerGap(javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE))
        );
        layout.setVerticalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(layout.createSequentialGroup()
                .addContainerGap()
                .addComponent(jLabel1)
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                .addComponent(jPanel1, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addGap(5, 5, 5)
                .addComponent(jButton1)
                .addContainerGap(javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE))
        );

        pack();
    }//GEN-END:initComponents

    private void jButton1MouseClicked(java.awt.event.MouseEvent evt) {//GEN-FIRST:event_jButton1MouseClicked
        if(rbNonLocking.isSelected())
        {
            this.scheduleType = ScheduleType.NON_LOCKING;
        }
        else if(rbBinaryLocking.isSelected())
        {
            this.scheduleType = ScheduleType.BINARY_LOCKING;
        }
        else if(rbTernaryLocking.isSelected())
        {
            this.scheduleType = ScheduleType.TERNARY_LOCKING;
        }

        this.setVisible(false);
    }//GEN-LAST:event_jButton1MouseClicked
    
    public static ScheduleType showDialog(Frame parent)
    {
        SelectScheduleTypeDialog dialog = new SelectScheduleTypeDialog(parent, true);
        dialog.setVisible(true);
        
        return dialog.scheduleType;
    }

    
    // Variables declaration - do not modify//GEN-BEGIN:variables
    private javax.swing.ButtonGroup buttonGroup1;
    private javax.swing.JButton jButton1;
    private javax.swing.JLabel jLabel1;
    private javax.swing.JPanel jPanel1;
    private javax.swing.JRadioButton rbBinaryLocking;
    private javax.swing.JRadioButton rbNonLocking;
    private javax.swing.JRadioButton rbTernaryLocking;
    // End of variables declaration//GEN-END:variables
    
}
