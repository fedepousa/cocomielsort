package ubadbtools.deadlockAnalyzer.gui.controllers;


import java.util.LinkedHashSet;
import java.util.Set;
import java.util.Vector;

import javax.swing.DefaultListModel;
import javax.swing.JTable;
import javax.swing.table.TableColumnModel;

import ubadbtools.deadlockAnalyzer.common.DeadlockModelType;
import ubadbtools.deadlockAnalyzer.common.Schedule;
import ubadbtools.deadlockAnalyzer.gui.etc.ScheduleTableModel;
import ubadbtools.deadlockAnalyzer.gui.forms.AnalyzeScheduleDialog;
import ubadbtools.deadlockAnalyzer.gui.forms.DeadlockAnalyzerForm;
import ubadbtools.deadlockAnalyzer.gui.forms.EditRecordDialog;
import ubadbtools.deadlockAnalyzer.scheduleRecords.ScheduleRecord;
import ubadbtools.util.guiHelper.GUIHelper;

public class DeadlockAnalyzerFormController
{
	private DeadlockAnalyzerForm form = null;
	private JTable formTable = null;
	private ScheduleTableModel formTableModel = null;
	private Schedule schedule = null;
	private Set<String> transactions;
	
	public DeadlockAnalyzerFormController(DeadlockAnalyzerForm form, DeadlockModelType type)
	{
		// Guardo e inicializo las variables del control 
		this.form = form;
		this.formTable = form.getTableSchedule(); 
		this.formTableModel =  ((ScheduleTableModel)formTable.getModel());
		this.schedule = new Schedule(type);
		this.transactions = new LinkedHashSet<String>();
	}
	
	public static DeadlockAnalyzerFormController CreateController(DeadlockAnalyzerForm form, DeadlockModelType type)
	{
		// Creo un controlador en funcion del tipo de la historia que me dieron y lo inicializo
		DeadlockAnalyzerFormController ret = new DeadlockAnalyzerFormController(form,type);
		ret.InitializeForm();
		
		return ret;
	}

	
	public static DeadlockAnalyzerFormController CreateController(DeadlockAnalyzerForm form, Schedule schedule)
	{
		// Creo un controlador en funcion del tipo de la historia que me dieron 
		DeadlockAnalyzerFormController ret = new DeadlockAnalyzerFormController(form, schedule.getDeadlockModelType());
		
		// Al nuevo controlador le cargo la historia
		ret.LoadSchedule(schedule);
		
		return ret;
	}
	
	private void InitializeForm()
	{
		// Limpio la tabla
		ClearScheduleOnForm();
		
        // Agrego la columna de numero de item
       formTableModel.addColumn("#Paso");
       
       // Habilito los controles
       form.EnableUserControls();
	}

	/**
	 * Borra toda informacion que halla de la historia actual en el formulario
	 */
	private void ClearScheduleOnForm()
	{
		//Borro las transacciones almacenadas
		transactions.clear();
		
		// Borro todas las filas de la tabla
		formTableModel.getDataVector().removeAllElements();
	
		// Borro todas las columnas de la tabla
		TableColumnModel columnModel = formTable.getColumnModel();
		while(formTable.getColumnCount() > 0)
		{
			formTable.removeColumn(columnModel.getColumn(0));
		}
		//Además de remover las columnas, hay que llamar a este método (aparentemente, bug de Java: http://bugs.sun.com/bugdatabase/view_bug.do?bug_id=4283734)
		formTableModel.setDataVector( new Vector<Object>(), new Vector<Object>());
		
		// Borro la lista de items
		DefaultListModel listModel = (DefaultListModel)form.getItemsList().getModel();
		listModel.clear();
	}
	
	/**
	 * Le muestra al usuario el reporte del analisis de la historia
	 */
	public void AnalyzeSchedule()
	{
		// Lanzo el dialogo en donde se analizara la historia
		AnalyzeScheduleDialog.showDialog(form, getSchedule());
	}
	
	/**
	 * Agrega una nueva transaccion (columna) a la tabla
	 * @throws ScheduleException 
	 */
	public void AddNewTransaction() throws Exception
	{
		//Le pido al usuario un nombre
		String newTxName = GUIHelper.showInputDialog(form,"Nombre de la nueva transacción:");
		
		// Si el usuario puso algo, agrego la nueva transaccion
		if(newTxName != null && !newTxName.trim().equals(""))
		{
			//Se la agrego al form
			AddTransactionToForm(newTxName);

			//Se la agrego al schedule
			schedule.addTransaction(newTxName);
		}
	}
	
	private void AddTransactionToForm(String transaction)
	{
		if(!transactions.contains(transaction))
		{
			formTableModel.addColumn(transaction);
			transactions.add(transaction);
		}
	}
	
