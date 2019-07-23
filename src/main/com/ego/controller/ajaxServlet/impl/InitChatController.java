package com.ego.controller.ajaxServlet.impl;

import javax.servlet.http.HttpSession;

import com.ego.controller.ajaxServlet.AjaxControllerSupport;
import com.ego.services.impl.Ae02ServicesImpl;

public class InitChatController extends AjaxControllerSupport
{

	@Override
	public void execute(HttpSession session) throws Exception
	{
		this.setService(new Ae02ServicesImpl());
		if(this.getService().update("insert"))
		{
			this.put("status", "200");
		}
		else
		{
			this.put("status", "201");  //Ê§°Ü
		}
	}

}
