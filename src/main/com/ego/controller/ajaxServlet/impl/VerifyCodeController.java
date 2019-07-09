package com.ego.controller.ajaxServlet.impl;

import java.io.PrintWriter;
import java.util.Date;
import java.util.Map;

import javax.servlet.http.HttpSession;

import com.alibaba.fastjson.JSONObject;
import com.ego.controller.ajaxServlet.AjaxControllerSupport;
import com.ego.system.utils.SendEmail;

public class VerifyCodeController extends AjaxControllerSupport 
{

	@Override
	public void execute(HttpSession session) 
	{
	    String object=(String)this.dto.get("object");
		if(!object.contains("@"))
		{
			System.out.println("电话号码:"+object);
			this.put("status", "201");
		}
		else
		{
			System.out.println("邮箱地址:"+object);
			String title="eGo商城注册验证码";
			String code_6=SendEmail.random_6_Code();
			session.setAttribute("regVerCode", code_6);
			session.setAttribute("regVerCodeTime", new Date().getTime());
			String content="普通会员注册验证码为:"+code_6+",5分钟内有效.";
			try 
			{
				SendEmail.send(object,title,content);
		        this.put("status", "200");
			} 
			catch (Exception e) 
			{
				this.put("status", "201");
				e.printStackTrace();
			}
		}
	}

}
