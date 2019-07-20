package com.ego.controller.impl;

import java.util.List;
import java.util.Map;

public class ShowSPServiceServlet extends SPManageConntroller {

	@Override
	public String execute() throws Exception {
      List<Map<String,String>> list = this.getServices().query("queryforservice");
      if(list.size() > 0)
    	  this.saveAttribute("serviceList", list);
		return "houtai/html/service_provider/services";
	}

}
