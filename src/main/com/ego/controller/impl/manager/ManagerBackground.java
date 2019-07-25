package com.ego.controller.impl.manager;

import com.ego.controller.BaseServlet;
import com.ego.controller.ControllerSupport;

public class ManagerBackground extends ControllerSupport{

	@Override
	public String execute() throws Exception {
		// TODO Auto-generated method stub
		if (getSession().getAttribute("aad102")==null) {
			return BaseServlet.prefix+"manager/login";
		}else {
			return "houtai/html/admin/index";
		}
	}

}
