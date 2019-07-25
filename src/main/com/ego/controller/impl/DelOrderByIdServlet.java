package com.ego.controller.impl;

public class DelOrderByIdServlet extends OrderControllerSupport {

	@Override
	public String execute() throws Exception {
		this.update("delById", "É¾³ý¶©µ¥");
		this.savePageDataForDelete("allOrder");
		return "WEB-INF/views/order";
	}

}
