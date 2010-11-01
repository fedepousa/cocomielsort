package ubadbtools.queryOptimizer.optimizer.heuristics;

import ubadbtools.queryOptimizer.common.QueryNode;

/**
 * 
 * Swap de las hojas para poder evitar luego productos cartesianos
 *
 */
public class SwapLeavesHeuristic extends Heuristic
{
	public SwapLeavesHeuristic()
	{
		//Agrego dependencia
		previousHeuristic = new CascadingSelectionsHeuristic();
	}
	
	@Override
	protected void internalApplyHeuristic(QueryNode queryNode)
	{
		System.out.println("SwapLeavesHeuristic");
	}
}
