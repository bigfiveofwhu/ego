package com.ego.controller.ajaxServlet.impl;

import java.util.Date;

import javax.servlet.http.HttpSession;

import com.ego.controller.ajaxServlet.AjaxControllerSupport;

public class VerifyController extends AjaxControllerSupport 
{
	@Override
	public void execute(HttpSession session) throws Exception
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
	    	if(verCode.equals(code))   //在此处验证, 通过后移除相应属性
	    	{
	    		session.setAttribute("isVeriFied", true);//做上标记
	    		session.setAttribute("isVerifiedTimeout", new Date().getTime());  //定义起始时间,有效时长一分钟
	    		session.removeAttribute("regVerCode");
	    		session.removeAttribute("regVerCodeTime");
		    	this.put("status", "200");
	    	}
	    	else
	    	{
	    		this.put("status", "201");
	    	}
	    }
	}
}
