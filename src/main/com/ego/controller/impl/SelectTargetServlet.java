package com.ego.controller.impl;

public class SelectTargetServlet extends NeedControllerSupport 
{

	@Override
	public String execute() throws Exception 
	{
		this.savePageInstance("selectTarget");
		return "WEB-INF/views/prepayService";
	}

}
