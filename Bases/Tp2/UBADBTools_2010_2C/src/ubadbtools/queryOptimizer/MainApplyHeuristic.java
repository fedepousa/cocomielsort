package ubadbtools.queryOptimizer;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

import ubadbtools.queryOptimizer.common.QueryField;
import ubadbtools.queryOptimizer.common.QueryNode;
import ubadbtools.queryOptimizer.common.QuerySingleInputNode;
import ubadbtools.queryOptimizer.common.TreeHelper;
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
import ubadbtools.queryOptimizer.optimizer.heuristics.CascadingSelectionsHeuristic;
import ubadbtools.queryOptimizer.optimizer.heuristics.Heuristic;
import ubadbtools.queryOptimizer.optimizer.heuristics.PushSelectionsHeuristic;
import ubadbtools.queryOptimizer.optimizer.heuristics.PushProjectionsHeuristic;
import ubadbtools.queryOptimizer.optimizer.heuristics.PushSelectionsWithJoinConditionHeuristic;
import ubadbtools.queryOptimizer.optimizer.heuristics.ReplaceProductsHeuristic;
import ubadbtools.queryOptimizer.optimizer.heuristics.SwapLeavesHeuristic;

public class MainApplyHeuristic
{
	public static void main(String[] args)
	{
		TreeHelper th = new TreeHelper();
		
		List<QuerySingleCondition> aux;
		List<String> aux2;
		
		QueryNode tree1 = createTree5();
		
		
		displayTree(tree1, "Original");
		Heuristic heuristic = new CascadingSelectionsHeuristic();
		heuristic.applyHeuristic(tree1);
		displayTree(tree1, "Cascading");
		
		
		tree1 = createTree5();
		heuristic = new SwapLeavesHeuristic();
		heuristic.applyHeuristic(tree1);
		displayTree(tree1, "Swap");
		
		tree1 = createTree5();
		heuristic = new PushSelectionsWithJoinConditionHeuristic();
		heuristic.applyHeuristic(tree1);
		displayTree(tree1, "SelecJoin");
		
		
		tree1 = createTree5();
		heuristic = new ReplaceProductsHeuristic();
		heuristic.applyHeuristic(tree1);
		displayTree(tree1, "ReplaceProd");
		
		tree1 = createTree5();
		heuristic = new PushSelectionsHeuristic();
		heuristic.applyHeuristic(tree1);
		displayTree(tree1, "PushSel");
		
		tree1 = createTree5();
		heuristic = new PushProjectionsHeuristic();
		heuristic.applyHeuristic(tree1);
		displayTree(tree1, "PushPro");
			
	}
	
	private static ProjectionNode createTree1()
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
	
	private static QueryNode createTree3(){
		
		/*select A.patente
		 * from Clientes C,Autos A,Prestamos P
		 * where P.Cid = C.id and P.Aid = A.id and C.nombre = "Juan"  
		 */
		
		RelationNode relC = new RelationNode("Clientes","C");
		
		RelationNode relA = new RelationNode("Autos","A");
	
		RelationNode relP = new RelationNode("Prestamos","P");
		
		//C x A 
		ProductNode prod1 = new ProductNode();
		prod1.linkWith(relC,relA);
		
		//(C x A) x P
		ProductNode prod2 = new ProductNode();
		prod2.linkWith(prod1,relP);
		
		QueryConditionOperand selectAOperand1 = new FieldOperand(new QueryField("P","Cid"));
		QueryConditionOperand selectAOperand2 = new FieldOperand(new QueryField("C","id"));
		
		QueryConditionOperand selectAOperand3 = new FieldOperand(new QueryField("P","Aid"));
		QueryConditionOperand selectAOperand4 = new FieldOperand(new QueryField("A","id"));
		
		QueryConditionOperand selectAOperand5 = new FieldOperand(new QueryField("C","nombre"));
		QueryConditionOperand selectAOperand6 = new LiteralOperand("Juan");
		
		QuerySingleCondition query1 = new QuerySingleCondition(selectAOperand1,QueryConditionOperator.EQUAL,selectAOperand2);
		QuerySingleCondition query2 = new QuerySingleCondition(selectAOperand3,QueryConditionOperator.EQUAL,selectAOperand4);
		QuerySingleCondition query3 = new QuerySingleCondition(selectAOperand5,QueryConditionOperator.EQUAL,selectAOperand6);
		
		
		List<QuerySingleCondition> lista = new ArrayList<QuerySingleCondition>();
		lista.add(query1);
		lista.add(query2);
		lista.add(query3);
		
		QueryAndSingleConditions queryDelNodo = new QueryAndSingleConditions(lista); 
		
		//Select
		QuerySingleInputNode selectNodo = new SelectionNode(queryDelNodo);
		selectNodo.linkWith(prod2);
		
		//Projeccion
		List<QueryField> projectedFields = Collections.singletonList(new QueryField("A","Patente"));
		
		ProjectionNode project = new ProjectionNode(projectedFields);
		project.linkWith(selectNodo);
		return project;
	}
	
