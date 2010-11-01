package ubadbtools.scheduleAnalyzer.common.results;

import java.util.List;

public class SerializabilityResult
{
	private boolean isSerializable;
	private List<List<String>> possibleExecutions; //Si es serializable: Lista de posibles ejecuciones
	private List<String> cycle;	//Si no lo es: Lista de transacciones que forman un ciclo (si hay más, que devuelva alguno). El último arco que cierra el ciclo es implícito
	private String message; // Cualquier mensaje adicional

	public SerializabilityResult(boolean isSerializable,
			List<List<String>> possibleExecutions, List<String> cycle, String message)
	{
		this.isSerializable = isSerializable;
		this.possibleExecutions = possibleExecutions;
		this.cycle = cycle;
		this.message = message;
	}

	public boolean isSerializable()
	{
		return isSerializable;
	}

	public List<List<String>> getPossibleExecutions()
	{
		return possibleExecutions;
	}

	public List<String> getCycle()
	{
		return cycle;
	}

	public String getMessage()
	{
		return message;
	}
}
