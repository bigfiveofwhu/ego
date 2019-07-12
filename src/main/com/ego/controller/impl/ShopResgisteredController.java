package com.ego.controller.impl;

import com.ego.controller.ControllerSupport;
import com.ego.services.impl.Ab01ServiceImpl;
import com.ego.services.impl.Ad08ServicesImpl;

public class ShopResgisteredController extends ControllerSupport 
{

	public ShopResgisteredController() 
	{
		this.setServices(new Ab01ServiceImpl());
	}
	
	@Override
	public String execute() throws Exception 
	{
		//向店铺中插入数据
		this.dto.put("aab103", this.get("shopname"));
		this.dto.put("aab105", this.get("shopaddr"));  //店铺地址
		this.dto.put("aab106", this.get("subscribe"));
		this.dto.put("aab108", this.get("amount"));    //保证金
		this.getServices().update("insertShop");
		//向审核表提交数据
		this.setServices(new Ad08ServicesImpl());
		this.setMapDto(this.dto);
		this.dto.put("aad802", this.get("subscribe"));
		this.dto.put("aad805", this.get("aab102"));
		this.getServices().update("insertAd08");
		
		this.saveAttribute("msg", "提交审核成功!");
		return "WEB-INF/views/shop/register";
	}

}
