package ubadbtools.queryOptimizer.optimizer.heuristics;

import ubadbtools.queryOptimizer.common.QueryNode;

public abstract class Heuristic
{
	protected Heuristic previousHeuristic;
	
	public void applyHeuristic(QueryNode queryNode)
	{
		if(previousHeuristic != null)
		{
			previousHeuristic.applyHeuristic(queryNode);
		}
		
		internalApplyHeuristic(queryNode);
	}

	protected abstract void internalApplyHeuristic(QueryNode queryNode);
}
