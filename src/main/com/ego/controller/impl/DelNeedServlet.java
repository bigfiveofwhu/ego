package com.ego.controller.impl;

public class DelNeedServlet extends NeedControllerSupport 
{

	@Override
	public String execute() throws Exception 
	{
		this.update("del", "ɾ������");
		this.savePageData("allNeed");
		return "WEB-INF/views/serviceNeed";
	}

}
