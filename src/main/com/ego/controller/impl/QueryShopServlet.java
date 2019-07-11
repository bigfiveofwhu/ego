package com.ego.controller.impl;

import java.util.List;
import java.util.Map;

public class QueryShopServlet extends ShopControllerSupport
{

	@Override
	public String execute() throws Exception
	{
		List<Map<String,String>> list = this.getServices().query();
		System.out.println(list);
		if(list != null)
		this.saveAttribute("shoplist", list);
		return "houtai/html/admin/seller";
	}

}
