package ubadbtools.queryOptimizer.optimizer.heuristics;

import ubadbtools.queryOptimizer.common.QueryNode;

/**
 * 
 * Bajar proyecciones (OJO, no hasta las hojas sino hasta la última selección -en caso de que la hubiera, sino sí hasta la hoja-)
 *
 */
public class PushProjectionsHeuristic extends Heuristic
{
	public PushProjectionsHeuristic()
	{
		//Agrego dependencia
		previousHeuristic = new PushSelectionsHeuristic();
	}
	
	@Override
	protected void internalApplyHeuristic(QueryNode queryNode)
	{
		// TODO Auto-generated method stub
		System.out.println("PushProjectionsHeuristic");
	}
}
