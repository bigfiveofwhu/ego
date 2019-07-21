package com.ego.controller.ajaxServlet.impl;

import javax.servlet.http.HttpSession;

import com.ego.controller.ajaxServlet.AjaxControllerSupport;
import com.ego.services.impl.Aa04ServiceImpl;

public class DealAddrController extends AjaxControllerSupport {

	@Override
	public void execute(HttpSession session) throws Exception 
	{
		this.setService(new Aa04ServiceImpl());
		String type =(String) this.get("type");
		switch (type) {
		case "addAddr":
			this.getService().update("addAddress");
			break;
		case "delAddr":
			this.getService().update("deleteById");
		default:
			break;
		}

	}

}
