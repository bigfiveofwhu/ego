package com.ego.controller.impl;

public class PostAimedNeedServlet extends NeedControllerSupport 
{

	@Override
	public String execute() throws Exception 
	{
		this.update("postAimedNeed","��Ӷ�������");
		this.savePageData("allNeed");
		return "WEB-INF/views/serviceNeed";
	}

}
