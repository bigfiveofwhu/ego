package com.ego.controller.ajaxServlet.impl;

import java.util.Date;

import javax.servlet.http.HttpSession;

import com.ego.controller.ajaxServlet.AjaxControllerSupport;
import com.ego.system.utils.CodeVerify;

public class VerifyController extends AjaxControllerSupport 
{
	@Override
	public void execute(HttpSession session) throws Exception
	{
	    String verCode=(String)this.dto.get("verCode");
	    if(!CodeVerify.verify(session, verCode))
	    {
	    	this.put("status", "201");
	    	return;
	    }
	    session.setAttribute("isVeriFied", true);//���ϱ��
		session.setAttribute("isVerifiedTimeout", new Date().getTime());  //������ʼʱ��,��Чʱ��һ����
		session.setAttribute("internel", 180000L);
    	this.put("status", "200");
	}
}