	/**
	 * Agrega un nuevo paso (fila) a la tabla
	 * @throws ScheduleException
	 */
	public void AddNewStep() throws Exception
	{
		// Lanzo el dialogo para la edicion de la accion
		ScheduleRecord record = ShowEditRecordDialog();
		
		// Si no se eligio una accion no sigo
    	if(record == null)
    	{
    		return;
    	}
    	
    	// Agrego la accion a la historia
    	getSchedule().addRecord(record);
    	
    	// Agrego el paso a la tabla
    	AddStepToTable(record);
	}
	
	/**
     * Agrega un nuevo item a la historia
     */
	public void AddNewItem() throws Exception
	{
		// Invoco al metodo concreto para agregar al nuevo item
		String newItem = InnerAddNewItem();
		
		// Si se agrego un item, lo agrego a la lista de items en el formulario
		if(newItem != null)
		{
			// Agrego el item a la lista
			AddItemToList(newItem);
		}
	}

	/**
	 * Elimina la historia actual y carga la dada
	 * @param schedule
	 */
	private void LoadSchedule(Schedule schedule)
	{
		// Piso la historia actual
		this.setSchedule(schedule);
		
		// Inicializo el formulario
		this.InitializeForm();
		
		// Muestro la historia en la tabla
		ShowSchedule(schedule);
	}
	
	/**
	 * Devuelve la historia formada actualmente
	 * @return
	 */
	public Schedule GetSchedule()
	{
		return getSchedule();
	}
	
	/**
	 * Muestra la historia dada en el formulario, pisando la anterior
	 * @param schedule
	 */
	private void ShowSchedule(Schedule schedule)
	{
		// Agrego los items
		for(String item : schedule.getItems())
		{
			this.AddItemToList(item);
		}
		
		// Agrego las transacciones
		for(String trans : schedule.getTransactions())
		{
			this.AddTransactionToForm(trans);
		}
		
		// Agrego los pasos
		for(ScheduleRecord record : schedule.getScheduleRecords())
		{
			this.AddStepToTable(record);
		}
	}
	
    /**
     * Muestra el dialogo correspondiende a la edicion del item con el numero dado.
     */
    public void EditRecord(int recordNumber) throws Exception
    {
    	// Lanzo el editor de pasos concreto
    	ScheduleRecord record = ShowEditRecordDialog();
    	
		// Si no hay accion es porque se cancelo el dialogo
		if(record == null)
		{
			return;
		}
		
		// Agrego la accion a la historia
		getSchedule().replaceRecord(recordNumber, record);
		
		// Limpio las demas celdas donde podria haber otros valores
		for(int column = 1; column < formTableModel.getColumnCount(); ++column)
		{
			formTableModel.setValueAt("", recordNumber, column);
		}
		
		// Modifico la tabla con el nuevo valor 
		formTableModel.setValueAt(record.toString(), 
			recordNumber,
			formTableModel.findColumn(record.getTransaction()));
	}
	
	/**
	 * Agrega un paso a la tabla en el formulario
	 * @param newItemNumer
	 * @param newAction
	 */
	protected void AddStepToTable(ScheduleRecord record)
	{
		// Averiguo el numero del nuevo item
    	int itemNumer = formTableModel.getRowCount() + 1;

		// Agrego la fila a la tabla con el numero de paso en el primer campo
		int transactionColumnIndex = formTableModel.findColumn(record.getTransaction());
    	Object[] newRow = new Object[formTableModel.getColumnCount() + 1];
    	newRow[0] =  Integer.toString(itemNumer);
    	newRow[transactionColumnIndex] = record.toString();
    	formTableModel.addRow(newRow);
	}
	
	/**
	 * Agrega un item a la lista de items en el formulario
	 * @param newItem
	 */
	private void AddItemToList(String newItem)
	{
		//Se lo agrego a la lista en el form
		DefaultListModel listModel = (DefaultListModel)form.getItemsList().getModel();
		
		if(!listModel.contains(newItem))
			listModel.add(listModel.getSize(), newItem);
	}
	
    /**
     * Logica concreta de cada implementacion a la hora de agregar un nuevo item
     */
	public String InnerAddNewItem() throws Exception
	{
		// Muestro el dialogo para que el usuario ingrese el nombre del item
		String item = form.ShowInputDialog("Nombre del nuevo ítem:");
		
		// Si el usuario no cancelo el dialogo, agrego el item
		if(item != null)
		{
			schedule.addItem(item);
		}
		
		return item;
	}
	
	/**
	 * Muestra el dialogo de edicion de accion
	 * @return
	 * @throws ScheduleException
	 */
	protected ScheduleRecord ShowEditRecordDialog()
	{
    	// Invoco a la modificacion del item que voy a agregar
    	return EditRecordDialog.showDialog(
    			form, 
    			schedule.getTransactions(),
    			schedule.getItems());
	}
	
	protected Schedule getSchedule()
	{
		return schedule;
	}	
	
	protected void setSchedule(Schedule schedule)
	{
		this.schedule = schedule; 
	}
	
}
