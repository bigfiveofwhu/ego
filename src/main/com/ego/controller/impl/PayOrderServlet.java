package com.ego.controller.impl;

public class PayOrderServlet extends OrderControllerSupport {

	@Override
	public String execute() throws Exception {
		this.update("payOrder", "Ö§¸¶");
		this.savePageInstance("pay");
		return "WEB-INF/views/success";
	}

}
