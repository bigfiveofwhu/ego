package com.ego.controller.impl;

import com.ego.controller.BaseServlet;
import com.ego.controller.ControllerSupport;
import com.ego.services.impl.TestService;

public class TestController  extends ControllerSupport{

	
	
	public TestController() {
		// TODO Auto-generated constructor stub
		this.setServices(new TestService());
	}
	
	
	@Override
	public String execute() throws Exception {
		// TODO Auto-generated method stub
		this.savePageInstance("");
		return BaseServlet.prefix+"discount";
	}

}
