package ubadbtools.recoveryLogAnalyzer.logRecords;

import java.util.List;

import ubadbtools.recoveryLogAnalyzer.common.DatabaseRecoveryAction;


public class UpdateLogRecord extends RecoveryLogRecord
{
	private String 	item;
	private String	oldValue;
	public UpdateLogRecord(String transaction, String item, String oldValue)
	{
		this.transaction = transaction;
		this.item = item;
		this.oldValue = oldValue;
	}
	
	public String getItem()
	{
		return item;
	}
	public String getOldValue()
	{
		return oldValue;
	}
	
	public String toString()
	{
		return "<UPDATE " + transaction + ", ITEM=" + item + ", OLD VALUE=" + oldValue+ ">"; 
	}
	
	@Override
	public boolean isUpdate() {
		return true;
	}
	
	/**
	 * Argrega una acción para hacer undo del update que representa este registro.
	 */
	@Override
	public void addRecoveryActionTo(List<DatabaseRecoveryAction> recoveryActions, int logRecordIndex) {
		recoveryActions.add(new DatabaseRecoveryAction(getItem(), getOldValue(), logRecordIndex));
	}
}
