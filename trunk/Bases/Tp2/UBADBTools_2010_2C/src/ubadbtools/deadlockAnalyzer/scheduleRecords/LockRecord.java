package ubadbtools.deadlockAnalyzer.scheduleRecords;


public class LockRecord extends ScheduleRecord
{
	private String 	item;
	
	public LockRecord(String transaction, String item)
	{
		this.transaction = transaction;
		this.item = item;
	}
	
	public String getItem()
	{
		return item;
	}

	public String toString()
	{
		return "LOCK(" + item + ")"; 
	}
}
