package ubadbtools.recoveryLogAnalyzer.logRecords;

import java.util.List;

import ubadbtools.recoveryLogAnalyzer.common.DatabaseRecoveryAction;

/**
 * Clase base para representar los registros del log.
 */
public abstract class RecoveryLogRecord {
	protected String transaction;

	/**
	 * Transaccion a la cual "afecta" el registro.
	 * 
	 * @return el nombre de la transacción o null si el registro no afecta a una transacción.
	 * 
	 * @see #affectTransaction
	 */
	public String getTransaction() {
		return transaction;
	}
	
	/**
	 * @return true si este registro afecta a una transacción.
	 */
	public boolean affectsTransaction() {
		return transaction != null;
	}

	// estos metodos de "testing" isXX son mejores que hacer
	// instanceof por que la desicion queda oculta detras de la interfaz
	// y no de la clase especifica, sin embargo tampoco es una solucion
	// muy elegante
	
	/**
	 * Retornar true si el registro es un &lt;START tx&gt;
	 * 
	 * @return retorna siempre <i>false</i>, debe ser reimplementado por las sub-clases para retornar otro valor.
	 */
	public boolean isStart() {
		return false;
	}

	/**
	 * Retornar true si el registro es un &lt;COMMIT tx&gt;
	 * 
	 * @return retorna siempre <i>false</i>, debe ser reimplementado por las sub-clases para retornar otro valor.
	 */
	public boolean isCommit() {
		return false;
	}

	/**
	 * Retornar true si el registro es un &lt;UPDATE tx item value &gt;
	 * 
	 * @return retorna siempre <i>false</i>, debe ser reimplementado por las sub-clases para retornar otro valor.
	 */
	public boolean isUpdate() {
		return false;
	}

	/**
	 * Retornar true si el registro es un &lt;START CKPT(..)&gt;
	 * 
	 * @return retorna siempre <i>false</i>, debe ser reimplementado por las sub-clases para retornar otro valor.
	 */
	public boolean isStartCheckpoint() {
		return false;
	}

	/**
	 * Retornar true si el registro es un &lt;END CKPT&gt;
	 * 
	 * @return retorna siempre <i>false</i>, debe ser reimplementado por las sub-clases para retornar otro valor.
	 */
	public boolean isEndCheckpoint() {
		return false;
	}

	/**
	 * Retornar true si el registro es un &lt;ABORT tx&gt;
	 * 
	 * @return retorna siempre <i>false</i>, debe ser reimplementado por las sub-clases para retornar otro valor.
	 */
	public boolean isAbort() {
		return false;
	}
	
	/**
	 * Dada una colección de {@link DatabaseRecoveryAction} agrega una acción que corresponde a la
	 * recuperación.
	 * <p>
	 * Por default esta implementación no hace nada, las subclases deben reimplementar este
	 * método para agregar una acción de recuperación si es necesario.</p>
	 * 
	 * @param recoveryActions lista de acciones de recuperación, donde se agregará la acción correspondiente
	 * a este registro.
	 * @param logRecordIndex indice con la ubicación del registro en el archivo de log.
	 */
	public void addRecoveryActionTo(List<DatabaseRecoveryAction> recoveryActions, int logRecordIndex) { 
		// no agrega ninguna acción
	}
}
