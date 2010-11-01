package ubadbtools.recoveryLogAnalyzer.common;

import java.util.HashSet;
import java.util.LinkedList;
import java.util.List;
import java.util.Set;
import java.util.TreeSet;

import ubadbtools.recoveryLogAnalyzer.logRecords.AbortLogRecord;
import ubadbtools.recoveryLogAnalyzer.logRecords.EndCheckpointLogRecord;
import ubadbtools.recoveryLogAnalyzer.logRecords.RecoveryLogRecord;
import ubadbtools.recoveryLogAnalyzer.logRecords.UpdateLogRecord;
import ubadbtools.recoveryLogAnalyzer.results.RecoveryResult;

/**
 * Algoritmo de recovery basado en "UNDO-Log".
 * <p>
 * La intención de representar el algoritmo como un objeto separado es para facilitar el
 * refactoring de la aplicación 
 * (ver <a href="http://www.refactoring.com/catalog/replaceMethodWithMethodObject.html">Method Object</a>).
 * </p>
 * <p> 
 * Notar que las instancias de esta clase son de un solo uso: 
 * una vez ejecutado {@link #execute()} la instancia ya no sirve para volver a ejecutar el algoritmo.
 * </p>
 */
public class UndoLogRecovery {
	/**
	 * Método por conveniencia para ejecutar el recovery sobre un log.
	 * <p>
	 * Es equivalente a: <code>new UndoLogRecovery(aLog).execute()</code>.</p>
	 * 
	 * @param aLog log sobre el cual se va a efectuar el recovery.
	 */
	public static RecoveryResult executeFor(RecoveryLog aLog) {
		return new UndoLogRecovery(aLog).execute();
	}


	private RecoveryLog log;
	private Set<String> incompleteTransactions;
	private List<DatabaseRecoveryAction> recoveryActions = new LinkedList<DatabaseRecoveryAction>();

	// se usa LinkedList ya que por la forma en que esta implementado el algoritmo conviene agregar
	// los registros de log adelante de la lista
	private LinkedList<RecoveryLogRecord> newLogRecords = new LinkedList<RecoveryLogRecord>();

	private List<RecoveryLogRecord> records;
	private int startRecordIndex = 0;
	private int endRecordIndex;

	/**
	 * Crea una instancia del algoritmo para ser utilizada sobre un undo log especifico.
	 *
	 * @param log el log utilizado por el algoritmo, debe pasar las validaciones de {@link LogValidation}.
	 */
	public UndoLogRecovery(RecoveryLog log) {
		this.log = log;
		records = log.getLogRecords();
		endRecordIndex = records.size() - 1;
		incompleteTransactions = new TreeSet<String>();
	}
	
	
	/**
	 * Ejecuta el algoritmo de recovery basado en un "UNDO-Log".
	 */
	public RecoveryResult execute() {
		collectIncompleteTransactionsAndStartRecordIndex();
		undoIncompleteTransactions();
		return createResult();
	}

	/*
	 * Obtiene del log cuales son las transacciones incompletas y
	 * de donde se debe comenzar a procesar el log.
	 */
	private void collectIncompleteTransactionsAndStartRecordIndex() {
		Set<String> completed = new HashSet<String>(log.getTransactions().size());
		boolean endCheckpointFound = false;

		for (int i = endRecordIndex; i >= 0; i--) {
			RecoveryLogRecord record = records.get(i);

			if (record.isCommit() || record.isAbort()) {
				completed.add(record.getTransaction());
			} else if (record.isStart() && !completed.contains(record.getTransaction())) {
				incompleteTransactions.add(record.getTransaction());
				newLogRecords.addFirst(new AbortLogRecord(record.getTransaction()));
			} else if (record.isEndCheckpoint()) {
				endCheckpointFound = true;
			} else if (record.isStartCheckpoint()) {
				if (endCheckpointFound) {
					// habia un endcheckpoint y se encontro su correspondiente start...
					// ya no es necesario seguir procesando el log
					startRecordIndex = i;
					break;
				} else {
					// hay un start checkpoint pero no su correspondiente end...
					// es necesario corregirlo en el log
					newLogRecords.addLast(new EndCheckpointLogRecord());
				}
			}
		}
	}

	/*
	 * Deshace las transacciones incompletas desde el ultimo registro hasta
	 * la posicion "startRecord".
	 * Las acciones de recuperacion son agregadas a la lista "recoveryActions".
	 */
	private void undoIncompleteTransactions() {
		for (int i = endRecordIndex; i >= startRecordIndex; i--) {
			RecoveryLogRecord record = records.get(i);
			if (imcompleteTransactionIsAffectedBy(record)) {
				record.addRecoveryActionTo(recoveryActions, i);
			}
		}
	}

	private boolean imcompleteTransactionIsAffectedBy(RecoveryLogRecord record) {
		return record.affectsTransaction() && incompleteTransactions.contains(record.getTransaction());
	}


	/*
	 * Crea una instancia de RecoveryResult con la informacion recolectada durante la
	 * ejecucion del algoritmo.
	 */
	private RecoveryResult createResult() {	
		return new RecoveryResult(log, startRecordIndex, incompleteTransactions, recoveryActions, newLogRecords);
	}
}