package com.ego.controller.impl;

public class GoRefundDetailServlet extends RefundControllerSupport 
{

	@Override
	public String execute() throws Exception 
	{
		this.savePageInstance("refundDetail");
		return "WEB-INF/views/refundDetail";
	}

}
