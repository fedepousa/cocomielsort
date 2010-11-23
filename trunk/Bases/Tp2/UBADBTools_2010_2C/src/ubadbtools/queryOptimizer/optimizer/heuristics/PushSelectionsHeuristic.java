package ubadbtools.queryOptimizer.optimizer.heuristics;

import java.util.List;

import ubadbtools.queryOptimizer.common.QueryNode;
import ubadbtools.queryOptimizer.common.TreeHelper;
import ubadbtools.queryOptimizer.common.conditions.FieldOperand;
import ubadbtools.queryOptimizer.common.conditions.QuerySingleCondition;
import ubadbtools.queryOptimizer.common.relation.RelationNode;
import ubadbtools.queryOptimizer.common.selection.SelectionNode;
import ubadbtools.queryOptimizer.common.QuerySingleInputNode;
import ubadbtools.queryOptimizer.common.QueryDoubleInputNode;

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
	protected void internalApplyHeuristic(QueryNode qN)
	{
		// TODO Auto-generated method stub
		TreeHelper th = new TreeHelper();
		QueryNode qNAux,qNDer,qNCond,qNUlt;
		
		//Calculo todas las condiciones (Como esto lo aplico luego de armar las juntas solo me quedan condiciones normales.
		List<QuerySingleCondition> conds = th.condiciones(qN);
		
		//Elimino las condiciones del arbol.
		if (qN.isProjection()) 
		{
			qNAux = ((QuerySingleInputNode) qN).getLowerNode();
			while (qNAux.isSelection())
				qNAux = ((QuerySingleInputNode) qNAux).getLowerNode();
			((QuerySingleInputNode) qN).linkWith(qNAux);
		}
		else
		{
			while (qN.isSelection())
				qN = ((QuerySingleInputNode) qN).getLowerNode();
		}
		 
		
		if (qN.isProjection())
			qNAux = ((QuerySingleInputNode) qN).getLowerNode();
		else
			qNAux = qN;
		
		//Itero mientras no llegue a la ultima hoja
		while (!qNAux.isRelation()){
			qNDer = ((QueryDoubleInputNode) qNAux).getRightLowerNode();
			qNUlt = qNDer;
			for (QuerySingleCondition actual : conds)
				if ( ((FieldOperand) actual.getLeftOperand()).getField().getRelationAlias() == ((RelationNode) qNDer).getRelationAlias()){
					qNCond = new SelectionNode(actual); 
					((QuerySingleInputNode) qNCond).linkWith(qNUlt);
					((QueryDoubleInputNode) qNAux).linkWith(((QueryDoubleInputNode) qNAux).getLeftLowerNode(),qNCond);
					qNUlt = qNCond;
				}
			qNAux = ((QueryDoubleInputNode) qNAux).getLeftLowerNode();
		}
		
		//Proceso la ultima hoja
		qNDer = qNAux;
		qNUlt = qNDer;
		for (QuerySingleCondition actual : conds)
			if ( ((FieldOperand) actual.getLeftOperand()).getField().getRelationAlias() == ((RelationNode) qNDer).getRelationAlias()){
				qNCond = new SelectionNode(actual); 
				((QuerySingleInputNode) qNCond).linkWith(qNUlt);
				((QueryDoubleInputNode) qNAux).linkWith(((QueryDoubleInputNode) qNAux).getLeftLowerNode(),qNCond);
				qNUlt = qNCond;
			}
		
		System.out.println("PushSelectionsHeuristic");
	}
}
