package ubadbtools.queryOptimizer.common;

import ubadbtools.queryOptimizer.common.join.JoinNode;
import ubadbtools.queryOptimizer.common.join.NaturalJoinNode;
import ubadbtools.queryOptimizer.common.product.ProductNode;
import ubadbtools.queryOptimizer.common.projection.ProjectionNode;
import ubadbtools.queryOptimizer.common.relation.RelationNode;
import ubadbtools.queryOptimizer.common.selection.SelectionNode;

public abstract class QueryNode
{
	protected QueryNode upperNode;

	public QueryNode getUpperNode()
	{
		return upperNode;
	}

	public void setUpperNode(QueryNode upperNode)
	{
		this.upperNode = upperNode;
	}
	
	public boolean isProjection()
	{
		return getClass().equals(ProjectionNode.class); 
	}
	
	public boolean isSelection()
	{
		return getClass().equals(SelectionNode.class); 
	}
	
	public boolean isProduct()
	{
		return getClass().equals(ProductNode.class); 
	}

	public boolean isJoin()
	{
		return getClass().equals(JoinNode.class); 
	}
	
	public boolean isNaturalJoin()
	{
		return getClass().equals(NaturalJoinNode.class); 
	}

	public boolean isRelation()
	{
		return getClass().equals(RelationNode.class); 
	}
}
