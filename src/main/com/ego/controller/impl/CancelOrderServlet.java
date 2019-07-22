package com.ego.controller.impl;

public class CancelOrderServlet extends OrderControllerSupport 
{

	@Override
	public String execute() throws Exception 
	{
		this.update("cancel", "È¡Ïû¶©µ¥");
		this.savePageData("allOrder");
		return "WEB-INF/views/order";
	}

}
