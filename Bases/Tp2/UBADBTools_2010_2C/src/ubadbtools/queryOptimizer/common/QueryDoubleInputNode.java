package ubadbtools.queryOptimizer.common;

public class QueryDoubleInputNode extends QueryNode
{
	protected QueryNode leftLowerNode;
	protected QueryNode rightLowerNode;
	
	public QueryNode getLeftLowerNode()
	{
		return leftLowerNode;
	}

	public QueryNode getRightLowerNode()
	{
		return rightLowerNode;
	}
	
	public void linkWith(QueryNode leftLowerNode, QueryNode rightLowerNode)
	{
		this.leftLowerNode = leftLowerNode;
		this.rightLowerNode = rightLowerNode;
		
		leftLowerNode.setUpperNode(this);
		rightLowerNode.setUpperNode(this);
	}
}
