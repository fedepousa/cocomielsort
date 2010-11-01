package ubadbtools.deadlockAnalyzer.scheduleRecords;


public class StartRecord extends ScheduleRecord
{
	public StartRecord(String transaction) 
	{
		this.transaction = transaction;
	}
	
	public String toString()
	{
		return "START"; 
	}
}
