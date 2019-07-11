package com.ego.controller.impl;

import java.util.Map;

public class EditAddressServlet extends AddressControllerSupport {

	@Override
	public String execute() throws Exception {
		this.update("editAddress", "ÐÞ¸Ä");
		Map<String,String> map = this.getServices().findById();
		if(map != null)
		{
			String addr[] = map.get("aaa402").split(" ");
			//if(addr != null)
			for(int i = 0;i<addr.length;i++)
			{
				int index = i+1;
				map.put("addr_"+index, addr[i]);
			}
			
			this.saveAttribute("address", map);
			
		}
		return "person/editaddress";
	}

}
