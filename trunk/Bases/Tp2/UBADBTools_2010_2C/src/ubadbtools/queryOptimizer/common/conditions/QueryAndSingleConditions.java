package ubadbtools.queryOptimizer.common.conditions;

import java.util.List;

public class QueryAndSingleConditions implements QueryCondition
{
	private List<QuerySingleCondition> singleConditions;

	public QueryAndSingleConditions(List<QuerySingleCondition> singleConditions)
	{
		this.singleConditions = singleConditions;
	}

	public List<QuerySingleCondition> getSingleConditions()
	{
		return singleConditions;
	}

	@Override
	public String toString()
	{
		int totalConditions = singleConditions.size();
		String ret = "";
		
		for(int i=0; i < totalConditions; i++)
		{
			ret += singleConditions.get(i).toString();
			
			if(i != (totalConditions-1))
				ret += " AND ";
		}
		
		return ret;
	}
	
	@Override
	public boolean isJoinCondition()
	{
		boolean ret = true;
		
		for(QuerySingleCondition singleCondition : singleConditions)
			ret = ret && singleCondition.isJoinCondition();
		
		return ret;
	}
}
