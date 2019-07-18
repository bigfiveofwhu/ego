/**
 * @author zb
 */
package com.ego.controller.impl;

import java.util.List;
import java.util.Map;

import com.ego.system.tools.Tools;

public class ShowShopOrderServlet extends ShopControllerSupport {

	@Override
	public String execute() throws Exception 
	{
       List<Map<String,String>> list = this.getServices().query("queryfororder");
       for(Map<String,String> map:list)
       {
    	   double total = Tools.changeDouble(map.get("aab314")) * Tools.changeDouble(map.get("aab310"));
    	   map.put("totalmoney", Double.toString(total));
       }
       this.saveAttribute("orderList", list);
		return "houtai/html/seller/sellerpage/order_info";
	}

}
