package com.ego.controller.impl;

public class RecieveOrderServlet extends OrderControllerSupport 
{
	@Override
	public String execute() throws Exception 
	{
		this.update("recieveOrder", "ȷ���ջ�");	
		this.update("addPointForOrder", "�����޸�");
		this.savePageInstance("detail");
		return "/WEB-INF/views/orderDetail";
	}

}
