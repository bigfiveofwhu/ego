package com.ego.controller.impl;

import java.util.List;
import java.util.Map;

public class ShowShopInfoServlet extends ShopControllerSupport {

	@Override
	public String execute() throws Exception {
        List<Map<String,String>> list = this.getServices().query("queryforshopinfo");
        if(list.size() > 0)
        	this.saveAttribute("shop", list.get(0));
		return "houtai/html/seller/sellerpage/sellerinfo";
	}

}
