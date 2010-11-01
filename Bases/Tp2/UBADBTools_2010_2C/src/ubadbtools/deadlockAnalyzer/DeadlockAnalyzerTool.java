package ubadbtools.deadlockAnalyzer;

import ubadbtools.deadlockAnalyzer.gui.forms.DeadlockAnalyzerForm;

public class DeadlockAnalyzerTool
{
	public static void main(String[] args)
	{
		java.awt.EventQueue.invokeLater(new Runnable() {
            public void run() {
                new DeadlockAnalyzerForm().setVisible(true);
            }
        });
	}
}
