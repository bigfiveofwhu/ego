package com.ego.controller.impl;

import com.ego.controller.ControllerSupport;

public class AddOrderServlet extends OrderControllerSupport 
{

	@Override
	public String execute() throws Exception {
		this.update("addOrder","�ύ����");
		this.savePageInstance("pay");
		return "WEB-INF/views/payOrder";//��ת��֧��ҳ��
	}

}
