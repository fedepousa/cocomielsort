package ubadbtools.queryOptimizer.common;

import java.util.ArrayList;
import java.util.List;

import ubadbtools.queryOptimizer.common.conditions.FieldOperand;
import ubadbtools.queryOptimizer.common.conditions.QueryCondition;
import ubadbtools.queryOptimizer.common.conditions.QuerySingleCondition;
import ubadbtools.queryOptimizer.common.relation.RelationNode;
//import ubadbtools.queryOptimizer.common.selection.SelectionNode;
//import ubadbtools.queryOptimizer.common.product.ProductNode;
//import ubadbtools.queryOptimizer.common.projection.ProjectionNode;
import ubadbtools.queryOptimizer.common.selection.SelectionNode;

public class TreeHelper
{
	
	public List<String> aliases(QueryNode qN)
	{
		List<String> res = new ArrayList<String>();
		List<RelationNode> aux = tablas(qN);
		for(RelationNode actual : aux)
			res.add(actual.getRelationAlias());
		return res;
		
	}
	
	//Esta funcion devuelve una lista con todas las condiciones de junta
	public List<QuerySingleCondition> condicionesJunta(QueryNode qN){
		List<QuerySingleCondition> aux;
		List<QuerySingleCondition> res = new ArrayList<QuerySingleCondition>();
		
		aux = condiciones(qN);
		for (QuerySingleCondition actual : aux){
			if (actual.isJoinCondition())
			{
				res.add(actual);
			}
		}
		return res;
	}
	
	//Esta funcion arma una lista con todas las condiciones
	public List<QuerySingleCondition> condiciones(QueryNode qN){
		QueryCondition caux;
		QuerySingleCondition caux2;
		List<QuerySingleCondition> aux = new ArrayList<QuerySingleCondition>();
		
		if (qN.isProjection()){
			return condiciones(((QuerySingleInputNode) qN).getLowerNode());
		}
		
		if (qN.isSelection()){
			caux = ((SelectionNode) qN).getCondition();
			caux2 = (QuerySingleCondition) caux;
			aux.add(caux2);
			aux.addAll(condiciones(((QuerySingleInputNode) qN).getLowerNode()));
			return aux;
		}
		
		if (qN.isProduct()){
			aux.addAll(condiciones(((QueryDoubleInputNode) qN).getLeftLowerNode()));
			aux.addAll(condiciones(((QueryDoubleInputNode) qN).getRightLowerNode()));
			return aux;
		}
		
		if (qN.isRelation()){
			return aux;
		}
		
		return aux;
	}
	
	
	//Esta funcion dado un alias me devuelve el nodo correspondiente a la tabla de ese alias
	public RelationNode alias2tabla(QueryNode qN, String alias)
	{
		List<RelationNode> aux;
		aux = tablas(qN);
		for(RelationNode actual: aux){
			if (actual.getRelationAlias()==alias) 
				return actual;
		}
		return null;
	}
	
	//Esta funcion retorna una lista con los Nodos de las Relaciones
	public List<RelationNode> tablas(QueryNode qN)
	{
		List<RelationNode> aux = new ArrayList<RelationNode>();
		if (qN.isProjection()){
			return tablas(((QuerySingleInputNode) qN).getLowerNode());
		}
		
		if (qN.isSelection()){
			return tablas(((QuerySingleInputNode) qN).getLowerNode());
		}
		
		if (qN.isProduct()){
			aux.addAll(tablas(((QueryDoubleInputNode) qN).getLeftLowerNode()));
			aux.add((RelationNode) ((QueryDoubleInputNode) qN).getRightLowerNode());
			return aux;
		}
		
		if (qN.isRelation()){
			aux.add((RelationNode) qN);
			return aux;
		}
		return aux;
	}
}
