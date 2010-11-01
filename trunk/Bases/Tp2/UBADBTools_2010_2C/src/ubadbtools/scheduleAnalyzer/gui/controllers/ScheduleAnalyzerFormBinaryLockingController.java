package ubadbtools.scheduleAnalyzer.gui.controllers;

import ubadbtools.scheduleAnalyzer.binaryLocking.BinaryLockingSchedule;
import ubadbtools.scheduleAnalyzer.common.Action;
import ubadbtools.scheduleAnalyzer.common.Schedule;
import ubadbtools.scheduleAnalyzer.exceptions.ScheduleException;
import ubadbtools.scheduleAnalyzer.gui.forms.EditBinaryLockingActionDialog;
import ubadbtools.scheduleAnalyzer.gui.forms.ScheduleAnalyzerForm;
import ubadbtools.scheduleAnalyzer.gui.forms.tools.ScheduleTableModel;

public class ScheduleAnalyzerFormBinaryLockingController extends ScheduleAnalyzerFormController
{
	BinaryLockingSchedule schedule = null;
		
	public ScheduleAnalyzerFormBinaryLockingController(ScheduleAnalyzerForm form)
	{
		// Guardo e inicializo las variables del control 
		this.form = form;
		this.formTable = form.getTableSchedule(); 
		this.formTableModel =  ((ScheduleTableModel)formTable.getModel());
		this.schedule = new BinaryLockingSchedule(); 
	}
	
	@Override
	protected Schedule getSchedule()
	{
		return schedule;
	}
	
	@Override
	protected void setSchedule(Schedule schedule)
	{
		this.schedule = (BinaryLockingSchedule)schedule; 
	}
	
	@Override
	protected Action ShowEditActionDialog()
	{
    	// Invoco a la modificacion del item que voy a agregar
    	return EditBinaryLockingActionDialog.showDialog(
    			form, 
    			schedule.getTransactions(),
    			schedule.getItems());
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
}
