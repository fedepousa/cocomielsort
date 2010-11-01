/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

/*
 * CommitLogRecordDialog.java
 *
 * Created on 16/09/2009, 16:57:06
 */

package ubadbtools.deadlockAnalyzer.gui.forms;

import java.awt.Frame;
import java.util.Set;
import javax.swing.GroupLayout;
import javax.swing.JComponent;
import javax.swing.LayoutStyle;

import ubadbtools.deadlockAnalyzer.scheduleRecords.LockRecord;
import ubadbtools.deadlockAnalyzer.scheduleRecords.ScheduleRecord;
import ubadbtools.util.guiHelper.GUIHelper;


/**
* This code was edited or generated using CloudGarden's Jigloo
* SWT/Swing GUI Builder, which is free for non-commercial
* use. If Jigloo is being used commercially (ie, by a corporation,
* company or business for any purpose whatever) then you
* should purchase a license for each developer using Jigloo.
* Please visit www.cloudgarden.com for details.
* Use of Jigloo implies acceptance of these licensing terms.
* A COMMERCIAL LICENSE HAS NOT BEEN PURCHASED FOR
* THIS MACHINE, SO JIGLOO OR THIS CODE CANNOT BE USED
* LEGALLY FOR ANY CORPORATE OR COMMERCIAL PURPOSE.
*/
/**
 *
 * @author ces
 */
public class LockRecordDialog extends javax.swing.JDialog {
	//[start] Atributos
	private ScheduleRecord record = null;
	//[end]
	
	//[start] Constructor
    public LockRecordDialog(java.awt.Frame parent, boolean modal, Set<String> transactions, Set<String> items) {
        super(parent, modal);
        initComponents();
        
        //Lleno las transacciones
        for(String transaction : transactions)
        	cbTransactions.addItem(transaction);

        //Lleno los Ã­tems
        for(String item : items)
        	cbItems.addItem(item);
    }
    //[end]

    //[start] showDialog
    public static ScheduleRecord showDialog(Frame parent, Set<String> transactions, Set<String> items)
    {
    	LockRecordDialog dialog = new LockRecordDialog(parent, true, transactions,items);
        dialog.setVisible(true);
        
        return dialog.record;
    }
    //[end]
    
