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
		
		boolean salir;
		RelationNode t1,t2;
		String s1,s2;
		ProductNode nuevaBase, pAux;
		nuevaBase =null;
		
		//Calculo las tablas con las relaciones y las cond de junta
		List<QuerySingleCondition> condsJunta = th.condicionesJunta(qN);
		
		//En esta lista guardo las tablas que ya fueron procedadas (solo el alias)
		List<String> procesadas = new ArrayList<String>();
		
		//Por procesar
		List<RelationNode> tablasFaltantes = th.tablas(qN);
		
		if (!condsJunta.isEmpty()){
			//Creo el primer producto utilizando la primer condicion de junta
			nuevaBase = new ProductNode();
			s1=((FieldOperand) (condsJunta.get(0).getLeftOperand())).getField().getRelationAlias();
			t1= th.alias2tabla(qN, s1);
			s2=((FieldOperand) (condsJunta.get(0).getRightOperand())).getField().getRelationAlias();
			t2= th.alias2tabla(qN, s2);
			nuevaBase.linkWith(t1, t2);
			condsJunta.remove(0);
			tablasFaltantes.remove(t1);
			tablasFaltantes.remove(t2);
			procesadas.add(s1);
			procesadas.add(s2);
		}
		
		while(!condsJunta.isEmpty()){
			//Uso este flag para indicar si agregue un nodo o no
			salir=false;
			//Busco entre las condiciones restantes alguna que pueda unir con lo que ya calcule
			for(QuerySingleCondition actual : condsJunta){
				s1=((FieldOperand) (actual.getLeftOperand())).getField().getRelationAlias();
				s2=((FieldOperand) (actual.getRightOperand())).getField().getRelationAlias();
				if (procesadas.contains(s1)){
					pAux = new ProductNode();
					t2= th.alias2tabla(qN, s2);
					pAux.linkWith(nuevaBase,t2);
					nuevaBase = pAux;
					procesadas.add(s2);
					tablasFaltantes.remove(t2);
					condsJunta.remove(actual);
					salir=true;
				}
				
				if (salir) break;
				
				if (procesadas.contains(s2)){
					pAux = new ProductNode();
					t1= th.alias2tabla(qN, s1);
					pAux.linkWith(nuevaBase,t1);
					nuevaBase = pAux;
					procesadas.add(s1);
					tablasFaltantes.remove(t1);
					condsJunta.remove(actual);
					salir=true;
				}
				
				if (salir) break;
			}
			if (!salir){
				pAux = new ProductNode();
				s1=((FieldOperand) (condsJunta.get(0).getLeftOperand())).getField().getRelationAlias();
				t1= th.alias2tabla(qN, s1);
				pAux.linkWith(nuevaBase,t1);
				nuevaBase = pAux;
				procesadas.add(s1);
			}
		}
		
		//Proceso las tablas que no tenian ninguna condicion de junta
		if (!tablasFaltantes.isEmpty())
			for (RelationNode actual : tablasFaltantes){
				pAux = new ProductNode();
				pAux.linkWith(nuevaBase,actual);
				nuevaBase = pAux;
			}
		
		//Busco la base del arbol y la modifico en caso de ser necesario
		if (qN.isRelation() || qN.isProduct()) return;
		
		if (qN.isProjection()){
			qN = ((ProjectionNode) qN).getLowerNode();
		}
		
		if (!qN.isSelection()) return;
		
		while (qN.isSelection()){
			//Vay al final de las selecciones
			qN = ((QuerySingleInputNode) qN).getLowerNode();
		}
		
		qN = qN.getUpperNode();
		((QuerySingleInputNode) qN).linkWith(nuevaBase);
				
		System.out.println("SwapLeavesHeuristic");
	}
}
