/*
 * SelectScheduleTypeDialog.java
 *
 * Created on 6 de abril de 2009, 15:44
 */

package ubadbtools.scheduleAnalyzer.gui.forms;

import java.awt.Frame;
import java.util.List;

import ubadbtools.scheduleAnalyzer.nonLocking.NonLockingAction;
import ubadbtools.scheduleAnalyzer.nonLocking.NonLockingActionType;

@SuppressWarnings("serial")
public class EditNonLockingActionDialog extends javax.swing.JDialog {
    
	private NonLockingAction selectedAction = null;
    
    /** Creates new form SelectScheduleTypeDialog 
     * @param items */
    public EditNonLockingActionDialog(java.awt.Frame parent, boolean modal, List<String> transactions, List<String> items)
    {
        super(parent, modal);
        initComponents();

        // Cargo las transacciones en el combo de transacciones
        for(int i = 0; i < transactions.size(); ++i)
        {
        	cbTransaction.addItem(transactions.get(i));
        }
        
        // Cargo los items en el combo de items
        for(int i = 0; i < items.size(); ++i)
        {
        	cbItem.addItem(items.get(i));
        }
    }
    
    /** This method is called from within the constructor to
     * initialize the form.
     * WARNING: Do NOT modify this code. The content of this method is
     * always regenerated by the Form Editor.
     */
    private void initComponents() {//GEN-BEGIN:initComponents

        rbgActionType = new javax.swing.ButtonGroup();
        jLabel1 = new javax.swing.JLabel();
        jPanel1 = new javax.swing.JPanel();
        rbRead = new javax.swing.JRadioButton();
        rbWrite = new javax.swing.JRadioButton();
        rbCommit = new javax.swing.JRadioButton();
        butAceptar = new javax.swing.JButton();
        cbTransaction = new javax.swing.JComboBox();
        jLabel2 = new javax.swing.JLabel();
        butCancelar = new javax.swing.JButton();
        jLabel3 = new javax.swing.JLabel();
        cbItem = new javax.swing.JComboBox();

        setDefaultCloseOperation(javax.swing.WindowConstants.DISPOSE_ON_CLOSE);
        setName("Form"); // NOI18N

        jLabel1.setText("Transaccion"); // NOI18N
        jLabel1.setName("jLabel1"); // NOI18N

        jPanel1.setName("jPanel1"); // NOI18N

        rbgActionType.add(rbRead);
        rbRead.setSelected(true);
        rbRead.setText("Read"); // NOI18N
        rbRead.setName("rbRead"); // NOI18N

        rbgActionType.add(rbWrite);
        rbWrite.setText("Write"); // NOI18N
        rbWrite.setName("rbWrite"); // NOI18N

        rbgActionType.add(rbCommit);
        rbCommit.setText("Commit"); // NOI18N
        rbCommit.setName("rbCommit"); // NOI18N
        rbCommit.addItemListener(new java.awt.event.ItemListener() {
            public void itemStateChanged(java.awt.event.ItemEvent evt) {
                rbCommitItemStateChanged(evt);
            }
        });

        javax.swing.GroupLayout jPanel1Layout = new javax.swing.GroupLayout(jPanel1);
        jPanel1.setLayout(jPanel1Layout);
        jPanel1Layout.setHorizontalGroup(
            jPanel1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(jPanel1Layout.createSequentialGroup()
                .addContainerGap()
                .addGroup(jPanel1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                    .addComponent(rbRead)
                    .addComponent(rbCommit)
                    .addComponent(rbWrite))
                .addContainerGap(javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE))
        );
        jPanel1Layout.setVerticalGroup(
            jPanel1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(jPanel1Layout.createSequentialGroup()
                .addComponent(rbRead)
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                .addComponent(rbWrite)
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                .addComponent(rbCommit, javax.swing.GroupLayout.PREFERRED_SIZE, 23, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addContainerGap(13, Short.MAX_VALUE))
        );

        butAceptar.setText("Aceptar"); // NOI18N
        butAceptar.setName("jButton1"); // NOI18N
        butAceptar.addMouseListener(new java.awt.event.MouseAdapter() {
            public void mouseClicked(java.awt.event.MouseEvent evt) {
                butAceptarMouseClicked(evt);
            }
        });

        jLabel2.setHorizontalAlignment(javax.swing.SwingConstants.LEFT);
        jLabel2.setText("Tipo de accion"); // NOI18N

        butCancelar.setText("Cancelar"); // NOI18N
        butCancelar.addMouseListener(new java.awt.event.MouseAdapter() {
            public void mouseClicked(java.awt.event.MouseEvent evt) {
                butCancelarMouseClicked(evt);
            }
        });

        jLabel3.setText("Variable"); // NOI18N

        cbItem.setName("cbItem"); // NOI18N

        javax.swing.GroupLayout layout = new javax.swing.GroupLayout(getContentPane());
        getContentPane().setLayout(layout);
        layout.setHorizontalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(layout.createSequentialGroup()
                .addContainerGap()
                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                    .addComponent(cbTransaction, javax.swing.GroupLayout.PREFERRED_SIZE, 133, javax.swing.GroupLayout.PREFERRED_SIZE)
                    .addComponent(jLabel1))
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                    .addComponent(jLabel2)
                    .addComponent(jPanel1, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE))
                .addGap(31, 31, 31)
                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                    .addComponent(jLabel3)
                    .addGroup(layout.createSequentialGroup()
                        .addComponent(butAceptar)
                        .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                        .addComponent(butCancelar))
                    .addComponent(cbItem, javax.swing.GroupLayout.PREFERRED_SIZE, 155, javax.swing.GroupLayout.PREFERRED_SIZE))
                .addContainerGap(20, Short.MAX_VALUE))
        );
        layout.setVerticalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(javax.swing.GroupLayout.Alignment.TRAILING, layout.createSequentialGroup()
                .addContainerGap(22, Short.MAX_VALUE)
                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                    .addComponent(jLabel1)
                    .addComponent(jLabel2)
                    .addComponent(jLabel3))
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                    .addComponent(jPanel1, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                    .addGroup(layout.createSequentialGroup()
                        .addComponent(cbTransaction, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                        .addGap(73, 73, 73))
                    .addGroup(layout.createSequentialGroup()
                        .addComponent(cbItem, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                        .addGap(18, 18, 18)
                        .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                            .addComponent(butAceptar)
                            .addComponent(butCancelar))))
                .addContainerGap())
        );

        pack();
    }//GEN-END:initComponents

    private void butAceptarMouseClicked(java.awt.event.MouseEvent evt)
    {//GEN-FIRST:event_butAceptarMouseClicked
    	// Genero la accion segun los valores en los controles del dialogo
    	if(rbRead.isSelected())
    	{
    		selectedAction = new NonLockingAction(NonLockingActionType.READ,
				(String)cbTransaction.getSelectedItem(),
				(String)cbItem.getSelectedItem());
    	}
    	else if(rbWrite.isSelected())
    	{
    		selectedAction = new NonLockingAction(NonLockingActionType.WRITE,
				(String)cbTransaction.getSelectedItem(),
				(String)cbItem.getSelectedItem());
    	}
    	else if(rbCommit.isSelected())
    	{
    		selectedAction = new NonLockingAction(NonLockingActionType.COMMIT,
				(String)cbTransaction.getSelectedItem());
    	}
    	
    	this.setVisible(false);
    	
    }//GEN-LAST:event_butAceptarMouseClicked

    private void rbCommitItemStateChanged(java.awt.event.ItemEvent evt)
    {//GEN-FIRST:event_rbCommitItemStateChanged
        cbItem.setEnabled(!rbCommit.isSelected());
    }//GEN-LAST:event_rbCommitItemStateChanged

    private void butCancelarMouseClicked(java.awt.event.MouseEvent evt)
    {//GEN-FIRST:event_butCancelarMouseClicked
        this.setVisible(false);
    }//GEN-LAST:event_butCancelarMouseClicked
    
    public static NonLockingAction showDialog(Frame parent, List<String> transactions, List<String> items)
    {
    	EditNonLockingActionDialog dialog = new EditNonLockingActionDialog(parent, true, transactions, items);
        dialog.setVisible(true);
        
        return dialog.selectedAction;
    }

    
    // Variables declaration - do not modify//GEN-BEGIN:variables
    private javax.swing.JButton butAceptar;
    private javax.swing.JButton butCancelar;
    private javax.swing.JComboBox cbItem;
    private javax.swing.JComboBox cbTransaction;
    private javax.swing.JLabel jLabel1;
    private javax.swing.JLabel jLabel2;
    private javax.swing.JLabel jLabel3;
    private javax.swing.JPanel jPanel1;
    private javax.swing.JRadioButton rbCommit;
    private javax.swing.JRadioButton rbRead;
    private javax.swing.JRadioButton rbWrite;
    private javax.swing.ButtonGroup rbgActionType;
    // End of variables declaration//GEN-END:variables
}
