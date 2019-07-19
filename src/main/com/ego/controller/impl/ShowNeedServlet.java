package com.ego.controller.impl;

public class ShowNeedServlet extends NeedControllerSupport 
{

	@Override
	public String execute() throws Exception 
	{
		this.savePageData("allNeed");
		return "WEB-INF/views/serviceNeed";
	}

}
