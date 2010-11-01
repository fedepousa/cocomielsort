package ubadbtools.recoveryLogAnalyzer.common;

import ubadbtools.recoveryLogAnalyzer.results.RecoveryResult;

/**
 * Representa una acción de recuperación de la base de datos.
 * <p>
 * El resultado de la recuperación {@link RecoveryResult} usa
 * instancias de esta clase en {@link RecoveryResult#getDatabaseRecoveryActions()} para
 * indicar los cambios que deben realizarse en una base para recuperar su estado.</p>
 */
public class DatabaseRecoveryAction {
	private String item;
	private String value;
	private int logRecordIndex;

	/** 
	 * Crea una acción de recuperación de la base de datos.
	 *
	 * @param item item a modificar
	 * @param value valor a asignar
	 * @param logLine indice del registro en el log que origino este cambio en la base de datos.
	 */
	public DatabaseRecoveryAction(String item, String value, int logLine) {
		this.item = item;
		this.value = value;
		this.logRecordIndex = logLine;
	}
	
	@Override
	public String toString() {
		return item + ":=" + value + " (deshaciendo el paso " + (logRecordIndex + 1) + ")";
	}
	
	/**
	 * Item de la base de datos a modificar.
	 */
	public String getItem() {
		return item;
	}

	/**
	 * Valor a asignar.
	 */
	public String getValue() {
		return value;
	}

	/**
	 * Indice del registro en el log que origino este cambio en la base de datos.
	 */
	public int getLogRecordIndex() {
		return logRecordIndex;
	}
}
