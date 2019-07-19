package com.ego.controller.impl;

import java.util.List;
import java.util.Map;

public class ShowAfterBuyServlet extends ShopControllerSupport {

	@Override
	public String execute() throws Exception {
		List<Map<String,String>> list = this.getServices().query("queryforafterbuy");
		this.saveAttribute("afterbuyList", list);
		return "houtai/html/seller/sellerpage/shouhou";
	}

}
