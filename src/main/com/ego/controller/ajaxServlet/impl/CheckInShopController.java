package com.ego.controller.ajaxServlet.impl;

import javax.servlet.http.HttpSession;

import com.ego.controller.ajaxServlet.AjaxControllerSupport;
import com.ego.services.impl.ShopManageServicesImpl;

public class CheckInShopController extends AjaxControllerSupport {

	@Override
	public void execute(HttpSession session) throws Exception {
		this.setService(new ShopManageServicesImpl());
		if(this.getService().update("checkIn"))
			this.put("check", 1);
		else
			this.put("check", 0);
	}

}
