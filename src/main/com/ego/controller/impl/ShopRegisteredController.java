package com.ego.controller.impl;

import com.ego.controller.ControllerSupport;
import com.ego.services.impl.Ab01ServiceImpl;
import com.ego.services.impl.Ad08ServicesImpl;

public class ShopRegisteredController extends ControllerSupport 
{	
	@Override
	public String execute() throws Exception 
	{
		//向店铺中插入数据
		this.setServices(new Ab01ServiceImpl());
		this.dto.put("aab103", this.get("shopname"));
		String addr_1=(String)this.get("addr_1");
		String addr_2=(String)this.get("addr_2");
		String addr_3=(String)this.get("addr_3");
		String addr_4=(String)this.get("addr_4");
		//后续可添加店铺的四级地址
		
		String shopaddr=addr_1.trim()+" "+addr_2.trim()+" "+addr_3.trim()+" "+addr_4.trim();
		this.dto.put("aab105", shopaddr);  				//店铺地址
		this.dto.put("aab106", this.get("subscribe"));  //店铺描述
		this.dto.put("aab108", this.get("amount"));    //保证金
		this.getServices().update("insertShop");
		//向审核表提交数据
		this.setServices(new Ad08ServicesImpl());
		this.dto.put("aad802", this.get("subscribe"));
		this.dto.put("aad805", this.get("aab102"));
		this.dto.put("aad803", "01");   //审核类型 01--店铺注册
		this.getServices().update("insertAd08");
		this.getSession().setAttribute("aab102", this.get("aab102"));  //店铺id
		this.saveAttribute("msg", "提交审核成功!请耐心等待,后续会以邮件通知!");
		return "home/home";
		//return "WEB-INF/views/shop/register";
	}

}
