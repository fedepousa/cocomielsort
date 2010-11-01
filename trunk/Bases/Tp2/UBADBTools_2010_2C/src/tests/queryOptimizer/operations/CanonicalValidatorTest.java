package tests.queryOptimizer.operations;

import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertTrue;

import java.util.Collections;
import java.util.List;

import org.junit.Test;

import ubadbtools.queryOptimizer.common.QueryField;
import ubadbtools.queryOptimizer.common.QuerySingleInputNode;
import ubadbtools.queryOptimizer.common.conditions.FieldOperand;
import ubadbtools.queryOptimizer.common.conditions.LiteralOperand;
import ubadbtools.queryOptimizer.common.conditions.QueryCondition;
import ubadbtools.queryOptimizer.common.conditions.QueryConditionOperand;
import ubadbtools.queryOptimizer.common.conditions.QueryConditionOperator;
import ubadbtools.queryOptimizer.common.conditions.QuerySingleCondition;
import ubadbtools.queryOptimizer.common.product.ProductNode;
import ubadbtools.queryOptimizer.common.projection.ProjectionNode;
import ubadbtools.queryOptimizer.common.relation.RelationNode;
import ubadbtools.queryOptimizer.common.selection.SelectionNode;
import ubadbtools.queryOptimizer.optimizer.CanonicalValidator;

public class CanonicalValidatorTest
{
	@Test
	public void testOnlyRelation()
	{
		RelationNode tree = new RelationNode("AAAA","A");
		CanonicalValidator validator = new CanonicalValidator(tree);
		assertTrue(validator.checkIsCanonical());
	}

	@Test
	public void testOnlyProduct()
	{
		RelationNode relA = new RelationNode("AAAA","A");
		RelationNode relB = new RelationNode("BBBB","B");
		ProductNode tree = new ProductNode();
		tree.linkWith(relA,relB);
		
		CanonicalValidator validator = new CanonicalValidator(tree);
		assertTrue(validator.checkIsCanonical());
	}
	
	@Test
	public void testSelectionAndProduct()
	{
		RelationNode relA = new RelationNode("AAAA","A");
		RelationNode relB = new RelationNode("BBBB","B");
		ProductNode prod = new ProductNode();
		prod.linkWith(relA,relB);
		
		QueryConditionOperand selectAOperand1 = new FieldOperand(new QueryField("A","a1"));
		QueryConditionOperand selectAOperand2 = new LiteralOperand("1");
		QueryCondition selectACondition = new QuerySingleCondition(selectAOperand1,QueryConditionOperator.EQUAL,selectAOperand2);
		QuerySingleInputNode tree = new SelectionNode(selectACondition);
		tree.linkWith(prod);
		
		CanonicalValidator validator = new CanonicalValidator(tree);
		assertTrue(validator.checkIsCanonical());
	}
	
	@Test
	public void testProjectionAndSelectionAndProduct()
	{
		RelationNode relA = new RelationNode("AAAA","A");
		RelationNode relB = new RelationNode("BBBB","B");
		ProductNode prod = new ProductNode();
		prod.linkWith(relA,relB);
		
		QueryConditionOperand selectAOperand1 = new FieldOperand(new QueryField("A","a1"));
		QueryConditionOperand selectAOperand2 = new LiteralOperand("1");
		QueryCondition selectACondition = new QuerySingleCondition(selectAOperand1,QueryConditionOperator.EQUAL,selectAOperand2);
		QuerySingleInputNode select = new SelectionNode(selectACondition);
		select.linkWith(prod);
		
		List<QueryField> projectedFields = Collections.singletonList(new QueryField("A","a2"));
		ProjectionNode tree = new ProjectionNode(projectedFields);
		tree.linkWith(select);
		
		CanonicalValidator validator = new CanonicalValidator(tree);
		assertTrue(validator.checkIsCanonical());
	}
	
	@Test
	public void testProjectionAndProduct()
	{
		RelationNode relA = new RelationNode("AAAA","A");
		RelationNode relB = new RelationNode("BBBB","B");
		ProductNode prod = new ProductNode();
		prod.linkWith(relA,relB);
		
		List<QueryField> projectedFields = Collections.singletonList(new QueryField("A","a2"));
		ProjectionNode tree = new ProjectionNode(projectedFields);
		tree.linkWith(prod);
		
		CanonicalValidator validator = new CanonicalValidator(tree);
		assertTrue(validator.checkIsCanonical());
	}
	
	@Test
	public void testSelectionAndProjectionAndProduct()
	{
		RelationNode relA = new RelationNode("AAAA","A");
		RelationNode relB = new RelationNode("BBBB","B");
		ProductNode prod = new ProductNode();
		prod.linkWith(relA,relB);
		
		List<QueryField> projectedFields = Collections.singletonList(new QueryField("A","a2"));
		ProjectionNode proj = new ProjectionNode(projectedFields);
		proj.linkWith(prod);
		
		QueryConditionOperand selectAOperand1 = new FieldOperand(new QueryField("A","a1"));
		QueryConditionOperand selectAOperand2 = new LiteralOperand("1");
		QueryCondition selectACondition = new QuerySingleCondition(selectAOperand1,QueryConditionOperator.EQUAL,selectAOperand2);
		QuerySingleInputNode root = new SelectionNode(selectACondition);
		root.linkWith(proj);
		
		CanonicalValidator validator = new CanonicalValidator(root);
		assertFalse(validator.checkIsCanonical());
	}
}