	private static QueryNode createTree4(){
		//A
		RelationNode relA = new RelationNode("Auto","A");
		
		//B
		RelationNode relB = new RelationNode("Bote","B");
		
		//A x B
		ProductNode prod = new ProductNode();
		prod.linkWith(relA,relB);
		
		//Projeccion
		List<QueryField> projectedFields = new ArrayList<QueryField>();
		QueryField aux = new QueryField("A", "Patente");
		projectedFields.add(aux);
		aux = new QueryField("A", "BlaBla");
		projectedFields.add(aux);
		aux = new QueryField("B", "Color");
		projectedFields.add(aux);
		aux = new QueryField("B", "Otro"); 
		projectedFields.add(aux);
		ProjectionNode project = new ProjectionNode(projectedFields);
		project.linkWith(prod);
		return project;
		
	
	}
	
	private static QueryNode createTree5(){
		RelationNode rel0 = new RelationNode("Autos","A");
		RelationNode rel1 = new RelationNode("Polizas","P");
		ProductNode prod0 = new ProductNode();
		prod0.linkWith(rel0,rel1);


		List<QueryField> projectedFields = new ArrayList<QueryField>();
		QueryField projectedField;
		projectedField = new QueryField("A","id");
		projectedFields.add(projectedField);
		ProjectionNode projecciones = new ProjectionNode(projectedFields);


		List<QuerySingleCondition> conds = new ArrayList<QuerySingleCondition>();
		QueryConditionOperand selectAOperandA;
		QueryConditionOperand selectAOperandB;
		QuerySingleCondition query;
		selectAOperandA = new FieldOperand(new QueryField("A","patente "));
		selectAOperandB = new FieldOperand(new QueryField("P","patente"));
		query = new QuerySingleCondition(selectAOperandA,QueryConditionOperator.EQUAL,selectAOperandB);
		conds.add(query);
		selectAOperandA = new FieldOperand(new QueryField("A","persona "));
		selectAOperandB = new FieldOperand(new QueryField("P","persona"));
		query = new QuerySingleCondition(selectAOperandA,QueryConditionOperator.EQUAL,selectAOperandB);
		conds.add(query);
		QueryAndSingleConditions queryDelNodo = new QueryAndSingleConditions(conds);
		QuerySingleInputNode selecciones = new SelectionNode(queryDelNodo);


		projecciones.linkWith(selecciones);
		selecciones.linkWith(prod0);

		return projecciones;

	}
	
	private static QueryNode createTree6(){
		RelationNode rel0 = new RelationNode("Autos","A");
		RelationNode rel1 = new RelationNode("Polizas","P");
		ProductNode prod0 = new ProductNode();
		prod0.linkWith(rel0,rel1);


		List<QueryField> projectedFields = new ArrayList<QueryField>();
		QueryField projectedField;
		projectedField = new QueryField("A","id");
		projectedFields.add(projectedField);
		ProjectionNode projecciones = new ProjectionNode(projectedFields);


		List<QuerySingleCondition> conds = new ArrayList<QuerySingleCondition>();
		QueryConditionOperand selectAOperandA;
		QueryConditionOperand selectAOperandB;
		QuerySingleCondition query;
		selectAOperandA = new FieldOperand(new QueryField("A","persona "));
		selectAOperandB = new FieldOperand(new QueryField("P","persona"));
		query = new QuerySingleCondition(selectAOperandA,QueryConditionOperator.EQUAL,selectAOperandB);
		conds.add(query);
		QueryAndSingleConditions queryDelNodo = new QueryAndSingleConditions(conds);
		QuerySingleInputNode selecciones = new SelectionNode(queryDelNodo);


		projecciones.linkWith(selecciones);
		selecciones.linkWith(prod0);

		return projecciones;

	}
	
	private static QueryNode createTree7(){
		RelationNode rel0 = new RelationNode("Autos","A");


		List<QueryField> projectedFields = new ArrayList<QueryField>();
		QueryField projectedField;
		projectedField = new QueryField("A","patente");
		projectedFields.add(projectedField);
		ProjectionNode projecciones = new ProjectionNode(projectedFields);



		projecciones.linkWith(rel0);

		return projecciones;

	}
	
	private static QueryNode createTree8(){
		RelationNode rel0 = new RelationNode("Autos","A");


		List<QueryField> projectedFields = new ArrayList<QueryField>();
		QueryField projectedField;
		projectedField = new QueryField("A","id");
		projectedFields.add(projectedField);
		ProjectionNode projecciones = new ProjectionNode(projectedFields);


		List<QuerySingleCondition> conds = new ArrayList<QuerySingleCondition>();
		QueryConditionOperand selectAOperandA;
		QueryConditionOperand selectAOperandB;
		QuerySingleCondition query;
		selectAOperandA = new FieldOperand(new QueryField("A","id"));
		selectAOperandB = new LiteralOperand("3");
		query = new QuerySingleCondition(selectAOperandA,QueryConditionOperator.EQUAL,selectAOperandB);
		conds.add(query);
		QueryAndSingleConditions queryDelNodo = new QueryAndSingleConditions(conds);
		QuerySingleInputNode selecciones = new SelectionNode(queryDelNodo);


		projecciones.linkWith(selecciones);
		selecciones.linkWith(rel0);

		return projecciones;

	}
	private static void displayTree(QueryNode tree, String message)
	{
		QueryNodeGuiMapper mapper = new QueryNodeGuiMapper();
		mapper.mapTree(tree).display(message,1000,1000);
	}
}