    //[start] InitComponents (AUTO-GENERATED)
    @SuppressWarnings("unchecked")
    // <editor-fold defaultstate="collapsed" desc="Generated Code">//GEN-BEGIN:initComponents
    private void initComponents() {

        GroupLayout layout = new GroupLayout((JComponent)getContentPane());
        getContentPane().setLayout(layout);
        {
        	btAceptar = new javax.swing.JButton();
        	btAceptar.setText("Aceptar");
        	btAceptar.addActionListener(new java.awt.event.ActionListener() {
        		public void actionPerformed(java.awt.event.ActionEvent evt) {
        			btAceptarActionPerformed(evt);
        		}
        	});
        }
        {
        	btCancelar = new javax.swing.JButton();
        	btCancelar.setText("Cancelar");
        	btCancelar.addActionListener(new java.awt.event.ActionListener() {
        		public void actionPerformed(java.awt.event.ActionEvent evt) {
        			btCancelarActionPerformed(evt);
        		}
        	});
        }
        jLabel1 = new javax.swing.JLabel();
        cbTransactions = new javax.swing.JComboBox();
        jLabel2 = new javax.swing.JLabel();
        cbItems = new javax.swing.JComboBox();

        setDefaultCloseOperation(javax.swing.WindowConstants.DISPOSE_ON_CLOSE);
        this.setTitle("Lock");

        jLabel1.setText("Transacción");

        jLabel2.setText("Ítem");
        layout.setHorizontalGroup(layout.createSequentialGroup()
        	.addContainerGap(32, 32)
        	.addGroup(layout.createParallelGroup()
        	    .addGroup(GroupLayout.Alignment.LEADING, layout.createSequentialGroup()
        	        .addComponent(jLabel1, GroupLayout.PREFERRED_SIZE, GroupLayout.PREFERRED_SIZE, GroupLayout.PREFERRED_SIZE)
        	        .addGap(0, 20, Short.MAX_VALUE))
        	    .addGroup(layout.createSequentialGroup()
        	        .addGroup(layout.createParallelGroup()
        	            .addGroup(GroupLayout.Alignment.LEADING, layout.createSequentialGroup()
        	                .addGap(58)
        	                .addComponent(btAceptar, GroupLayout.PREFERRED_SIZE, GroupLayout.PREFERRED_SIZE, GroupLayout.PREFERRED_SIZE))
        	            .addGroup(GroupLayout.Alignment.LEADING, layout.createSequentialGroup()
        	                .addComponent(jLabel2, GroupLayout.PREFERRED_SIZE, 106, GroupLayout.PREFERRED_SIZE)
        	                .addGap(8)))
        	        .addPreferredGap(LayoutStyle.ComponentPlacement.RELATED)
        	        .addGroup(layout.createParallelGroup()
        	            .addComponent(cbTransactions, GroupLayout.Alignment.LEADING, 0, 106, Short.MAX_VALUE)
        	            .addComponent(cbItems, GroupLayout.Alignment.LEADING, 0, 106, Short.MAX_VALUE)
        	            .addGroup(GroupLayout.Alignment.LEADING, layout.createSequentialGroup()
        	                .addComponent(btCancelar, GroupLayout.PREFERRED_SIZE, GroupLayout.PREFERRED_SIZE, GroupLayout.PREFERRED_SIZE)
        	                .addGap(0, 45, Short.MAX_VALUE)))
        	        .addGap(10)))
        	.addContainerGap(51, 51));
        layout.setVerticalGroup(layout.createSequentialGroup()
        	.addContainerGap(38, 38)
        	.addGroup(layout.createParallelGroup(GroupLayout.Alignment.BASELINE)
        	    .addComponent(cbTransactions, GroupLayout.Alignment.BASELINE, GroupLayout.PREFERRED_SIZE, GroupLayout.PREFERRED_SIZE, GroupLayout.PREFERRED_SIZE)
        	    .addComponent(jLabel1, GroupLayout.Alignment.BASELINE, GroupLayout.PREFERRED_SIZE, GroupLayout.PREFERRED_SIZE, GroupLayout.PREFERRED_SIZE))
        	.addPreferredGap(LayoutStyle.ComponentPlacement.UNRELATED)
        	.addGroup(layout.createParallelGroup(GroupLayout.Alignment.BASELINE)
        	    .addComponent(cbItems, GroupLayout.Alignment.BASELINE, GroupLayout.PREFERRED_SIZE, GroupLayout.PREFERRED_SIZE, GroupLayout.PREFERRED_SIZE)
        	    .addComponent(jLabel2, GroupLayout.Alignment.BASELINE, GroupLayout.PREFERRED_SIZE, GroupLayout.PREFERRED_SIZE, GroupLayout.PREFERRED_SIZE))
        	.addGap(0, 25, Short.MAX_VALUE)
        	.addGroup(layout.createParallelGroup(GroupLayout.Alignment.BASELINE)
        	    .addComponent(btAceptar, GroupLayout.Alignment.BASELINE, GroupLayout.PREFERRED_SIZE, GroupLayout.PREFERRED_SIZE, GroupLayout.PREFERRED_SIZE)
        	    .addComponent(btCancelar, GroupLayout.Alignment.BASELINE, GroupLayout.PREFERRED_SIZE, GroupLayout.PREFERRED_SIZE, GroupLayout.PREFERRED_SIZE))
        	.addPreferredGap(LayoutStyle.ComponentPlacement.RELATED, 17, GroupLayout.PREFERRED_SIZE));

        pack();
    }// </editor-fold>//GEN-END:initComponents
  //[end]

    //[start] Eventos
    private void btAceptarActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_btAceptarActionPerformed
    	if(	cbTransactions.getSelectedItem()==null	||
    		cbItems.getSelectedItem()==null)
    	{
        	GUIHelper.showWarningMessage(this, "Falta ingresar algún dato");
    	}
    	else
    	{
	        record = new LockRecord((String)cbTransactions.getSelectedItem(),(String)cbItems.getSelectedItem());
	        this.setVisible(false);
    	}
    }//GEN-LAST:event_btAceptarActionPerformed

    private void btCancelarActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_btCancelarActionPerformed
       this.setVisible(false);
    }//GEN-LAST:event_btCancelarActionPerformed
    //[end]

    //[start] Variables Form (AUTO-GENERATED)
    // Variables declaration - do not modify//GEN-BEGIN:variables
    private javax.swing.JButton btAceptar;
    private javax.swing.JButton btCancelar;
    private javax.swing.JComboBox cbItems;
    private javax.swing.JComboBox cbTransactions;
    private javax.swing.JLabel jLabel1;
    private javax.swing.JLabel jLabel2;
    // End of variables declaration//GEN-END:variables
    //[end]

}
