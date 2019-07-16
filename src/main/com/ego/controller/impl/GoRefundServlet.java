package com.ego.controller.impl;

public class GoRefundServlet extends OrderControllerSupport 
{
	@Override
	public String execute() throws Exception 
	{
		this.savePageInstance("refund");
		return "WEB-INF/views/makeRefund";
	}

}
