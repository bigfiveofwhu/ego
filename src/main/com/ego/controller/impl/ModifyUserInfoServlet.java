package com.ego.controller.impl;

import com.ego.system.utils.FileUpload;

public class ModifyUserInfoServlet extends UserControllerSupport {

	@Override
	public String execute() throws Exception 
	{
		// TODO Auto-generated method stub
		this.update("modifyUserInfo","ÐÞ¸Ä");
		return "person/information";
	}
}