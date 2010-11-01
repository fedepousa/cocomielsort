package ubadbtools.queryOptimizer;

import java.util.Collections;
import java.util.List;

import ubadbtools.queryOptimizer.common.QueryField;
import ubadbtools.queryOptimizer.common.QueryNode;
import ubadbtools.queryOptimizer.common.QuerySingleInputNode;
import ubadbtools.queryOptimizer.common.conditions.FieldOperand;
import ubadbtools.queryOptimizer.common.conditions.LiteralOperand;
import ubadbtools.queryOptimizer.common.conditions.QueryCondition;
import ubadbtools.queryOptimizer.common.conditions.QueryConditionOperand;
import ubadbtools.queryOptimizer.common.conditions.QueryConditionOperator;
import ubadbtools.queryOptimizer.common.conditions.QuerySingleCondition;
import ubadbtools.queryOptimizer.common.join.JoinNode;
import ubadbtools.queryOptimizer.common.projection.ProjectionNode;
import ubadbtools.queryOptimizer.common.relation.RelationNode;
import ubadbtools.queryOptimizer.common.selection.SelectionNode;
import ubadbtools.queryOptimizer.gui.QueryNodeGuiMapper;
import ubadbtools.queryOptimizer.optimizer.CanonicalValidator;

public class MainDisplayAndCheckCanonical
{
	public static void main(String[] args) throws Exception
	{
		QueryNode tree1 = createTree();
		
		//Display
		displayTree(tree1);
		
		//Check
		CanonicalValidator validator1 = new CanonicalValidator(tree1);
		System.out.println(validator1.checkIsCanonical());
	}

	private static QueryNode createTree()
	{
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
		
		//(Sel A) JOIN B
		QueryConditionOperand joinOperand1 = new FieldOperand(new QueryField("A","z"));
		QueryConditionOperand joinOperand2 = new FieldOperand(new QueryField("B","z"));
		QueryCondition joinCondition = new QuerySingleCondition(joinOperand1,QueryConditionOperator.EQUAL,joinOperand2);
		JoinNode join = new JoinNode(joinCondition);
		join.linkWith(selectA,relB);
		
		//Proj(Sel(A) JOIN B)
		List<QueryField> projectedFields = Collections.singletonList(new QueryField("A","a2"));
		ProjectionNode project = new ProjectionNode(projectedFields);
		project.linkWith(join);
		return project;
	}

	private static void displayTree(QueryNode tree)
	{
		QueryNodeGuiMapper mapper = new QueryNodeGuiMapper();
		mapper.mapTree(tree).display("",1000,1000);
	}
}
