package com.ego.controller.impl;

public class PrepayServlet extends NeedControllerSupport 
{

	@Override
	public String execute() throws Exception 
	{
		this.update("prepay", "Ô¤¸¶");
		return "WEB-INF/views/serviceOrder";
	}

}
