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
			System.out.println("�绰����:"+object);
			this.put("status", "201");
		}
		else
		{
			System.out.println("�����ַ:"+object);
			String title="eGo�̳�ע����֤��";
			String code_6=SendEmail.random_6_Code();
			session.setAttribute("regVerCode", code_6);
			session.setAttribute("regVerCodeTime", new Date().getTime());
			String content="��ͨ��Աע����֤��Ϊ:"+code_6+",5��������Ч.";
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
