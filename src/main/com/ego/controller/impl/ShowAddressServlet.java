package com.ego.controller.impl;

import java.util.List;
import java.util.Map;

public class ShowAddressServlet extends AddressControllerSupport {

	@Override
	public String execute() throws Exception {
		List<Map<String,String>> list = this.getServices().query();
		if(list.size() > 0)
		{
			//System.out.println(list);
		  this.saveAttribute("addrlist", list);
		}
		return "person/address";
	}

}
