package ubadbtools.queryOptimizer.common.conditions;

public class QuerySingleCondition implements QueryCondition
{
	private QueryConditionOperand leftOperand;
	private QueryConditionOperator operator;
	private QueryConditionOperand rightOperand;
	
	public QuerySingleCondition(QueryConditionOperand leftOperand,QueryConditionOperator operator, QueryConditionOperand rightOperand)
	{
		this.leftOperand = leftOperand;
		this.operator = operator;
		this.rightOperand = rightOperand;
	}

	public QueryConditionOperand getLeftOperand()
	{
		return leftOperand;
	}

	public QueryConditionOperator getOperator()
	{
		return operator;
	}

	public QueryConditionOperand getRightOperand()
	{
		return rightOperand;
	}

	@Override
	public String toString()
	{
		return leftOperand.toString() + " " + operator.toString() + " " + rightOperand.toString();
	}
	
	@Override
	public boolean isJoinCondition()
	{
		//Es una condición de junta si ambos operandos involucran a campos de tablas (no literales)
		return leftOperand.getClass().equals(FieldOperand.class) && rightOperand.getClass().equals(FieldOperand.class);
	}
}
