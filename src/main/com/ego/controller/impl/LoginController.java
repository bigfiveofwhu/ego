package com.ego.controller.impl;

import java.util.Map;

import javax.servlet.http.HttpSession;

import com.ego.controller.ControllerSupport;
import com.ego.services.impl.Aa01Service;
import com.ego.services.impl.Ab01ServiceImpl;

public class LoginController extends ControllerSupport {

	public LoginController() 
	{
		this.setServices(new Aa01Service());
	}
	
	@Override
	public String execute() throws Exception 
	{
		//前后端字段名转换
		this.dto.put("aaa104", this.get("email"));
		this.dto.put("aaa107", this.get("pwd"));
		System.out.println(this.get("email").toString()+",  "+this.get("pwd").toString());
		Map<String,String> ins=this.getServices().findById("aaa104");
		if(ins==null)
		{
			this.saveAttribute("msg", "登录失败,请重新登录!");
			return "home/login";
		}
		HttpSession session=this.getSession();
		session.setAttribute("session_uid", ins.get("aaa102"));
		session.setAttribute("session_aaa106", ins.get("aaa106"));  //积分
		session.setAttribute("session_username", ins.get("aaa103"));
		session.setAttribute("session_email", ins.get("aaa104"));
		session.setAttribute("session_phone", ins.get("aaa108"));
		this.setServices(new Ab01ServiceImpl());
		ins=this.getServices().findById(null);
		if(ins!=null)
		{
			session.setAttribute("session_shopId", ins.get("aab102"));
		}
		return "home/home";
	}

}
