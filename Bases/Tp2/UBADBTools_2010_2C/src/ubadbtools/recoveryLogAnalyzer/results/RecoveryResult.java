package ubadbtools.recoveryLogAnalyzer.results;

import java.util.Iterator;
import java.util.List;
import java.util.Set;

import ubadbtools.recoveryLogAnalyzer.common.DatabaseRecoveryAction;
import ubadbtools.recoveryLogAnalyzer.common.RecoveryLog;
import ubadbtools.recoveryLogAnalyzer.logRecords.RecoveryLogRecord;

/**
 * Resultado de aplicar el algortimo de recovery sobre un log.
 * <p>Las instancias de esta clase contienen la siguiente información:
 * <ul>
 * <li>Las transacciones a deshacer: {@link #getTransactionsToUndo()}</li>
 * <li>Los registros a agregar en el log: {@link #getNewLogRecords()}</li>
 * <li>Las acciones que deben realizarse para regresar la base de datos a un estado consistente: {@link #getDatabaseRecoveryActions()}</li>
 * </ul>
 */
public class RecoveryResult {
	private Set<String> transactionsToUndo;
	private List<DatabaseRecoveryAction> databaseRecoveryActions;
	private List<RecoveryLogRecord> newLogRecords;
	private RecoveryLog log;
	private int startRecordIndex;

	public RecoveryResult(RecoveryLog log, int startRecordIndex, Set<String> transactionsToUndo,
			List<DatabaseRecoveryAction> databaseRecoveryActions,
			List<RecoveryLogRecord> newLogRecords) {
		this.log = log;
		this.startRecordIndex = startRecordIndex;
		this.transactionsToUndo = transactionsToUndo;
		this.databaseRecoveryActions = databaseRecoveryActions;
		this.newLogRecords = newLogRecords;
	}

	public Set<String> getTransactionsToUndo() {
		return transactionsToUndo;
	}

	public String getTransactionsToUndoDescription() {
        final String description = join(transactionsToUndo, ", ");
		return description.isEmpty() ? "Ninguna" : description;
	}

	public String getDatabaseChangesDescription() {
		return (databaseRecoveryActions.isEmpty()) ? "Ninguno" : join(
				databaseRecoveryActions, "\n");
	}


	private String join(Iterable<?> iterable, String separator) {
		StringBuilder buffer = new StringBuilder();
		for (Iterator<?> iter = iterable.iterator(); iter.hasNext();) {
			buffer.append(iter.next());
			if (iter.hasNext()) {
				buffer.append(separator);
			}
		}

		return buffer.toString();
	}

	public String getLogChangesDescription() {
		switch (newLogRecords.size()) {
		case 0:
			return "Ninguno";
		case 1:
			return "Se agrega el registro " + newLogRecords.get(0)
					+ " y luego se hace flush del log";
		default:
			return "Se agregan los registros " + join(newLogRecords, "")
					+ " y luego se hace flush del log";
		}
	}

	public RecoveryLog getLog() {
		return log;
	}

	public int getStartRecordIndex() {
		return startRecordIndex;
	}
	
	public List<RecoveryLogRecord> getNewLogRecords() {
		return newLogRecords;
	}
	
	public List<DatabaseRecoveryAction> getDatabaseRecoveryActions() {
		return databaseRecoveryActions;
	}
}
