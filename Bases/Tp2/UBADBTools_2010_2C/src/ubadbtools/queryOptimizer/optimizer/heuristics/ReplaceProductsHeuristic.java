package ubadbtools.queryOptimizer.optimizer.heuristics;

import ubadbtools.queryOptimizer.common.QueryNode;

/**
 * 
 * Reemplazar selección con condición de junta + producto cartesiano por join o natural join
 *
 */
public class ReplaceProductsHeuristic extends Heuristic
{
	public ReplaceProductsHeuristic()
	{
		//Agrego dependencia
		previousHeuristic = new PushSelectionsWithJoinConditionHeuristic();
	}
	
	@Override
	protected void internalApplyHeuristic(QueryNode queryNode)
	{
		// TODO Auto-generated method stub
		System.out.println("ReplaceProductsHeuristic");
	}
}
