package ubadbtools.deadlockAnalyzer.scheduleRecords;


public class UnlockRecord extends ScheduleRecord
{
	private String 	item;
	
	public UnlockRecord(String transaction, String item)
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
		return "UNLOCK(" + item + ")"; 
	}
}
