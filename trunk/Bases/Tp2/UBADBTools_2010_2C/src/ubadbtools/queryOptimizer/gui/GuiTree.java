package ubadbtools.queryOptimizer.gui;
import java.awt.Dimension;
import java.awt.Rectangle;
import java.awt.event.WindowAdapter;
import java.awt.event.WindowEvent;

import javax.swing.ImageIcon;
import javax.swing.JFrame;
import javax.swing.JScrollPane;

public class GuiTree 
{
	private Node root = null;
	
	public Node getRoot() { return root; }
	
	public Node addRoot() {
		root = new Node();
		return root;
	}

	@SuppressWarnings("deprecation")
	public void display(String title, int width, int height)
	{
		JFrame f = new JFrame(title);
		f.getContentPane().add(new JScrollPane(new TreeViewer(this)));
		
		// create and add an event handler for window closing event
		f.addWindowListener(new WindowAdapter() {
			public void windowClosing(WindowEvent e) {
				System.exit(0);
			}
		});
		
	  	f.setBounds(50, 50, width, height);
	  	f.show();
	 }
	
	/**
	 * Nodo del arbol
	 */
	public class Node {
		private String operationName = null;
		private ImageIcon operationImg = null;
		private String attribs = null;	
		private Node left = null;
		private Node right = null;
		private Rectangle location = null;
		private Dimension subTreeSize;
		
		public Node addLeft() {
			left = new Node();
			return left;
		}
		
		public Node addRight() {
			right = new Node();
			return right;
		}
		
		//Center es como ponerlo en la izquierda (por como está hecho el display)
		public Node addCenter() {
			left = new Node();
			return left;
		}
		
		public void setInfo(GuiTreeNodeInfo nodeInfo)
		{
			operationName = "";
			operationImg = createImageIcon(nodeInfo.getImagePath());
			attribs = nodeInfo.getMessage();
		}
		
		public Node getLeft() { 
			return left; 
		}

		public Node getRight() { 
			return right; 
		}
		
		public String getOperationName() { 
			return operationName; 
		}

		public ImageIcon getImageIcon() { 
			return operationImg; 
		}
		
		public String getAttributes() {
			return attribs;
		}

		public void setLocation(Rectangle r) {
			this.location = r;
		}
		
		public Rectangle getLocation() {
			return location;
		}

		public void setSubtreeSize(Dimension subtreeSize) {
			this.subTreeSize = subtreeSize;
		}

		public Dimension getSubtreeSize() {
			return subTreeSize;
		}
		
		// Crea un ImageIcon a partir de un path dado
		@SuppressWarnings("deprecation")
		private ImageIcon createImageIcon(String path) {
	            return new ImageIcon(java.net.URLDecoder.decode(path));
	    }
	}
}