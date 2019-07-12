package com.ego.controller.impl;

import com.ego.controller.ControllerSupport;

public class AddOrderServlet extends OrderControllerSupport 
{

	@Override
	public String execute() throws Exception {
		this.update("addOrder","提交订单");
		this.savePageInstance("pay");
		return "WEB-INF/views/payOrder";//跳转到支付页面
	}

}
