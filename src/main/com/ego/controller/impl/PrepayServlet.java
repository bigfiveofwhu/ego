package com.ego.controller.impl;

import com.ego.services.impl.Ac04ServicesImpl;

public class PrepayServlet extends NeedControllerSupport 
{

	@Override
	public String execute() throws Exception 
	{
		this.update("prepay", "Ô¤¸¶");
		setServices(new Ac04ServicesImpl());
		this.savePageData("allServiceOrder");
		return "WEB-INF/views/serviceOrder";
	}

}
