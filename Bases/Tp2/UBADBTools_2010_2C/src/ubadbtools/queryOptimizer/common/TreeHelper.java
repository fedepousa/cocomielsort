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
	//Funcion para listar todo los aliases de las tablas
	public List<String> aliases(QueryNode qN)
	{
		List<String> res = new ArrayList<String>();
		List<RelationNode> aux = tablas(qN);
		//Recorro los nodos de relacion y guardo sus alias
		for(RelationNode actual : aux)
			res.add(actual.getRelationAlias());
		return res;
		
	}
	
	//Esta funcion devuelve una lista con todas las condiciones de junta
	public List<QuerySingleCondition> condicionesJunta(QueryNode qN){
		List<QuerySingleCondition> aux;
		List<QuerySingleCondition> res = new ArrayList<QuerySingleCondition>();
		//Calculo todas las condiciones
		aux = condiciones(qN);
		//Filtro por aquellas que son de junta
		for (QuerySingleCondition actual : aux)
			if (actual.isJoinCondition())
				res.add(actual);
		return res;
	}
	
	//Esta funcion arma una lista con todas las condiciones
	public List<QuerySingleCondition> condiciones(QueryNode qN){
		QueryCondition caux;
		QuerySingleCondition caux2;
		List<QuerySingleCondition> aux = new ArrayList<QuerySingleCondition>();
		
		//Si el nodo es una projeccion lo paso de largo
		if (qN.isProjection()){
			return condiciones(((QuerySingleInputNode) qN).getLowerNode());
		}
		
		//Si es una seleccion, agrego la condicion y sigo
		if (qN.isSelection()){
			caux = ((SelectionNode) qN).getCondition();
			caux2 = (QuerySingleCondition) caux;
			aux.add(caux2);
			aux.addAll(condiciones(((QuerySingleInputNode) qN).getLowerNode()));
			return aux;
		}
		
		//Si es un producto, calculo las seleccion de sus 2 ramas
		if (qN.isProduct()){
			aux.addAll(condiciones(((QueryDoubleInputNode) qN).getLeftLowerNode()));
			aux.addAll(condiciones(((QueryDoubleInputNode) qN).getRightLowerNode()));
			return aux;
		}
		
		//Si es una relacion termino.
		if (qN.isRelation()){
			return aux;
		}
		
		return aux;
	}
	
	
	//Dado un alias esta funcion me devuelve el nodo correspondiente a la tabla para ese alias
	public RelationNode alias2tabla(QueryNode qN, String alias)
	{
		List<RelationNode> aux;
		//Calculo una lista con todas las tablas
		aux = tablas(qN);
		//Busco en la lista la tabla con el alias en cuestion.
		for(RelationNode actual: aux){
			if (actual.getRelationAlias()==alias) 
				return actual;
		}
		return null;
	}
	
	//Esta funcion retorna una lista con los Nodos correspondientes a las relaciones
	public List<RelationNode> tablas(QueryNode qN)
	{
		List<RelationNode> aux = new ArrayList<RelationNode>();
		//Si es una projeccion paso de largo
		if (qN.isProjection()){
			return tablas(((QuerySingleInputNode) qN).getLowerNode());
		}
		
		//Si es una seleccion sigo
		if (qN.isSelection()){
			return tablas(((QuerySingleInputNode) qN).getLowerNode());
		}
		
		//Si es un producto agrego el nodo derecho y sigo por la izquierda
		if (qN.isProduct()){
			aux.addAll(tablas(((QueryDoubleInputNode) qN).getLeftLowerNode()));
			aux.add((RelationNode) ((QueryDoubleInputNode) qN).getRightLowerNode());
			return aux;
		}
		
		//Si es una relacion la agrego
		if (qN.isRelation()){
			aux.add((RelationNode) qN);
			return aux;
		}
		return aux;
	}
}
