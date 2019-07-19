package com.ego.controller.impl;

public class CheckServiceServlet extends ServiceOrderControllerSupport 
{
	@Override
	public String execute() throws Exception 
	{
		this.update("checkService", "服务完工");
		return "WEB-INF/views/serviceOrderDetail";
	}

}
