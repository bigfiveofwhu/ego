package com.ego.controller.impl;

public class CheckServiceServlet extends ServiceOrderControllerSupport 
{
	@Override
	public String execute() throws Exception 
	{
		this.update("checkService", "�����깤");
		return "WEB-INF/views/serviceOrderDetail";
	}

}
