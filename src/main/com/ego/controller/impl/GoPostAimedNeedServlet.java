package com.ego.controller.impl;

public class GoPostAimedNeedServlet extends NeedControllerSupport 
{

	@Override
	public String execute() throws Exception 
	{
		this.savePageInstance("service");
		return "WEB-INF/views/postAimedNeed";
	}

}
