package ubadbtools.scheduleAnalyzer;

import ubadbtools.scheduleAnalyzer.gui.forms.ScheduleAnalyzerForm;

public class ScheduleAnalyzerTool
{
    //[start] Main
    public static void main(String args[]) {
        java.awt.EventQueue.invokeLater(new Runnable() {
            public void run() {
                new ScheduleAnalyzerForm().setVisible(true);
            }
        });
    }
	//[end]
}
