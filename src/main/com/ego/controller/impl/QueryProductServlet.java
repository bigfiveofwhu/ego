/**
 * @author zb
 */
package com.ego.controller.impl;

import java.util.List;
import java.util.Map;

import com.ego.system.tools.Tools;

public class QueryProductServlet extends ProductControllerSupport {

	@Override
	public String execute() throws Exception {
		List<Map<String,String>> list = this.getServices().query();
//		for(Map<String,String> map:list)
//		{
//			String code = map.get("aab204");
//			map.put("cnaab204", Tools.getTriSort(code));
//		}
//		System.out.println(list);
		if(list != null)
		this.saveAttribute("productList", list);
		//System.out.println("productList:  "+list);
		// TODO return page
		return "houtai/html/seller/sellerpage/goods";
	}

}
