package ubadbtools.recoveryLogAnalyzer.exceptions;

import ubadbtools.recoveryLogAnalyzer.common.LogValidation;

/**
 * Excepcion de uso interno en {@link LogValidation}, para poder refactorizar mejor
 * las validaciones y cortar la ejecución al primer error.
 */
public class ValidationFailedException extends Exception {
	private static final long serialVersionUID = -2893398590474799435L;

	/**
	 * @param message mensaje de error describiendo el problema por el cual falló la validación.
	 */
	public ValidationFailedException(String message) {
		super(message);
	}
}
