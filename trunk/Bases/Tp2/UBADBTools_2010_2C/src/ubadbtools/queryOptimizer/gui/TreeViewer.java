package ubadbtools.queryOptimizer.gui;
  /*
   * Programming graphical user interfaces
   * Exam  BinaryTreeView.java
   * Jarkko Leponiemi 2003
   */
  
  import java.awt.Dimension;
import java.awt.FontMetrics;
import java.awt.Graphics;
import java.awt.Graphics2D;
import java.awt.Rectangle;
import java.util.HashMap;

import javax.swing.JPanel;
  
  /**
   * A class representing a graphical view of a binary tree.
   */
  @SuppressWarnings("serial")
public class TreeViewer extends JPanel {
    
    // arbol
    private GuiTree tree = null;
    // ubicaciones de los nodos del arbol
	private HashMap nodeLocations = null;
    // tamaño de los subarboles
	private HashMap subtreeSizes = null;
    private boolean dirty = true;
    // distancia entre nodos
    private int parent2child = 80, child2child = 60;
    
    // helpers
    private Dimension empty = new Dimension(0, 0);
    private FontMetrics fm = null;
    
	public TreeViewer(GuiTree tree) {
      this.tree = tree;
      nodeLocations = new HashMap();
      subtreeSizes = new HashMap();
    }
    
    private void calculateLocations() {
      nodeLocations.clear();
      subtreeSizes.clear();
      GuiTree.Node root = tree.getRoot();
      if (root != null) {
        calculateSubtreeSize(root);
        calculateLocation(root, Integer.MAX_VALUE, Integer.MAX_VALUE, 0);
      }
    }
    
    private Dimension calculateSubtreeSize(GuiTree.Node n) {
      if (n == null) return new Dimension(0, 0);
      Dimension ld = calculateSubtreeSize(n.getLeft());
      Dimension rd = calculateSubtreeSize(n.getRight());
      int h = 0;
      if(n.getImageIcon() != null)
      h = n.getImageIcon().getIconHeight() + parent2child + Math.max(ld.height, rd.height);
      int width = Math.max(fm.stringWidth(n.getAttributes()), n.getImageIcon().getIconWidth()); 
      //int w = width + ld.width + child2child + rd.width;
      int w = width + child2child + Math.max(ld.width, rd.width);
      Dimension d = new Dimension(w, h);
      n.setSubtreeSize(d);
      subtreeSizes.put(n, d);
      return d;
    }
    
    private void calculateLocation(GuiTree.Node n, int left, int right, int top) {
      if (n == null) return;
      Dimension ld = empty;
      if(n.getLeft() != null)
    	  ld = n.getLeft().getSubtreeSize();
      //if (ld == null) ld = empty;
      Dimension rd = empty;
//      if(n.getRight() != null)
//    	  rd = n.getRight().getSubtreeSize();
      int center = 0;
      if (right != Integer.MAX_VALUE && left == Integer.MAX_VALUE)
          center = right - rd.width - child2child/2;
      else if (left != Integer.MAX_VALUE && right == Integer.MAX_VALUE)
          center = left + ld.width + child2child/2;
      int width = 0, height = 0; 
      if(n.getImageIcon()!=null)
      width = n.getImageIcon().getIconWidth();
      if(fm.stringWidth(n.getAttributes())>width) {
    	  width = fm.stringWidth(n.getAttributes());
    	  height = n.getImageIcon().getIconHeight();
      }
      
      Rectangle r = new Rectangle(center - width/2 - 3, top, width + 6, height);
      nodeLocations.put(n, r);
      n.setLocation(r);
      if(n.getRight()!=null) {
	      calculateLocation(n.getLeft(), Integer.MAX_VALUE, center - child2child/2, top + fm.getHeight() + parent2child);
	      calculateLocation(n.getRight(), center + child2child/2, Integer.MAX_VALUE, top + fm.getHeight() + parent2child);
      }
      else if(n.getLeft()!=null)
	      calculateLocation(n.getLeft(), Integer.MAX_VALUE, center + child2child/2, top + fm.getHeight() + parent2child);
    }
    
    private void drawTree(Graphics2D g, GuiTree.Node n, int px, int py, int yoffs) {
      if (n == null) return;
//      Rectangle r = (Rectangle) nodeLocations.get(n);
      Rectangle r = (Rectangle) n.getLocation();
      //g.draw(r);
      //g.drawString(n.getOperationName(), r.x + 3 + n.getAttributes().length(), r.y+10);
//      g.drawString(n.getAttributes(), r.x + 3, r.y + 25);
      if(n.getImageIcon() != null) {
          if(fm.stringWidth(n.getAttributes())==r.width-6) {
	    	  g.drawImage(n.getImageIcon().getImage(), r.x + (r.width/2 - n.getImageIcon().getIconWidth()/2), r.y+10, null);
	    	  g.drawString(n.getAttributes(), r.x + 3, r.y + n.getImageIcon().getIconHeight()+25);
          }
          else {
	    	  g.drawImage(n.getImageIcon().getImage(), r.x + 3, r.y+10, null);
	    	  g.drawString(n.getAttributes(), r.x + 3 + (n.getImageIcon().getIconWidth()/2 - fm.stringWidth(n.getAttributes())/2), r.y + n.getImageIcon().getIconHeight()+25);
          }
      }
      else {
    	  g.drawString(n.getAttributes(), r.x + 3, r.y + 25);
      }
      if (px != Integer.MAX_VALUE) {
    	  //System.err.println("dibujando para nodo: " + n.getOperationName() + py + " " + r.y + " " + r.height);
        g.drawLine(px, py+30, r.x + r.width/2, r.y);
      }
//      if(n.getRight()!=null) {
	      drawTree(g, n.getLeft(), r.x + r.width/2, r.y + 40, yoffs);
	      drawTree(g, n.getRight(), r.x + r.width/2, r.y + 40, yoffs);
//      }
//      else if(n.getLeft()!=null) {
//	      drawTree(g, n.getLeft(), r.x + r.width/2, r.y + r.height, yoffs);
//      }
    }
    
    public void paint(Graphics g) {
      super.paint(g);
      fm = g.getFontMetrics();
      if (dirty) {
        calculateLocations();
        dirty = false;
      }
      Graphics2D g2d = (Graphics2D) g;
      g2d.translate(getWidth() / 2, parent2child);
      drawTree(g2d, tree.getRoot(), Integer.MAX_VALUE, Integer.MAX_VALUE, fm.getLeading() + fm.getAscent());
      fm = null;
    }
  }
