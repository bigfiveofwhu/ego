package com.ego.controller.impl;

public class ShowServiceOrderServlet extends ServiceOrderControllerSupport 
{

	@Override
	public String execute() throws Exception 
	{
		this.savePageData("allServiceOrder");
		return "WEB-INF/views/serviceOrder";
	}

}
