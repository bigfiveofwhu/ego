package com.ego.controller.impl;

public class RecieveOrderServlet extends OrderControllerSupport 
{
	@Override
	public String execute() throws Exception 
	{
		this.update("recieveOrder", "确认收货");	
		this.update("addPointForOrder", "积分修改");
		this.savePageInstance("detail");
		return "/WEB-INF/views/orderDetail";
	}

}
