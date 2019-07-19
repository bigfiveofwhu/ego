package com.ego.controller.impl;

public class AddServiceServlet extends SPManageConntroller {

	@Override
	public String execute() throws Exception {
     if(this.getServices().update("addService"))
    	 this.saveAttribute("msg", "Ìí¼Ó³É¹¦");
		return "houtai/html/service_provider/service_edit";
	}

}
