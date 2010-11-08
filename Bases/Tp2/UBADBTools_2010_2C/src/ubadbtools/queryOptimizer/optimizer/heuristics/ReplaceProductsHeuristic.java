package ubadbtools.queryOptimizer.optimizer.heuristics;

import ubadbtools.queryOptimizer.common.QueryDoubleInputNode;
import ubadbtools.queryOptimizer.common.QueryNode;
import ubadbtools.queryOptimizer.common.QuerySingleInputNode;
import ubadbtools.queryOptimizer.common.conditions.QueryCondition;
import ubadbtools.queryOptimizer.common.join.JoinNode;
import ubadbtools.queryOptimizer.common.product.ProductNode;
import ubadbtools.queryOptimizer.common.selection.SelectionNode;

/**
 * 
 * Reemplazar selecci�n con condici�n de junta + producto cartesiano por join o natural join
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
	protected void internalApplyHeuristic(QueryNode qN)
	{
		//Variables auxiliares
		QueryNode qI,padre,abuelo;
		QueryCondition cond;
		JoinNode jNode;
		
		//Puntero para recorrer el arbol
		qI = qN;
		
		//Bajo hasta el primer producto si es que existe
		while(qI.isProjection() || qI.isSelection()){
				qI = ((QuerySingleInputNode) qI).getLowerNode();
		}
		
		//Itero mientras mientras hayan productos
		while (!qI.isRelation())
		{
			//Calculo el padre
			padre=qI.getUpperNode();
			
			//Verifico que exista el padre y que sea una seleccion
			if(padre!=null && padre.isSelection())
			{
				//Obtengo la condicion
				cond = ((SelectionNode) padre).getCondition();
				//Me fijo si la condicion es de junta
				if (cond.isJoinCondition()){
					//TODO: Consutar bien el tema del join natural y el comun
					//Creo un nuevo nodo de junta
					jNode = new JoinNode(cond);
					//Lo enlazo con los hijos correspondientes
					jNode.linkWith(((ProductNode) qI).getLeftLowerNode(),((ProductNode) qI).getRightLowerNode());
					//Obtengo el abuelo
					abuelo = padre.getUpperNode();
					if (abuelo==null)
					{
						//Si el abuelo era null, el arbol comienza con la junta
						qN=jNode;
					}
					else
					{
						//Si el abuelo no era null entonces tengo que enlazarlo a nuevo nodo de junta
						if (abuelo.isProduct() || abuelo.isJoin() || abuelo.isNaturalJoin())
						{
							//Caso si el abuelo era un nodo con dos hijos
							QueryNode otro = ((QueryDoubleInputNode) abuelo).getRightLowerNode();
							((QueryDoubleInputNode) abuelo).linkWith(jNode, otro);
						}
						else
						{
							//Caso en que el abuelo sea un nodo con un hijo
							((QuerySingleInputNode) abuelo).linkWith(jNode);
						}
					}
					//Ubico el puntero en el nuevo nodo
					qI=jNode;
				}
			}
			//Avanzo el puntero 
			qI = ((QueryDoubleInputNode) qI).getLeftLowerNode();
			//Si el proximo puntero es una seleccion lo paso de largo
			if (qI.isSelection()) 
				qI = ((QuerySingleInputNode) qI).getLowerNode();
		}
		
		// TODO Auto-generated method stub
		System.out.println("ReplaceProductsHeuristic");
	}
}
