package com.ego.controller.impl;

import com.ego.services.impl.Ac04ServicesImpl;

public class PrepayServlet extends NeedControllerSupport 
{

	@Override
	public String execute() throws Exception 
	{
		this.update("prepay", "Ԥ��");
		setServices(new Ac04ServicesImpl());
		this.update("allServiceOrder", "��ѯ���з��񶩵�");
		return "WEB-INF/views/serviceOrder";
	}

}
