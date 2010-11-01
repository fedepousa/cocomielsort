package ubadbtools.queryOptimizer.optimizer.heuristics;

import ubadbtools.queryOptimizer.common.QueryNode;

/**
 *
 * Bajar selecciones
 *
 */
public class PushSelectionsHeuristic extends Heuristic
{
	public PushSelectionsHeuristic()
	{
		//Agrego dependencia
		previousHeuristic = new ReplaceProductsHeuristic();
	}
	
	@Override
	protected void internalApplyHeuristic(QueryNode queryNode)
	{
		// TODO Auto-generated method stub
		
		System.out.println("PushSelectionsHeuristic");
	}
}
