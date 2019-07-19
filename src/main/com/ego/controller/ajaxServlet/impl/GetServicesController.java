package com.ego.controller.ajaxServlet.impl;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import com.ego.controller.ajaxServlet.AjaxControllerSupport;
import com.ego.services.impl.Ac02ServiceImpl;

public class GetServicesController extends AjaxControllerSupport
{

	@Override
	public void execute(HttpSession session) throws Exception
	{
		this.setService(new Ac02ServiceImpl());
		List<Map<String,String>> rows=this.getService().query("queryByAac102");
		this.put("services", rows);
	}

}
