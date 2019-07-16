package com.ego.controller.impl;

public class ShowRefundServlet extends RefundControllerSupport
{

	@Override
	public String execute() throws Exception 
	{
		this.savePageData("allRefund");
		return "WEB-INF/views/refund";
	}

}
