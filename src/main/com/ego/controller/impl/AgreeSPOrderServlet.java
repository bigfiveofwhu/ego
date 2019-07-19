package com.ego.controller.impl;

public class AgreeSPOrderServlet extends SPManageConntroller {

	@Override
	public String execute() throws Exception {
       if(this.getServices().update("okOrder"))
    	   this.saveAttribute("orderList", this.getServices().query("queryfororder"));
       
		return "houtai/html/service_provider/order";
	}

}
