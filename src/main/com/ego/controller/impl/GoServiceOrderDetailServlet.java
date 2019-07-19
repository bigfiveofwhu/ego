package com.ego.controller.impl;

public class GoServiceOrderDetailServlet extends ServiceOrderControllerSupport 
{

	@Override
	public String execute() throws Exception 
	{
		this.savePageInstance("serviceOrderDetail");
		return "WEB-INF/views/serviceOrderDetail";
	}

}
