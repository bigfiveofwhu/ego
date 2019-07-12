package com.ego.controller.impl;

public class GoPayServlet extends OrderControllerSupport {

	@Override
	public String execute() throws Exception {
		this.savePageInstance("pay");
		System.out.println("***实例查询成功***");
		return "payOrder";//跳转到支付页面
	}

}
