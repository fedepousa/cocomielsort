package ubadbtools.recoveryLogAnalyzer.logRecords;

public class AbortLogRecord extends RecoveryLogRecord {
    public AbortLogRecord(String transaction) {
        this.transaction = transaction;
    }
    
    @Override
    public String toString(){
    		return "<ABORT " + transaction + ">";
	}
    
    @Override
    public boolean isAbort() {
    	return true;
    }
}
