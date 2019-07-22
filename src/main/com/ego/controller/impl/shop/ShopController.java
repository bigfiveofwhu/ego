package com.ego.controller.impl.shop;

import java.util.List;
import java.util.Map;

import com.ego.controller.ControllerSupport;
import com.ego.services.impl.Ab01ServiceImpl;
import com.ego.services.impl.Ab02ServiceImpl;
import com.ego.services.impl.AdStatistic;

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
		this.saveAttribute("productList", rows);
		//更新广告信息
		String aad302=(String)this.get("aId");
		if (aad302!=null&&!aad302.equals("")) {
			dto.put("aad302", this.get("aId"));
			this.setServices(new AdStatistic());
			this.getServices().update("click");
		}
		return "shop/home";
	}

}
