package ubadbtools.queryOptimizer.common.projection;

import java.util.List;

import ubadbtools.queryOptimizer.common.QueryField;
import ubadbtools.queryOptimizer.common.QuerySingleInputNode;

public class ProjectionNode extends QuerySingleInputNode
{
	private List<QueryField> projectedFields;
	
	public ProjectionNode(List<QueryField> projectedFields)
	{
		this.projectedFields = projectedFields;
	}

	public List<QueryField> getProjectedFields()
	{
		return projectedFields;
	}
}
