package ubadbtools.deadlockAnalyzer.common;

import java.util.ArrayList;
import java.util.LinkedHashSet;
import java.util.List;
import java.util.Set;

import ubadbtools.deadlockAnalyzer.scheduleRecords.ScheduleRecord;

public class Schedule
{
	//[start] Atributos
	private List<ScheduleRecord> scheduleRecords;
	private Set<String> items;	//Uso sets para evitar repetidos
	private Set<String> transactions;
	private DeadlockModelType deadlockModelType;
	//[end]
	
	//[start] Constructor
	public Schedule(DeadlockModelType type)
	{
		scheduleRecords 	= new ArrayList<ScheduleRecord>();
		items 				= new LinkedHashSet<String>();	//Uso esta clase porque me provee un orden de iteración predecible (no como HashSet)
		transactions		= new LinkedHashSet<String>();
		deadlockModelType	= type;
	}
	//[end]

	//[start] Getters
	public List<ScheduleRecord> getScheduleRecords()
	{
		return scheduleRecords;
	}
	
	public Set<String> getItems()
	{
		return items;
	}

	public Set<String> getTransactions()
	{
		return transactions;
	}
	
	public DeadlockModelType getDeadlockModelType()
	{
		return deadlockModelType;
	}
	//[end]
	
	//[start] Add
	public void addRecord(ScheduleRecord record)
	{
		scheduleRecords.add(record);
	}
	
	public void addItem(String item)
	{
		items.add(item);
	}

	public void addTransaction(String transaction)
	{
		transactions.add(transaction);
	}
	//[end]

	//[start] replace
	public void replaceRecord(int position, ScheduleRecord record)
	{
		scheduleRecords.set(position, record);
	}
	//[end]
}
