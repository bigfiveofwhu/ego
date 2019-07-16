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
			this.put("status", "202");   //δ��¼
			return;
		}
		this.setService(new Aa02ServiceImpl());
		boolean status=this.getService().update("insertAa02");
		if(status)
		{
			this.put("status", "200");    //�ɹ�״̬
		}else
		{
			this.put("status", "201");   //ʧ��״̬
		}
	}
}
