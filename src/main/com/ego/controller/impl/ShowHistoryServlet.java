package com.ego.controller.impl;

public class ShowHistoryServlet extends HistoryControllerSupport 
{

	@Override
	public String execute() throws Exception 
	{
		this.savePageData("history");
		return "WEB-INF/views/history";
	}

}
