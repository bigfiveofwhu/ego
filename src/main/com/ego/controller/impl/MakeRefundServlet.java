package com.ego.controller.impl;

public class MakeRefundServlet extends RefundControllerSupport 
{

	@Override
	public String execute() throws Exception 
	{
		this.update("addRefund", "�ύ�ۺ�����");
		this.savePageData("allRefund");
		return "WEB-INF/views/refund";
	}

}