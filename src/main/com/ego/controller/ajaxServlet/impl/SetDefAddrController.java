package com.ego.controller.ajaxServlet.impl;

import javax.servlet.http.HttpSession;

import com.ego.controller.ajaxServlet.AjaxControllerSupport;
import com.ego.services.BaseServices;
import com.ego.services.impl.Aa04ServiceImpl;

public class SetDefAddrController extends AjaxControllerSupport {


	@Override
	public void execute(HttpSession session)
	{
		BaseServices service=new Aa04ServiceImpl();
		service.setMapDto(this.dto);
		try
		{
			service.update("setDefaultAddress");
		} catch (Exception e) 
		{
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		//this.dto.get("aaa401");
	}

}
