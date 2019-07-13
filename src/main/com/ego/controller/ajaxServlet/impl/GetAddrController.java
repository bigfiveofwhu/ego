package com.ego.controller.ajaxServlet.impl;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import com.ego.controller.ajaxServlet.AjaxControllerSupport;
import com.ego.services.BaseServices;
import com.ego.services.impl.T_AreaService;

public class GetAddrController extends AjaxControllerSupport
{
	@Override
	public void execute(HttpSession session) throws Exception
	{
		BaseServices services=new T_AreaService();
		services.setMapDto(this.dto);
		try 
		{
			List<Map<String,String>> rows=services.query();
			this.put("addrs", rows);
			//System.out.println(rows);
		} catch (Exception e) 
		{
			e.printStackTrace();
		}
	}

}
