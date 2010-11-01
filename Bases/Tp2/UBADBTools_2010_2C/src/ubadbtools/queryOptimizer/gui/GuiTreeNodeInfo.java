package ubadbtools.queryOptimizer.gui;

public class GuiTreeNodeInfo
{
	private String imagePath;
	private String message;
	
	public GuiTreeNodeInfo(String imagePath, String message)
	{
		this.imagePath = imagePath;
		this.message = message;
	}

	public String getImagePath()
	{
		return imagePath;
	}

	public void setImagePath(String imagePath)
	{
		this.imagePath = imagePath;
	}

	public String getMessage()
	{
		return message;
	}

	public void setMessage(String message)
	{
		this.message = message;
	}
}
