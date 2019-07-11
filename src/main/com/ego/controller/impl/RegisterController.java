package com.ego.controller.impl;

import javax.servlet.http.HttpSession;

import com.ego.controller.ControllerSupport;
import com.ego.services.impl.Aa01Service;

public class RegisterController extends ControllerSupport 
{
	public RegisterController() 
	{
		this.setServices(new Aa01Service());
	}
	@Override
	public String execute() throws Exception 
	{

		String verifyCode=(String)this.get("verifyCode");   //记得做验证码的再次验证
		this.update("insertAa01", "注册");
		//this.saveAttribute("aaa102", this.get("aaa102"));
		//this.saveAttribute("aaa106", this.get("aaa106"));
		//this.saveAttribute("username", this.get("username"));
		//this.saveAttribute("email", this.get("email"));
		//this.saveAttribute("phone", this.get("phone"));
		//this.saveAttribute("realname", this.get("realname"));
		//this.saveAttribute("gender", this.get("gender"));
		//this.saveAttribute("birthday", this.get("birthday"));
		HttpSession session=this.getSession();
		session.setAttribute("session_uid", this.get("aaa102"));
		session.setAttribute("session_aaa106", this.get("aaa106"));  //积分
		session.setAttribute("session_username", this.get("username"));
		session.setAttribute("session_email", this.get("email"));
		session.setAttribute("session_phone", this.get("phone"));
		return "home/home";
	}

}
