/**
 * @author zb
 */
package com.ego.controller.impl;

import java.util.List;
import java.util.Map;

public class AddProductServlet extends ProductControllerSupport {

	@Override
	public String execute() throws Exception 
	{
		if(this.getServices().update("addProduct"))
			System.out.println("添加商品成功");
		
		
		//this.saveDataPage
		List<Map<String,String>> list = this.getServices().query();
		System.out.println(list);
		if(list != null)
		this.saveAttribute("productList", list);
	
		return "houtai/html/seller/sellerpage/goods";
	}

}
