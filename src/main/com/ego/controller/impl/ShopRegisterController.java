package com.ego.controller.impl;

import java.util.Map;

import javax.servlet.http.HttpSession;

import com.ego.controller.ControllerSupport;
import com.ego.services.impl.Aa01ServiceImpl;
import com.ego.services.impl.Ab01ServiceImpl;

public class ShopRegisterController extends ControllerSupport
{
	@Override
	public String execute() throws Exception
	{
		HttpSession session=this.getSession();
		//检测用户是否登录
		Object uid=session.getAttribute("aaa102"); //用户id
		System.out.println("uid: "+uid);
		if(uid==null) 
		{
			this.saveAttribute("msg", "请登录!");
			return "home/home";
		}
		//检测是否已注册店铺
		Object shopId=session.getAttribute("aab102");   //店铺id
		System.out.println("shopId: "+shopId);
		if(shopId!=null)
		{
			this.saveAttribute("msg", "已注册店铺,请勿再次尝试!");
			return "home/home";
		}
		//已登录并且未注册店铺可进入
		return "WEB-INF/views/shop/register";
	}
}
