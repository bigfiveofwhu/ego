package com.ego.controller.impl;

public class GoRefundDetailFOServlet extends RefundControllerSupport 
{
	@Override
	public String execute() throws Exception 
	{
		this.savePageInstance("refundDetailFromOrder");
		return "WEB-INF/views/refundDetail";
	}

}
