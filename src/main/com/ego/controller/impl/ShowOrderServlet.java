package com.ego.controller.impl;

public class ShowOrderServlet extends OrderControllerSupport 
{
	@Override
	public String execute() throws Exception 
	{
		//�����������ť,��ѯ����������ת������ҳ��
		this.savePageData("allOrder");
		return "WEB-INF/views/order";
	}

}
