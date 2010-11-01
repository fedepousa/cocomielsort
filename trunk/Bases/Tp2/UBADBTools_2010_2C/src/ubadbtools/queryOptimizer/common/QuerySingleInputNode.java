package ubadbtools.queryOptimizer.common;

public class QuerySingleInputNode extends QueryNode
{
	protected QueryNode lowerNode;
	
	public QueryNode getLowerNode()
	{
		return lowerNode;
	}

	public void linkWith(QueryNode lowerNode)
	{
		this.lowerNode = lowerNode;
		lowerNode.setUpperNode(this);
	}
}
