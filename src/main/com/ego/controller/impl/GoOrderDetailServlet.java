package com.ego.controller.impl;

public class GoOrderDetailServlet extends OrderControllerSupport {

	@Override
	public String execute() throws Exception {
		this.savePageInstance("detail");
		return "WEB-INF/views/orderDetail";
	}

}
