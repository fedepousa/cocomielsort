package ubadbtools.recoveryLogAnalyzer.logRecords;

public class EndCheckpointLogRecord extends RecoveryLogRecord {
	@Override
    public String toString(){
        return "<END CKPT>";
    }

	@Override
	public boolean isEndCheckpoint() {
		return true;
	}
}
