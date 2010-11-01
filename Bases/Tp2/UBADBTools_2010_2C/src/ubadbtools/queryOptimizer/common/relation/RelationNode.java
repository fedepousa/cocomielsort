package ubadbtools.queryOptimizer.common.relation;

import ubadbtools.queryOptimizer.common.QueryNode;

public class RelationNode extends QueryNode
{
	private String relationName;
	private String relationAlias;
	
	public RelationNode(String relationName, String relationAlias)
	{
		this.relationName = relationName;
		this.relationAlias = relationAlias;
	}

	public String getRelationName()
	{
		return relationName;
	}
	
	public String getRelationAlias()
	{
		return relationAlias;
	}
}
