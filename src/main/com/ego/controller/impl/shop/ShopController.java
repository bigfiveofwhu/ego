package com.ego.controller.impl.shop;

import java.util.List;
import java.util.Map;

import com.ego.controller.ControllerSupport;
import com.ego.services.BaseServices;
import com.ego.services.impl.Ab01ServiceImpl;
import com.ego.services.impl.Ab02ServiceImpl;
import com.ego.services.impl.Ab03ServicesImpl;
import com.ego.services.impl.AdStatistic;
import com.ego.services.impl.shop.shopSercvice;

public class ShopController extends ControllerSupport 
{

	@Override
	public String execute() throws Exception 
	{
		this.dto.put("aab102", this.get("shopId"));
		//店铺基本信息只有一条
		this.setServices(new Ab01ServiceImpl());
		Map<String,String> ins=this.getServices().findById("aab102");
		this.saveAttribute("shop", ins);
		this.setServices(new Ab02ServiceImpl());
		List<Map<String,String>> rows=this.getServices().query("findProductsByAab102");
		for (Map<String, String> map : rows) {
			String info=map.get("aab208");
			map.put("path", info.substring(0, info.indexOf(";")));
		}
		this.saveAttribute("productList", rows);
		//更新广告信息
		if (this.get("aaa102")!=null&&!this.get("aaa102").equals("")) {
			String aad302=(String)this.get("aId");
			if (aad302!=null&&!aad302.equals("")) {
				dto.put("aad302", this.get("aId"));
				this.setServices(new AdStatistic());
				this.getServices().update("click");
			}
		}
		
		//获得热门商品和新增商品
		dto.put("products", rows);
		this.setServices(new shopSercvice());
		saveAttribute("hotProducts", this.getServices().query());
		this.setServices(new Ab02ServiceImpl());
		List<Map<String, String>> latestProducts=this.getServices().query("findByUpToDate");
		for (Map<String, String> map : latestProducts) {
			String info=map.get("aab208");
			map.put("path", info.substring(0, info.indexOf(";")));
		}
		saveAttribute("latestProducts",latestProducts);
		return "shop/home";
	}

	
}
