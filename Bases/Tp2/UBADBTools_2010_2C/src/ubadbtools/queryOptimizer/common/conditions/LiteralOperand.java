package ubadbtools.queryOptimizer.common.conditions;

public class LiteralOperand implements QueryConditionOperand
{
	private String value;

	public LiteralOperand(String value)
	{
		this.value = value;
	}

	public String getValue()
	{
		return value;
	}
	
	
	public boolean isQueryField(){
		return false;
	}
	
	public boolean isQueryLiteral(){
		
		return true;
	}
	
	
	@Override
	public String toString()
	{
		return value;
	}
}
