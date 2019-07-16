package com.ego.controller.impl;

public class MakeRefundServlet extends RefundControllerSupport 
{

	@Override
	public String execute() throws Exception 
	{
		this.update("addRefund", "提交售后请求");
		this.savePageData("allRefund");
		return "WEB-INF/views/refund";
	}

}