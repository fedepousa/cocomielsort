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

		//Primero deber�a haber una proyecci�n, despu�s una selecci�n y despu�s productos cartesianos
		//OJO: El orden debe ser este si est�n todos presentes, alguno de ellos puede no llegar a estar presente y seguir�a siendo can�nico 
		
		//Si lo primero es una proyecci�n...
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
		
		//Si viene una selecci�n...
		if(node.isSelection())
		{
			SelectionNode selection = (SelectionNode) node;
			
			//Ahora deber�a haber todos productos "can�nicos" 
			//(con una relaci�n en su rama derecha y otro producto "can�nico" o relaci�n en su rama izquierda)
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
			
			//La rama derecha deber�a ser una relaci�n y la izquierda, producto "can�nico"
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
