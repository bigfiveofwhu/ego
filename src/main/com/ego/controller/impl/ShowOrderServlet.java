package com.ego.controller.impl;

public class ShowOrderServlet extends OrderControllerSupport 
{
	@Override
	public String execute() throws Exception 
	{
		//点击订单管理按钮,查询订单并且跳转到订单页面
		this.savePageData("allOrder");
		return "WEB-INF/views/order";
	}

}
