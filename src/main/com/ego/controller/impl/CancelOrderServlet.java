package com.ego.controller.impl;

public class CancelOrderServlet extends OrderControllerSupport 
{

	@Override
	public String execute() throws Exception 
	{
		this.update("cancel", "ȡ������");
		this.savePageData("allOrder");
		return "WEB-INF/views/order";
	}

}
