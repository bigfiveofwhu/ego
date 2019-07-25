package com.ego.controller.impl;

import java.util.List;
import java.util.Map;

import com.ego.controller.ControllerSupport;
import com.ego.services.impl.Aa03ServiceImpl;

public class ShowCollectionController extends ControllerSupport {

	@Override
	public String execute() throws Exception {
		this.setServices(new Aa03ServiceImpl());
		List<Map<String,String>> proList = this.getServices().query("product");
		List<Map<String,String>> shopList = this.getServices().query("shop");
		for(Map<String,String> map:proList)
		{
			String aab208 = map.get("aab208");
			if(aab208.contains(";"))
				map.put("imgPath", aab208.split(";")[0]);
			else
				map.put("imgPath", aab208);
		}
		this.saveAttribute("proList", proList); //收藏商品
		this.saveAttribute("shopList", shopList); //收藏商铺
		return "person/collection";
	}

}
