package com.ego.controller.impl;

import java.util.Map;

public class ShowSPInfoServlet extends SPManageConntroller {

	@Override
	public String execute() throws Exception {
       Map<String,String> map = this.getServices().findById();	
         this.saveAttribute("sp", map);
    		   return "houtai/html/service_provider/sp_info";
	}

}
