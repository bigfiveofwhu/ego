package com.ego.controller.impl.shop;

import java.util.List;
import java.util.Map;

import com.ego.controller.ControllerSupport;
import com.ego.services.BaseServices;
import com.ego.services.impl.Ab01ServiceImpl;
import com.ego.services.impl.Ab02ServiceImpl;
import com.ego.services.impl.Ab03ServiceImpl;
import com.ego.services.impl.AdStatistic;

public class ShopController extends ControllerSupport 
{

	BaseServices ab03Service=new Ab03ServiceImpl();
	
	@Override
	public void setMapDto(Map<String, Object> dto) {
		// TODO Auto-generated method stub
		super.setMapDto(dto);
		ab03Service.setMapDto(dto);
	}
	
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
		if (this.get("aaa102")!=null&&!this.get("aaa102").equals("")) {
			String aad302=(String)this.get("aId");
			if (aad302!=null&&!aad302.equals("")) {
				dto.put("aad302", this.get("aId"));
				this.setServices(new AdStatistic());
				this.getServices().update("click");
			}
		}
		
		//获得热门商品和新增商品
		
		return "shop/home";
	}

	
}
