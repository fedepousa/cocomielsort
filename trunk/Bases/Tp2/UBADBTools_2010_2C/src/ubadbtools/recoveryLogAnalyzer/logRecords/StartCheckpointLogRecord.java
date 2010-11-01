package ubadbtools.recoveryLogAnalyzer.logRecords;

import java.util.Collection;
import java.util.Iterator;

public class StartCheckpointLogRecord extends RecoveryLogRecord {
	private Collection<String> transactions;

	public StartCheckpointLogRecord(Collection<String> transactions) {
		this.transactions = transactions;
	}

	@Override
	public String toString() {
		return "<START CKPT(" + join(transactions, ",") + ")>";
	}

	public Collection<String> getTransactions() {
		return transactions;
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

	@Override
	public boolean isStartCheckpoint() {
		return true;
	}
}
