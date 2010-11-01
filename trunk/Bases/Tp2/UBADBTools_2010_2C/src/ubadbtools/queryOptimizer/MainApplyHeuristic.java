package ubadbtools.queryOptimizer;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

import ubadbtools.queryOptimizer.common.QueryField;
import ubadbtools.queryOptimizer.common.QueryNode;
import ubadbtools.queryOptimizer.common.QuerySingleInputNode;
import ubadbtools.queryOptimizer.common.conditions.FieldOperand;
import ubadbtools.queryOptimizer.common.conditions.LiteralOperand;
import ubadbtools.queryOptimizer.common.conditions.QueryAndSingleConditions;
import ubadbtools.queryOptimizer.common.conditions.QueryCondition;
import ubadbtools.queryOptimizer.common.conditions.QueryConditionOperand;
import ubadbtools.queryOptimizer.common.conditions.QueryConditionOperator;
import ubadbtools.queryOptimizer.common.conditions.QuerySingleCondition;
import ubadbtools.queryOptimizer.common.product.ProductNode;
import ubadbtools.queryOptimizer.common.projection.ProjectionNode;
import ubadbtools.queryOptimizer.common.relation.RelationNode;
import ubadbtools.queryOptimizer.common.selection.SelectionNode;
import ubadbtools.queryOptimizer.gui.QueryNodeGuiMapper;
import ubadbtools.queryOptimizer.optimizer.heuristics.Heuristic;
import ubadbtools.queryOptimizer.optimizer.heuristics.PushSelectionsHeuristic;

public class MainApplyHeuristic
{
	public static void main(String[] args)
	{
		QueryNode tree1 = createTree2();
		
		//Mostrar árbol original
		displayTree(tree1, "Original");
		
		Heuristic heuristic = new PushSelectionsHeuristic();
		
		heuristic.applyHeuristic(tree1);
		System.out.println(tree1.isProjection());
		System.out.println(tree1.isSelection());
		System.out.println(((ProjectionNode) tree1).getLowerNode().isProjection());
		System.out.println(((ProjectionNode) tree1).getLowerNode().isSelection());
		
		//Mostrar árbol cambiado
		displayTree(tree1, "Con heurísticas");
	}
	
	private static ProjectionNode createTree()
	{
		//A
		RelationNode relA = new RelationNode("Auto","A");
		
		//B
		RelationNode relB = new RelationNode("Bote","B");
		
		//A x B
		ProductNode prod = new ProductNode();
		prod.linkWith(relA,relB);
		
		//Sel(A x B)
		
		QueryConditionOperand selectAOperand1 = new FieldOperand(new QueryField("A","a1"));
		QueryConditionOperand selectAOperand2 = new LiteralOperand("1");
		QueryCondition selectACondition = new QuerySingleCondition(selectAOperand1,QueryConditionOperator.EQUAL,selectAOperand2);
		QuerySingleInputNode selectAxB = new SelectionNode(selectACondition);
		selectAxB.linkWith(prod);
		
		//Proj(Sel(A x B))
		List<QueryField> projectedFields = Collections.singletonList(new QueryField("A","a2"));
		ProjectionNode project = new ProjectionNode(projectedFields);
		project.linkWith(selectAxB);
		return project;
		/*
		//A
		RelationNode relA = new RelationNode("Auto","A");
		
		//B
		RelationNode relB = new RelationNode("Bote","B");
		
		//Sel(A)
		QueryConditionOperand selectAOperand1 = new FieldOperand(new QueryField("A","a1"));
		QueryConditionOperand selectAOperand2 = new LiteralOperand("1");
		QueryCondition selectACondition = new QuerySingleCondition(selectAOperand1,QueryConditionOperator.EQUAL,selectAOperand2);
		QuerySingleInputNode selectA = new SelectionNode(selectACondition);
		selectA.linkWith(relA);
		
		//(Sel A) x B
		ProductNode prod = new ProductNode();
		prod.linkWith(selectA,relB);
		
		//Proj(Sel(A) x B)
		List<QueryField> projectedFields = Collections.singletonList(new QueryField("A","a2"));
		ProjectionNode project = new ProjectionNode(projectedFields);
		project.linkWith(prod);
		return project;
		*/
	}
	
	private static QueryNode createTree2(){
		//A
		RelationNode relA = new RelationNode("Auto","A");
		
		//B
		RelationNode relB = new RelationNode("Bote","B");
		
		//A x B
		ProductNode prod = new ProductNode();
		prod.linkWith(relA,relB);
		
		//Sel(A x B)
		
		QueryConditionOperand selectAOperand1 = new FieldOperand(new QueryField("A","a1"));
		QueryConditionOperand selectAOperand2 = new LiteralOperand("1");
		QuerySingleCondition query1 = new QuerySingleCondition(selectAOperand1,QueryConditionOperator.EQUAL,selectAOperand2);
		
		QueryConditionOperand selectAOperand21 = new FieldOperand(new QueryField("A","a2"));
		QueryConditionOperand selectAOperand22 = new LiteralOperand("15");
		QuerySingleCondition query2 = new QuerySingleCondition(selectAOperand21,QueryConditionOperator.GREATER_THAN,selectAOperand22);
		
		QueryConditionOperand selectAOperand31 = new FieldOperand(new QueryField("B","b1"));
		QueryConditionOperand selectAOperand32 = new LiteralOperand("8");
		QuerySingleCondition query3 = new QuerySingleCondition(selectAOperand31,QueryConditionOperator.LESS_THAN_OR_EQUAL,selectAOperand32);
		
		QueryConditionOperand selectAOperand41 = new FieldOperand(new QueryField("B","b2"));
		QueryConditionOperand selectAOperand42 = new LiteralOperand("4");
		QuerySingleCondition query4 = new QuerySingleCondition(selectAOperand41,QueryConditionOperator.NOT_EQUAL,selectAOperand42);
		
		List<QuerySingleCondition> lista = new ArrayList<QuerySingleCondition>();
		lista.add(query1);
		lista.add(query2);
		lista.add(query3);
		lista.add(query4);
		
		QueryAndSingleConditions queryDelNodo = new QueryAndSingleConditions(lista); 
		
		QuerySingleInputNode selectAxB = new SelectionNode(queryDelNodo);
		selectAxB.linkWith(prod);
		
		//Proj(Sel(A x B))
		List<QueryField> projectedFields = Collections.singletonList(new QueryField("A","a2"));
		ProjectionNode project = new ProjectionNode(projectedFields);
		project.linkWith(selectAxB);
		return project;
	}
	
	private static void displayTree(QueryNode tree, String message)
	{
		QueryNodeGuiMapper mapper = new QueryNodeGuiMapper();
		mapper.mapTree(tree).display(message,1000,1000);
	}
}
