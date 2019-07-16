package com.ego.controller.impl;

public class DelHistoryServlet extends HistoryControllerSupport 
{

	@Override
	public String execute() throws Exception 
	{
		this.update("delHistory", "É¾³ýÀúÊ·¼ÇÂ¼");
		this.savePageData("history");
		return "WEB-INF/views/history";
	}

}
