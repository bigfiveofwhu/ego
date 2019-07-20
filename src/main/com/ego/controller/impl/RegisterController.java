package com.ego.controller.impl;

import java.util.Date;

import javax.servlet.http.HttpSession;

import com.ego.controller.ControllerSupport;
import com.ego.services.impl.Aa01ServiceImpl;

public class RegisterController extends ControllerSupport 
{
	@Override
	public String execute() throws Exception 
	{

		Boolean isVerified=(boolean)this.get("isVeriFied");   //记得做验证码的再次验证
		HttpSession session=this.getSession();
		if(isVerified==null || !isVerified)
		{
			this.saveAttribute("msg", "请输入验证码!");
	    	return "home/register";
		}
		long time=(long)session.getAttribute("isVerifiedTimeout");
	    long now=new Date().getTime();
	    if((now-time)>60000)    //失效一分钟  ,验证码失效
	    {
	    	this.saveAttribute("msg", "验证码已失效!");
	    	return "home/register";
	    }
		//去掉前后空格,以防后续分割出现异常
		String addr_1=((String)this.get("addr_1")).trim();
		String addr_2=((String)this.get("addr_2")).trim();
		String addr_3=((String)this.get("addr_3")).trim();
		String addr_4=((String)this.get("addr_4")).trim();
		this.dto.put("addr_1", addr_1);
		this.dto.put("addr_2", addr_2);
		this.dto.put("addr_3", addr_3);
		this.dto.put("addr_4", addr_4);
		this.setServices(new Aa01ServiceImpl());
		this.update("insertAa01", "注册");
		
		//this.saveAttribute("aaa102", this.get("aaa102"));
		/**
		 * aaa102,aaa106已通过dto双向传递
		 */
		session.setAttribute("aaa102", this.get("aaa102"));  //用户id
		session.setAttribute("aaa106", this.get("aaa106"));  //积分
		session.setAttribute("aaa103", this.get("username"));
		session.setAttribute("aaa104", this.get("email"));
		session.setAttribute("aaa108", this.get("phone"));
		//存入四级地址
		session.setAttribute("addr_1", addr_1);
		session.setAttribute("addr_2", addr_2);
		session.setAttribute("addr_3", addr_3);
		session.setAttribute("addr_4", addr_4);
		return "home/home";
	}
}
