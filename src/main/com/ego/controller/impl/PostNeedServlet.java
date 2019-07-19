package com.ego.controller.impl;

public class PostNeedServlet extends NeedControllerSupport 
{

	@Override
	public String execute() throws Exception 
	{
		this.update("postNeed","ÃÌº”–Ë«Û");
		return "WEB-INF/views/serviceOrder";
	}

}
