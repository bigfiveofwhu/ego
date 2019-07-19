package com.ego.controller.impl;

import java.util.Map;

import com.ego.system.utils.FileUpload;

public class ModifyUserInfoServlet extends UserControllerSupport {

	@Override
	public String execute() throws Exception 
	{
		// TODO Auto-generated method stub
		//System.out.println("modify" + this.get("imgName"));
		this.saveAttribute("imgName", this.get("imgName"));
		this.update("modifyUserInfo","ÐÞ¸Ä");
		Map<String,String> user = this.getServices().findById();
		this.saveAttribute("user", user);
		return "person/information";
	}
}