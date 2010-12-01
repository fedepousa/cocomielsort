package ubadbtools.queryOptimizer.common.join;

import ubadbtools.queryOptimizer.common.QueryDoubleInputNode;
import ubadbtools.queryOptimizer.common.conditions.QueryCondition;


public class JoinNode extends QueryDoubleInputNode
{
	private QueryCondition condition;
	
	public JoinNode(QueryCondition condition)
	{
		this.condition = condition;
	}
	
	public QueryCondition getCondition()
	{
		return condition;
	}
	
	public void setCondition(QueryCondition q)
	{
		condition = q;
	}
}
