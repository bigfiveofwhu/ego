package com.ego.controller.impl;

import com.ego.services.impl.Ac04ServicesImpl;

public class PrepayServlet extends NeedControllerSupport 
{

	@Override
	public String execute() throws Exception 
	{
		this.update("prepay", "预付");
		setServices(new Ac04ServicesImpl());
		this.update("allServiceOrder", "查询所有服务订单");
		return "WEB-INF/views/serviceOrder";
	}

}
