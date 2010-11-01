package ubadbtools.queryOptimizer.optimizer;

import ubadbtools.queryOptimizer.common.QueryNode;
import ubadbtools.queryOptimizer.common.product.ProductNode;
import ubadbtools.queryOptimizer.common.projection.ProjectionNode;
import ubadbtools.queryOptimizer.common.selection.SelectionNode;

public class CanonicalValidator
{
	private QueryNode rootNode;
	
	public CanonicalValidator(QueryNode rootNode)
	{
		this.rootNode = rootNode;
	}

	public boolean checkIsCanonical()
	{
		boolean ret;

		//Primero debería haber una proyección, después una selección y después productos cartesianos
		//OJO: El orden debe ser este si están todos presentes, alguno de ellos puede no llegar a estar presente y seguiría siendo canónico 
		
		//Si lo primero es una proyección...
		if(rootNode.isProjection())
		{
			ProjectionNode projection = (ProjectionNode) rootNode;
			
			ret = checkSelection(projection.getLowerNode());
		}
		else
		{
			ret = checkSelection(rootNode);
		}
		
		return ret;
	}

	private boolean checkSelection(QueryNode node)
	{
		boolean ret;
		
		//Si viene una selección...
		if(node.isSelection())
		{
			SelectionNode selection = (SelectionNode) node;
			
			//Ahora debería haber todos productos "canónicos" 
			//(con una relación en su rama derecha y otro producto "canónico" o relación en su rama izquierda)
			ret = checkCanonicalProduct(selection.getLowerNode());
		}
		else
		{
			ret = checkCanonicalProduct(node);
		}
		
		return ret;
	}

	private boolean checkCanonicalProduct(QueryNode node)
	{
		boolean ret = false;
		
		if(node.isProduct())
		{
			ProductNode product = (ProductNode) node;
			
			//La rama derecha debería ser una relación y la izquierda, producto "canónico"
			ret = 	product.getRightLowerNode().isRelation() && 
					checkCanonicalProduct(product.getLeftLowerNode());
		}
		else
		{
			ret = checkRelation(node);
		}
		
		return ret;
	}

	private boolean checkRelation(QueryNode node)
	{
		return node.isRelation();
	}
}
