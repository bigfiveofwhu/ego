package com.ego.controller.impl;

public class PostAimedNeedServlet extends NeedControllerSupport 
{

	@Override
	public String execute() throws Exception 
	{
		this.update("postAimedNeed","添加定向需求");
		this.savePageData("allNeed");
		return "WEB-INF/views/serviceNeed";
	}

}
