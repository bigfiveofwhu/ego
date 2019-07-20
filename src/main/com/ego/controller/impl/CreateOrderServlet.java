package com.ego.controller.impl;

public class CreateOrderServlet extends OrderControllerSupport
{

	@Override
	public String execute() throws Exception
	{
		return "WEB-INF/views/createOrder";
	}

}
