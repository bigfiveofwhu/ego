package com.ego.controller.impl;

import com.ego.controller.ControllerSupport;
import com.ego.services.impl.Ab01ServiceImpl;

public class ShopRegisterController extends ControllerSupport
{
	public ShopRegisterController() 
	{
		this.setServices(new Ab01ServiceImpl());
	}

	@Override
	public String execute() throws Exception
	{
		String uid=(String)this.get("uid");
		/*if(!this.detectionLogin(uid)) 
		{
			return "home/home";
		}*/
		return "WEB-INF/views/shop/register";
	}

}
