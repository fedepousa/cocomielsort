package ubadbtools.queryOptimizer.optimizer.heuristics;

import java.util.ArrayList;
import java.util.List;

import ubadbtools.queryOptimizer.common.QueryNode;
import ubadbtools.queryOptimizer.common.QuerySingleInputNode;
import ubadbtools.queryOptimizer.common.conditions.FieldOperand;
import ubadbtools.queryOptimizer.common.conditions.QueryAndSingleConditions;
import ubadbtools.queryOptimizer.common.conditions.QueryCondition;
import ubadbtools.queryOptimizer.common.conditions.QuerySingleCondition;
import ubadbtools.queryOptimizer.common.product.ProductNode;
import ubadbtools.queryOptimizer.common.projection.ProjectionNode;
import ubadbtools.queryOptimizer.common.relation.RelationNode;
import ubadbtools.queryOptimizer.common.selection.SelectionNode;
import ubadbtools.queryOptimizer.common.TreeHelper;
import ubadbtools.queryOptimizer.gui.QueryNodeGuiMapper;

/**
 * 
 * Swap de las hojas para poder evitar luego productos cartesianos
 *
 */
public class SwapLeavesHeuristic extends Heuristic
{
	public SwapLeavesHeuristic()
	{
		//Agrego dependencia
		previousHeuristic = new CascadingSelectionsHeuristic();
	}
	
	@Override
	protected void internalApplyHeuristic(QueryNode qN)
	{
		TreeHelper th = new TreeHelper();
		
		//Flag para marcar si pude agregar un nuevo nodo
		boolean agregue;
		//Variables Auxiliares
		RelationNode t1,t2;
		String s1,s2;
		ProductNode nuevaBase, pAux;
		//la variable nuevaBase se usa para armar desde cero toda la parte inferior del arbol correspondiente a los producton cartesianos y las tablas.
		nuevaBase =null;
		
		//Calculo las condiciones de junta
		List<QuerySingleCondition> condsJunta = th.condicionesJunta(qN);
		
		//En esta lista guardo las tablas que ya fueron procedadas (solo el alias)
		List<String> procesadas = new ArrayList<String>();
		
		//Guardo en una lista las tablas por procesar
		List<RelationNode> tablasFaltantes = th.tablas(qN);
		
		//La idea del algorimto es armar la base del arbol utilizando las condiciones de junta y luego completar con las tablas que no esten relacionadas a ninguna condicion de junta
		
		//Si hay alguna condicion de junta?
		if (!condsJunta.isEmpty()){
			//Creo el primer producto utilizando la primer condicion de junta
			nuevaBase = new ProductNode();
			//Obtengo los aliases y las tablas de los 2 operadores de la condiciones
			s1=((FieldOperand) (condsJunta.get(0).getLeftOperand())).getField().getRelationAlias();
			t1= th.alias2tabla(qN, s1);
			s2=((FieldOperand) (condsJunta.get(0).getRightOperand())).getField().getRelationAlias();
			t2= th.alias2tabla(qN, s2);
			//Linkeo las 2 tablas con el nuevo nodo de producto
			nuevaBase.linkWith(t1, t2);
			//Elimino la condicion
			condsJunta.remove(0);
			//Remuevo las tablas que fueron procesadas
			tablasFaltantes.remove(t1);
			tablasFaltantes.remove(t2);
			//Agrego los aliases de las tablas procesadas
			procesadas.add(s1);
			procesadas.add(s2);
		}
		
		//Sigo procesando el resto de las condiciones
		while(!condsJunta.isEmpty()){
			//Uso este flag para indicar si agregue un nodo o no
			agregue=false;
			//Busco entre las condiciones restantes alguna que pueda unir con lo que ya calcule
			for(QuerySingleCondition actual : condsJunta){
				//Calculo los aliases de la condicion
				s1=((FieldOperand) (actual.getLeftOperand())).getField().getRelationAlias();
				s2=((FieldOperand) (actual.getRightOperand())).getField().getRelationAlias();
				if(procesadas.contains(s1) && procesadas.contains(s2)){
					condsJunta.remove(actual);
					agregue = true;
					break;
				}
				//Me fijo si puedo si una tabla comparte atributos con lo procesado
				if (procesadas.contains(s1)){
					//En caso de que pase creo un nodo nuevo con la tabla y lo uno a lo calculado
					pAux = new ProductNode();
					t2= th.alias2tabla(qN, s2);
					pAux.linkWith(nuevaBase,t2);
					nuevaBase = pAux;
					procesadas.add(s2);
					tablasFaltantes.remove(t2);
					condsJunta.remove(actual);
					agregue=true;
					break;
				}
				
				//Me fijo si la otra tabla me sirve
				if (procesadas.contains(s2)){
					//En caso de que pase creo un nodo nuevo con la tabla y lo uno a lo calculado
					pAux = new ProductNode();
					t1= th.alias2tabla(qN, s1);
					pAux.linkWith(nuevaBase,t1);
					nuevaBase = pAux;
					procesadas.add(s1);
					tablasFaltantes.remove(t1);
					condsJunta.remove(actual);
					agregue=true;
					break;
				}
			}
			//Chequeo si no pude agregar ninguna condicion de junta
			if (!agregue){
				//Agrego un nuevo nodo producto con una tabla alguna condicion de junta pendiente
				pAux = new ProductNode();
				s1=((FieldOperand) (condsJunta.get(0).getLeftOperand())).getField().getRelationAlias();
				t1= th.alias2tabla(qN, s1);
				pAux.linkWith(nuevaBase,t1);
				nuevaBase = pAux;
				procesadas.add(s1);
				tablasFaltantes.remove(t1);
			}
		}
		
		//Si no habia nada que juntar salgo
		if (nuevaBase == null) return;
		
		//Proceso las tablas que no tenian ninguna condicion de junta
		if (!tablasFaltantes.isEmpty())	
			for (RelationNode actual : tablasFaltantes){
				pAux = new ProductNode();
				pAux.linkWith(nuevaBase,actual);
				nuevaBase = pAux;
			}
		
		
		
		
		//Busco la base del arbol y la modifico en caso de ser necesario
		
		//Si no habia ningun seleccion salgo sin modificar nada
		if (qN.isRelation() || qN.isProduct()) return;
		
		//Si es una projeccion bajo un nodo
		if (qN.isProjection()){
			qN = ((ProjectionNode) qN).getLowerNode();
		}
		
		//Si luego de la projeccion no hay una seleccion salgo sin tocar nada
		if (!qN.isSelection()) return;
		
		//Si llegue al bloque de las seleccion bajo hasta la ultima
		while (qN.isSelection()){
			//Vay al final de las selecciones
			qN = ((QuerySingleInputNode) qN).getLowerNode();
		}
		
		//Modifico la base del arbol con los nuevos productos
		qN = qN.getUpperNode();
		((QuerySingleInputNode) qN).linkWith(nuevaBase);
				
		System.out.println("SwapLeavesHeuristic");
	}
}
