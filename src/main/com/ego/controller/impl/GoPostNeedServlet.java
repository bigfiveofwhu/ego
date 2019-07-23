package com.ego.controller.impl;

public class GoPostNeedServlet extends NeedControllerSupport 
{

	@Override
	public String execute() throws Exception 
	{
		this.savePageData("serviceType");
		return "WEB-INF/views/postNeed";
	}

}
