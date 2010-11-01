package ubadbtools.queryOptimizer.common;

public class QueryField
{
	private String relationAlias;
	private String fieldName;
	
	public QueryField(String relationAlias, String fieldName)
	{
		this.relationAlias = relationAlias;
		this.fieldName = fieldName;
	}

	public String getRelationAlias()
	{
		return relationAlias;
	}

	public String getFieldName()
	{
		return fieldName;
	}
	
	@Override
	public String toString()
	{
		return relationAlias + "." + fieldName;
	}
}
