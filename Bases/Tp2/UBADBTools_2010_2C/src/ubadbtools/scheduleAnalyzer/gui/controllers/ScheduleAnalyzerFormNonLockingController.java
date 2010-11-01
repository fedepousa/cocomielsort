package ubadbtools.scheduleAnalyzer.gui.controllers;

import ubadbtools.scheduleAnalyzer.common.Action;
import ubadbtools.scheduleAnalyzer.common.Schedule;
import ubadbtools.scheduleAnalyzer.exceptions.ScheduleException;
import ubadbtools.scheduleAnalyzer.gui.forms.EditNonLockingActionDialog;
import ubadbtools.scheduleAnalyzer.gui.forms.ScheduleAnalyzerForm;
import ubadbtools.scheduleAnalyzer.gui.forms.tools.ScheduleTableModel;
import ubadbtools.scheduleAnalyzer.nonLocking.NonLockingSchedule;

public class ScheduleAnalyzerFormNonLockingController extends ScheduleAnalyzerFormController
{
	NonLockingSchedule schedule = null;
		
	public ScheduleAnalyzerFormNonLockingController(ScheduleAnalyzerForm form)
	{
		// Guardo e inicializo las variables del control 
		this.form = form;
		this.formTable = form.getTableSchedule(); 
		this.formTableModel =  ((ScheduleTableModel)formTable.getModel());
		this.schedule = new NonLockingSchedule(); 
	}
	
	@Override
	protected Schedule getSchedule()
	{
		return schedule;
	}
	
	@Override
	protected void setSchedule(Schedule schedule)
	{
		this.schedule = (NonLockingSchedule)schedule; 
	}
	
	@Override
	public String InnerAddNewItem() throws ScheduleException
	{
		// Muestro el dialogo para que el usuario ingrese el nombre del item
		String item = form.ShowInputDialog("Nombre del nuevo item:");
		
		// Si el usuario no cancelo el dialogo, agrego el item
		if(item != null)
		{
			schedule.addItem(item);
		}
		
		return item;
	}

	@Override
    public Action ShowEditActionDialog() throws ScheduleException
	{
    	// Muestro el dialogo de seleccion de la nueva accion
    	return EditNonLockingActionDialog.showDialog(form, schedule.getTransactions(), schedule.getItems());
    }
}
