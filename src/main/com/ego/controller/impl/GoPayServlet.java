package com.ego.controller.impl;

public class GoPayServlet extends OrderControllerSupport {

	@Override
	public String execute() throws Exception {
		this.savePageInstance("pay");
		System.out.println("***ʵ����ѯ�ɹ�***");
		return "payOrder";//��ת��֧��ҳ��
	}

}
