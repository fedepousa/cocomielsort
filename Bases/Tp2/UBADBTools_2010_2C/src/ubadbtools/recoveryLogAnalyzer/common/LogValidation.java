package ubadbtools.recoveryLogAnalyzer.common;

import java.util.Collection;
import java.util.HashSet;
import java.util.Set;

import ubadbtools.recoveryLogAnalyzer.logRecords.AbortLogRecord;
import ubadbtools.recoveryLogAnalyzer.exceptions.ValidationFailedException;
import ubadbtools.recoveryLogAnalyzer.logRecords.CommitLogRecord;
import ubadbtools.recoveryLogAnalyzer.logRecords.RecoveryLogRecord;
import ubadbtools.recoveryLogAnalyzer.logRecords.StartCheckpointLogRecord;
import ubadbtools.recoveryLogAnalyzer.logRecords.StartLogRecord;
import ubadbtools.recoveryLogAnalyzer.results.ValidationResult;

/**
 * Algoritmo para validar los registros de un {@link RecoveryLog}.
 * <p>
 * La intenci贸n de representar el algoritmo como un objeto separado es para facilitar el
 * refactoring de la aplicaci贸n 
 * (ver <a href="http://www.refactoring.com/catalog/replaceMethodWithMethodObject.html">Method Object</a>).
 * </p>
 * <p> 
 * Notar que las instancias de esta clase son de un solo uso: 
 * una vez ejecutado {@link #execute()} la instancia ya no sirve para volver a ejecutar el algoritmo.
 * </p>
 */
public class LogValidation {
	/**
	 * M茅todo por conveniencia para ejecutar la validaci贸n sobre un log.
	 * <p>
	 * Es equivalente a: <code>new LogValidation(aLog).execute()</code>.</p>
	 * 
	 * @param aLog log sobre el cual se va a efectuar la validaci贸n.
	 */
	public static ValidationResult executeFor(RecoveryLog aLog) {
		return new LogValidation(aLog).execute();
	}

	private RecoveryLog log;
	private Set<String> started = new HashSet<String>();
	private Set<String> commited = new HashSet<String>();
	private Set<String> aborted = new HashSet<String>();
	private Collection<String> checkpointTransactions;


	/**
	 * Crea una instancia del algoritmo para ser utilizada sobre un log especifico.
	 *
	 * @param log el log a validar.
	 */
	public LogValidation(RecoveryLog aLog) {
		this.log = aLog;
	}

	/**
	 * Ejecuta el algoritmo de validaci贸n.
	 */
	private ValidationResult execute() {
		boolean passed = true;
		String message = "";

		try {
			for (RecoveryLogRecord record : log.getLogRecords()) {
				processStart(record);
				processUpdate(record);
				processCommit(record);
				processAbort(record);
				processStartCheckpoint(record);
				processEndCheckpoint(record);
			}
		} catch (ValidationFailedException e) {
			message = e.getMessage();
			passed = false;
		}
		
		return new ValidationResult(passed, message);
	}

	private void processAbort(RecoveryLogRecord record) throws ValidationFailedException {
		if (!record.isAbort()) return;
		
		failDuplicated(aborted, record);

		if (commited.contains(record.getTransaction())) {
			fail("El registro " + record + " no es v醠ido por que la transacci髇 " + record.getTransaction() + " ya fue comiteada");
		}
		
		aborted.add(record.getTransaction());
	}

	private void failDuplicated(Set<String> aSet, RecoveryLogRecord record) throws ValidationFailedException {
		if (aSet.contains(record.getTransaction())) {
			fail("Puede haber como m醲imo un " + record);			
		}
	}

	private void processStart(RecoveryLogRecord record) throws ValidationFailedException {
		if (!record.isStart()) return;

		failDuplicated(started, record);

		started.add(record.getTransaction());
	}

	private void processUpdate(RecoveryLogRecord record) throws ValidationFailedException {
		if (!record.isUpdate()) return;

		assertTransactionStartedBefore(record);
		if (commited.contains(record.getTransaction())) {
			fail("Dado que " + record.getTransaction() + " hace COMMIT, su 鷏tima acci髇 debe ser " + new CommitLogRecord(record.getTransaction()));
		}
		if (aborted.contains(record.getTransaction())) {
			fail("Dado que " + record.getTransaction() + " hace ABORT, su 鷏tima acci髇 debe ser " + new AbortLogRecord(record.getTransaction()));
		}
	}

	private void assertTransactionStartedBefore(RecoveryLogRecord record) throws ValidationFailedException {
		if (!started.contains(record.getTransaction())) {
			fail("La primera acci髇 de " + record.getTransaction() + " debe ser " + new StartLogRecord(record.getTransaction()));
		}
	}

	private void processCommit(RecoveryLogRecord record) throws ValidationFailedException {
		if (!record.isCommit()) return;

		assertTransactionStartedBefore(record);

		failDuplicated(commited, record);

		if (aborted.contains(record.getTransaction())) {
			fail("El registro " + record + " no es v醠ido por que la transacci髇 " + record.getTransaction() + " ya fue abortada");
		}
		commited.add(record.getTransaction());
	}

	private void processEndCheckpoint(RecoveryLogRecord record) throws ValidationFailedException {
		if (!record.isEndCheckpoint()) return;

		if (checkpointTransactions == null) {
			fail("Si hay un END CHECKPOINT, antes tiene que haber un START CHECKPOINT (sin END CHECKPOINT en el medio)");
		}
		if (!allFinalizedOf(checkpointTransactions)) {
			fail("Al hacer END CHECKPOINT, todas las transacciones activas en ese checkpoint deben haber hecho COMMIT.");
		}
		checkpointTransactions = null;
	}

	private boolean allFinalizedOf(Collection<String> transactions) {
		for (String tx : transactions) {
			if (!commited.contains(tx) && !aborted.contains(tx)) return false;
		}
		return true;
	}

	private void processStartCheckpoint(RecoveryLogRecord record) throws ValidationFailedException {
		if (!record.isStartCheckpoint()) return;
		if (checkpointTransactions != null) {
			fail("No puede haber 2 START CHECKPOINT sin un END CHECKPOINT en el medio.");
		}
		StartCheckpointLogRecord startCheckpointLogRecord = (StartCheckpointLogRecord) record;
		checkpointTransactions = startCheckpointLogRecord.getTransactions();

		if (!started.containsAll(checkpointTransactions) || !allActiveOf(checkpointTransactions)) {
			fail("Al hacer un START CHECKPOINT, la lista de transacciones dada s髄o debe contener a las activas (que hayan tenido un START anteriormente pero no un COMMIT).");
		}
	}
	
	private boolean allActiveOf(Collection<String> transactions) {
		for (String tx : transactions) {
			if (commited.contains(tx) || aborted.contains(tx)) return false;
		}
		
		return true;
	}

	private void fail(String message) throws ValidationFailedException {
		throw new ValidationFailedException(message);
	}
}
