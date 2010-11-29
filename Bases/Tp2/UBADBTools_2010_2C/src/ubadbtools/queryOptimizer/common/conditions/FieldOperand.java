package ubadbtools.queryOptimizer.common.conditions;

import ubadbtools.queryOptimizer.common.QueryField;

public class FieldOperand implements QueryConditionOperand
{
	private QueryField field;

	public FieldOperand(QueryField field)
	{
		this.field = field;
	 
	}

	public QueryField getField()
	{
		return field;
	}
	

	
	
	@Override
	public String toString()
	{
		return field.toString();
	}
}
