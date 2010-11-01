package ubadbtools.recoveryLogAnalyzer.results;

/**
 * Resultado de aplicar el algortimo de validación sobre un log.
 */
public class ValidationResult {
	private boolean validationPassed;
	private String validationMessage;

	public ValidationResult(boolean validationPassed, String message) {
		this.validationPassed = validationPassed;
		this.validationMessage = message;
	}

	/**
	 * 
	 * @return true si el log validado es correcto.
	 */
	public boolean isValidationPassed() {
		return this.validationPassed;
	}

	/**
	 * @return el mensaje con el problema de validación (o un String vacio si no hay problemas).
	 */
	public String getValidationMessage() {
		return validationMessage;
	}
}
