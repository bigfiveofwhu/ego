package com.ego.controller.impl;

public class DelOrderByIdServlet extends OrderControllerSupport {

	@Override
	public String execute() throws Exception {
		this.update("delById", "ɾ������");
		this.savePageDataForDelete("allOrder");
		return "WEB-INF/views/order";
	}

}
