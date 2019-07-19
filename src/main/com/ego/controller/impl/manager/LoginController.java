package com.ego.controller.impl.manager;

import com.ego.controller.BaseServlet;
import com.ego.controller.ControllerSupport;

public class LoginController extends ControllerSupport{

	@Override
	public String execute() throws Exception {
		// TODO Auto-generated method stub
		return BaseServlet.prefix+"manager/login";
	}

}
