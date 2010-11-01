package ubadbtools.queryOptimizer.optimizer.heuristics;

import ubadbtools.queryOptimizer.common.QueryNode;


/**
 * 
 * Bajar las selecciones con condición de junta
 *
 */
public class PushSelectionsWithJoinConditionHeuristic extends Heuristic
{
	public PushSelectionsWithJoinConditionHeuristic()
	{
		//Agrego dependencia
		previousHeuristic = new SwapLeavesHeuristic();
	}
	
	@Override
	protected void internalApplyHeuristic(QueryNode queryNode)
	{
		// TODO Auto-generated method stub
		System.out.println("PushSelectionsWithJoinConditionHeuristic");
	}
}
