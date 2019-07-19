package com.ego.controller.impl;

public class ShowNeedTargetServlet extends NeedControllerSupport 
{
	@Override
	public String execute() throws Exception 
	{
		this.savePageData("allTarget");
		return "WEB-INF/views/needTarget";
	}

}
