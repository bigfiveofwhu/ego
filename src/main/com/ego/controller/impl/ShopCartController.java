package com.ego.controller.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.ego.controller.ControllerSupport;
import com.ego.services.impl.Aa02ServiceImpl;

public class ShopCartController extends ControllerSupport
{

	@Override
	public String execute() throws Exception
	{
		if(this.get("aaa102")==null)  //未登录
		{
			this.saveAttribute("msg", "请先登录!");
			this.saveAttribute("isSendRedirect", false);  //不进行不进行重定向
			return "home/home";
		}
		this.setServices(new Aa02ServiceImpl());
		List<Map<String,String>> rows=this.getServices().query("queryByAaa102");
		this.saveAttribute("shopCart", rows);
		return "home/shopcart";
	}

}
