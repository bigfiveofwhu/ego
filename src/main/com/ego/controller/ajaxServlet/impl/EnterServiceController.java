package com.ego.controller.ajaxServlet.impl;

import java.util.Map;

import javax.servlet.http.HttpSession;

import com.ego.controller.ajaxServlet.AjaxControllerSupport;
import com.ego.services.impl.Ac01ServiceImpl;

public class EnterServiceController extends AjaxControllerSupport
{

	@Override
	public void execute(HttpSession session) throws Exception 
	{
		this.setService(new Ac01ServiceImpl());
		Map<String,String> ins=this.getService().findById("checkService");
		if(ins==null)
		{
			this.put("status", "201"); //服务商状态异常
		}else {
			if(ins.get("aac108").toString().equals("02"))
			{
				this.put("status", "200");   //状态正常
			}else
			{
				this.put("status", "201");   //状态异常
			}
		}
	}

}
