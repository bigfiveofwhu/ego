package com.ego.controller.impl;

import java.util.List;
import java.util.Map;

public class QueryProductServlet extends ProductControllerSupport {

	@Override
	public String execute() throws Exception {
		List<Map<String,String>> list = this.getServices().query();
		System.out.println(list);
		if(list != null)
		this.saveAttribute("productList", list);
		// TODO return page
		return "houtai/html/seller/sellerpage/goods";
	}

}
