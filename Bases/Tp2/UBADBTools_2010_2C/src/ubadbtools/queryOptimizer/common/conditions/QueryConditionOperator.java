package ubadbtools.queryOptimizer.common.conditions;

public enum QueryConditionOperator
{
	EQUAL("="),
	NOT_EQUAL("!="),
	LESS_THAN_OR_EQUAL("<="),
	GREATER_THAN_OR_EQUAL(">="),
	GREATER_THAN(">"),
	LESS_THAN("<");
	
	private String value;
	
	private QueryConditionOperator(String value)
	{
		this.value = value;
	}
	
	@Override
	public String toString()
	{
		return value;
	}
}
