package com.ego.controller.impl;

import java.util.List;
import java.util.Map;

public class DeliverGoodsServlet extends ShopControllerSupport {

	@Override
	public String execute() throws Exception
	{
		if(this.getServices().update("deliverGoods"))
			this.saveAttribute("msg", "发货成功");
		List<Map<String,String>> list = this.getServices().query("queryfororder");
		if(list.size() > 0)
		this.saveAttribute("orderList", list);
			
		return "houtai/html/seller/sellerpage/order_info";
	}

}
