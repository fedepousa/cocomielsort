package ubadbtools.queryOptimizer.common.selection;

import ubadbtools.queryOptimizer.common.QuerySingleInputNode;
import ubadbtools.queryOptimizer.common.conditions.QueryCondition;

public class SelectionNode extends QuerySingleInputNode
{
	private QueryCondition condition;

	public SelectionNode(QueryCondition condition)
	{
		this.condition = condition;
	}

	public QueryCondition getCondition()
	{
		return condition;
	}
}
