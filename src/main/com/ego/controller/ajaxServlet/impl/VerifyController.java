package com.ego.controller.ajaxServlet.impl;

import java.io.PrintWriter;
import java.util.Date;
import java.util.Map;

import javax.servlet.http.HttpSession;

import com.alibaba.fastjson.JSONObject;
import com.ego.controller.ajaxServlet.AjaxControllerSupport;

public class VerifyController extends AjaxControllerSupport 
{
	@Override
	public void execute(HttpSession session)
	{
	    String verCode=(String)this.dto.get("verCode");
	    String code=(String)session.getAttribute("regVerCode");
	    long time=(long)session.getAttribute("regVerCodeTime");
	    long now=new Date().getTime();
	    if((now-time)>300000)
	    {
	    	this.put("status", "201");
	    }
	    else
	    {
	    	if(verCode.equals(code))
	    	{
		    	this.put("status", "200");	
	    	}
	    	else
	    	{
	    		this.put("status", "201");
	    	}
	    }
	}
}
