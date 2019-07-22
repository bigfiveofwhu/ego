package com.ego.controller.impl;

import java.util.List;
import java.util.Map;

public class AddAddressServlet extends AddressControllerSupport {

	@Override
	public String execute() throws Exception 
	{
        this.update("addAddress","���ӵ�ַ");
    	List<Map<String,String>> list = this.getServices().query();
		if(list.size() > 0)
		{
			//System.out.println(list);
		  this.saveAttribute("addrlist", list);
		}

		    return "person/address";
	}
}
