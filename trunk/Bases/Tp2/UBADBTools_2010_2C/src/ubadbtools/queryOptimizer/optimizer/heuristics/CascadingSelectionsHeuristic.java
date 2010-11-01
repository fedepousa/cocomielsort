package ubadbtools.queryOptimizer.optimizer.heuristics;

import java.util.ArrayList;
import java.util.List;

import ubadbtools.queryOptimizer.common.QueryNode;
import ubadbtools.queryOptimizer.common.conditions.QueryAndSingleConditions;
import ubadbtools.queryOptimizer.common.conditions.QueryCondition;
import ubadbtools.queryOptimizer.common.conditions.QuerySingleCondition;
import ubadbtools.queryOptimizer.common.projection.ProjectionNode;
import ubadbtools.queryOptimizer.common.selection.SelectionNode;

/**
 * 
 * Cascada de selecciones
 * 
 */
public class CascadingSelectionsHeuristic extends Heuristic
{
	//No depende de ninguna heurística
	
	@Override
	protected void internalApplyHeuristic(QueryNode queryNode)
	{
		if(queryNode.isSelection()){
			QueryCondition queryCondition = ((SelectionNode) queryNode).getCondition();
			if(queryCondition.getClass().equals(QueryAndSingleConditions.class)){
				List<QuerySingleCondition> lista = ((QueryAndSingleConditions)queryCondition).getSingleConditions();
				
				List<SelectionNode> listaSel = new ArrayList<SelectionNode>();
				for(QuerySingleCondition actual : lista){
					SelectionNode aux = new SelectionNode(actual);
					listaSel.add(aux);
				}
				
				int size = listaSel.size();
				((ProjectionNode) (queryNode.getUpperNode())).linkWith(listaSel.get(0));
				
				for(int i=0;i<size-1;++i){
					listaSel.get(i).linkWith(listaSel.get(i+1));
				}
				listaSel.get(size-1).linkWith(((SelectionNode) queryNode).getLowerNode());
			}
		}else{
			queryNode = ((ProjectionNode) queryNode).getLowerNode();
			this.internalApplyHeuristic(queryNode);
		}
		System.out.println("CascadingSelectionsHeuristic");
	}
}
