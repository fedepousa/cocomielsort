package ubadbtools.queryOptimizer.gui;

import ubadbtools.queryOptimizer.common.QueryNode;
import ubadbtools.queryOptimizer.common.join.JoinNode;
import ubadbtools.queryOptimizer.common.join.NaturalJoinNode;
import ubadbtools.queryOptimizer.common.product.ProductNode;
import ubadbtools.queryOptimizer.common.projection.ProjectionNode;
import ubadbtools.queryOptimizer.common.relation.RelationNode;
import ubadbtools.queryOptimizer.common.selection.SelectionNode;
import ubadbtools.queryOptimizer.gui.GuiTree.Node;

/**
 *	Realiza el mapeo entre nuestro árbol y el árbol necesario para la GUI  
 *
 */
public class QueryNodeGuiMapper
{
	public GuiTree mapTree(QueryNode rootNode)
	{
		GuiTree guiTree = new GuiTree();
		Node root = guiTree.addRoot();
		mapTree(root,rootNode);
		
		return guiTree;
	}

	private void mapTree(Node currentGuiNode, QueryNode currentQueryNode)
	{
		if(currentQueryNode.isRelation())
		{
			RelationNode relationNode = (RelationNode) currentQueryNode;
			GuiTreeNodeInfo nodeInfo = new GuiTreeNodeInfo(	TreeImageResources.RELATION_IMAGE,
															relationNode.getRelationName() + " " + relationNode.getRelationAlias());
			//Seteo la info al nodo
			currentGuiNode.setInfo(nodeInfo);
			
			//Como es una relación, no hay que seguir y termina la recursión (único caso base)
		}
		else if(currentQueryNode.isProjection())
		{
			ProjectionNode projectionNode = (ProjectionNode) currentQueryNode;
			GuiTreeNodeInfo nodeInfo = new GuiTreeNodeInfo(	TreeImageResources.PROJECTION_IMAGE,
															projectionNode.getProjectedFields().toString());
			
			//Seteo la info al nodo
			currentGuiNode.setInfo(nodeInfo);
			
			//Recursión con el nodo de abajo
			mapTree(currentGuiNode.addCenter(), projectionNode.getLowerNode());	
		}
		else if(currentQueryNode.isSelection())
		{
			SelectionNode selectionNode = (SelectionNode) currentQueryNode;
			GuiTreeNodeInfo nodeInfo = new GuiTreeNodeInfo(	TreeImageResources.SELECTION_IMAGE,
															selectionNode.getCondition().toString());
			
			//Seteo la info al nodo
			currentGuiNode.setInfo(nodeInfo);
			
			//Recursión con el nodo de abajo
			mapTree(currentGuiNode.addCenter(), selectionNode.getLowerNode());	
		}
		else if(currentQueryNode.isProduct())
		{
			ProductNode productNode = (ProductNode) currentQueryNode;
			GuiTreeNodeInfo nodeInfo = new GuiTreeNodeInfo(TreeImageResources.PRODUCT_IMAGE, "");
			
			//Seteo la info al nodo
			currentGuiNode.setInfo(nodeInfo);
			
			//Recursión con el nodo de abajo a la izquierda
			mapTree(currentGuiNode.addLeft(), productNode.getLeftLowerNode());	
			
			//Recursión con el nodo de abajo a la derecha
			mapTree(currentGuiNode.addRight(), productNode.getRightLowerNode());	
		}
		else if(currentQueryNode.isNaturalJoin())
		{
			NaturalJoinNode naturalJoinNode = (NaturalJoinNode) currentQueryNode;
			GuiTreeNodeInfo nodeInfo = new GuiTreeNodeInfo(TreeImageResources.JOIN_IMAGE, "");
			
			//Seteo la info al nodo
			currentGuiNode.setInfo(nodeInfo);
			
			//Recursión con el nodo de abajo a la izquierda
			mapTree(currentGuiNode.addLeft(), naturalJoinNode.getLeftLowerNode());	
			
			//Recursión con el nodo de abajo a la derecha
			mapTree(currentGuiNode.addRight(), naturalJoinNode.getRightLowerNode());	
		}
		else if(currentQueryNode.isJoin())
		{
			JoinNode joinNode = (JoinNode) currentQueryNode;
			GuiTreeNodeInfo nodeInfo = new GuiTreeNodeInfo(TreeImageResources.JOIN_IMAGE, joinNode.getCondition().toString());
			
			//Seteo la info al nodo
			currentGuiNode.setInfo(nodeInfo);
			
			//Recursión con el nodo de abajo a la izquierda
			mapTree(currentGuiNode.addLeft(), joinNode.getLeftLowerNode());	
			
			//Recursión con el nodo de abajo a la derecha
			mapTree(currentGuiNode.addRight(), joinNode.getRightLowerNode());	
		}
	}
}
