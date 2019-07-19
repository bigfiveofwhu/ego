package com.ego.controller.ajaxServlet.impl;

import javax.servlet.http.HttpSession;

import com.ego.controller.ajaxServlet.AjaxControllerSupport;
import com.ego.services.impl.Aa02ServiceImpl;

public class UpdateShopCartController extends AjaxControllerSupport
{

	@Override
	public void execute(HttpSession session) throws Exception
	{
		if(session.getAttribute("aaa102")==null)   //未登录
		{
			this.put("status", "202");   //请登录
			return;
		}
		this.dto.put("aaa102", session.getAttribute("aaa102"));
		String type=(String)this.get("type");
		this.setService(new Aa02ServiceImpl());
		if(type.equals("0"))    //删除
		{
			this.put("className", this.get("className"));
			if(this.getService().update("deleteByAaa102AndAab203"))
			{
				int a=Integer.parseInt(session.getAttribute("shopCartCount").toString());   //更改session中购物车数量
				session.setAttribute("shopCartCount", --a+"");
				this.put("status", "200");
			}else
			{
				this.put("status", "201");
			}
		}else if(type.equals("1"))   //更新数量
		{
			this.put("count", this.get("aaa202"));
			if(this.getService().update("updateAaa202"))
			{
				this.put("status", "200");
			}else
			{
				this.put("status", "201");
			}
		}
	}

}
