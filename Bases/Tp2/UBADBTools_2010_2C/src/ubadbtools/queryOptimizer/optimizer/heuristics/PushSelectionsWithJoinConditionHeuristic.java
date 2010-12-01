package ubadbtools.queryOptimizer.optimizer.heuristics;

import java.util.List;

import ubadbtools.queryOptimizer.common.QueryDoubleInputNode;
import ubadbtools.queryOptimizer.common.QueryNode;
import ubadbtools.queryOptimizer.common.QuerySingleInputNode;
import ubadbtools.queryOptimizer.common.TreeHelper;
import ubadbtools.queryOptimizer.common.conditions.FieldOperand;
import ubadbtools.queryOptimizer.common.conditions.QueryCondition;
import ubadbtools.queryOptimizer.common.conditions.QuerySingleCondition;
import ubadbtools.queryOptimizer.common.projection.ProjectionNode;
import ubadbtools.queryOptimizer.common.relation.RelationNode;
import ubadbtools.queryOptimizer.common.selection.SelectionNode;


/**
 * 
 * Bajar las selecciones con condici�n de junta
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
	protected void internalApplyHeuristic(QueryNode qN)
	{
		TreeHelper th = new TreeHelper();
		QueryNode qI;
		String alias1,alias2;
		RelationNode tAux;
		SelectionNode sAux;
		QueryNode padre,hijo;
		QuerySingleCondition aBorrar;
		
		//Guardo las condiciones de junta
		List<QuerySingleCondition> condsJunta = th.condicionesJunta(qN);
		
		//Si no habia condiciones de junta termino
		if (condsJunta.isEmpty()) return;
		
		//Elimino las condiciones de junta
		eliminarCondJunta(qN);
		
		//Iterador para moverme por el arbol
		qI=qN;
		
		//Bajo hasta el primer producto
		while (!qI.isProduct())
			qI = ((QuerySingleInputNode) qI).getLowerNode();
		
		//Itero por el arbol
		while (true)
		{
			//Si llegue a una tabla entonces ya termine
			if (qI.isRelation()) break;
			
			//Guardo la tabla de la derecha del nodo producto
			tAux = (RelationNode) ((QueryDoubleInputNode) qI).getRightLowerNode();
			//Variable Auxiliar para guardar la condicion que procese para posteriormete borrarla
			aBorrar=null;
			
			//Itero por las condiciones que aun no procese
			for(QuerySingleCondition actual : condsJunta)
			{
				//Calculo los 2 alias del operando de la condicion
				alias1=((FieldOperand) (actual.getLeftOperand())).getField().getRelationAlias();
				alias2=((FieldOperand) (actual.getRightOperand())).getField().getRelationAlias();
				//Si algun alias corresponde a la tabla de la derecha tengo que poner la seleccion arriba del nodo producto
				if (alias1==tAux.getRelationAlias() || alias2==tAux.getRelationAlias()){
					//Creo el nuevo nodo producto con la condicion
					sAux = new SelectionNode(actual);
					//Hago los enlaces necesarios
					padre=qI.getUpperNode();
					sAux.linkWith(qI);
					if(padre==null)
					{
						qN=sAux;	
					}
					else
					{
						if(padre.isProduct())
						{
							QueryNode aux;
							aux = ((QueryDoubleInputNode) padre).getRightLowerNode();
							((QueryDoubleInputNode) padre).linkWith(sAux,aux);
						}
						else
						{
							((QuerySingleInputNode) padre).linkWith(sAux);
						}
					}
					//Marco la condicion para ser borrada
					aBorrar = actual;
					//Si logre utilizar alguna condicion entonces salgo del for
					break;
				}
			}
			//Si use alguna condicion entonces tengo que eliminarla de la lista
			if (aBorrar!=null) {
				condsJunta.remove(aBorrar);
			} else {
				//Sigo para el nodo producto de la izquierda
				qI = ((QueryDoubleInputNode) qI).getLeftLowerNode();
				}
			
		}
			
		// TODO Auto-generated method stub
		System.out.println("PushSelectionsWithJoinConditionHeuristic");
	}
	
	//Esta funcion elimina todas las condiciones de junta que hay en el arbol
	public void eliminarCondJunta(QueryNode qN){
		
		//variables auxiliares
		QueryNode padre,hijo;
		QueryCondition caux;
		QuerySingleCondition caux2;
		
		//Si es null, llego a los productos o a una relacion entonces termine
		if (qN==null || qN.isProduct() || qN.isRelation())
			return; 
		
		//Si es una seleccion tengo que ver si es de junta
		if(qN.isSelection())
		{
			caux = ((SelectionNode) qN).getCondition();
			caux2 = (QuerySingleCondition) caux;
			
			//Si es de junta la elimino, sino sigo de largo
			if (caux2.isJoinCondition())
			{
				padre=qN.getUpperNode();
				hijo = ((QuerySingleInputNode) qN).getLowerNode();
				if (padre==null)
				{
					qN=hijo;
					eliminarCondJunta(hijo);
				}
				else
				{
					((QuerySingleInputNode) padre).linkWith(hijo);
					eliminarCondJunta(hijo);
				}
			}
			else
			{
				//Sino es de junta sigo de largo
				hijo = ((QuerySingleInputNode) qN).getLowerNode();
				eliminarCondJunta(hijo);
			}
		}
		else
		{
			//Sino es una seleccion sigo para abajo
			hijo = ((QuerySingleInputNode) qN).getLowerNode();
			eliminarCondJunta(hijo);
		}
		
	}
	
}
