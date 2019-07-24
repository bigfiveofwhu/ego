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
		this.update("modifyUserInfo","�޸�");
		Map<String,String> user = this.getServices().findById();
		this.saveAttribute("user", user);
		HttpSession session=this.getSession();
		session.setAttribute("aaa103", user.get("aaa103"));  //�û���
		//session.setAttribute("aaa104", user.get("aaa104"));  //�����ַ
		//session.setAttribute("aaa106", user.get("aaa106"));  //����
		session.setAttribute("aaa108", user.get("aaa108"));  //�绰����
		return "person/information";
	}
}