package com.ego.controller.impl;

import java.util.List;
import java.util.Map;

public class ShowSPOrderServlet extends SPManageConntroller {

	@Override
	public String execute() throws Exception 
	{
        List<Map<String,String>> list = this.getServices().query("queryfororder");
        if(list.size() > 0)
        	this.saveAttribute("orderList", list);
		return "houtai/html/service_provider/order";
	}

}
