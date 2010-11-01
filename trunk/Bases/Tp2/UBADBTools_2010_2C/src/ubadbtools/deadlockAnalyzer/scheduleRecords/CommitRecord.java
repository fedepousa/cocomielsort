package ubadbtools.deadlockAnalyzer.scheduleRecords;


public class CommitRecord extends ScheduleRecord
{
	public CommitRecord(String transaction)
	{
		this.transaction = transaction;
	}
	
	public String toString()
	{
		return "COMMIT"; 
	}
}
