package com.ego.controller.ajaxServlet.impl;

import javax.servlet.http.HttpSession;

import com.ego.controller.ajaxServlet.AjaxControllerSupport;
import com.ego.services.impl.ShopManageServicesImpl;

public class DealAfterBuyController extends AjaxControllerSupport {

	@Override
	public void execute(HttpSession session) throws Exception {

		this.setService(new ShopManageServicesImpl());
		this.getService().update("dealShouhou");
		this.put("tag", 1);
	}

}
