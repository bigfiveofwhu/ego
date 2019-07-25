package com.ego.controller.impl;

import java.util.Map;

import javax.servlet.http.HttpSession;

import com.ego.system.utils.FileUpload;

public class ModifyUserInfoServlet extends UserControllerSupport {

	@Override
	public String execute() throws Exception 
	{
		// TODO Auto-generated method stub
		//System.out.println("modify" + this.get("imgName"));
		this.saveAttribute("imgName", this.get("imgName"));
		this.update("modifyUserInfo","修改");
		Map<String,String> user = this.getServices().findById();
		this.saveAttribute("user", user);
		HttpSession session=this.getSession();
		session.setAttribute("aaa103", user.get("aaa103"));  //用户名
		//session.setAttribute("aaa104", user.get("aaa104"));  //邮箱地址
		//session.setAttribute("aaa106", user.get("aaa106"));  //积分
		session.setAttribute("aaa108", user.get("aaa108"));  //电话号码
		return "person/information";
	}
}