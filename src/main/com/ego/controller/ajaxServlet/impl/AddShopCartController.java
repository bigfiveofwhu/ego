package com.ego.controller.ajaxServlet.impl;

import javax.servlet.http.HttpSession;

import com.ego.controller.ajaxServlet.AjaxControllerSupport;
import com.ego.services.impl.Aa02ServiceImpl;

public class AddShopCartController extends AjaxControllerSupport
{

	@Override
	public void execute(HttpSession session) throws Exception
	{
		if(session.getAttribute("aaa102")==null)
		{
			this.put("status", "202");   //未登录
			return;
		}
		this.setService(new Aa02ServiceImpl());
		boolean status=this.getService().update("insertAa02");
		if(status)
		{
			if(this.get("addCartCount")!=null)
			{
				int a=Integer.parseInt(session.getAttribute("shopCartCount").toString());   //更改session中购物车数量
				session.setAttribute("shopCartCount", ++a+"");
			}
			this.put("status", "200");    //成功状态
		}else
		{
			this.put("status", "201");   //失败状态
		}
	}
}
