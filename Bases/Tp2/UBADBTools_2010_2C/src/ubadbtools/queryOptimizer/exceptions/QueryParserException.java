package ubadbtools.queryOptimizer.exceptions;

@SuppressWarnings("serial")
public class QueryParserException extends Exception
{
	public QueryParserException(String message)
	{
		super(message);
	}

	public QueryParserException(String message, Throwable t)
	{
		super(message, t);
	}
}
