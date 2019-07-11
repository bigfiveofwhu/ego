package com.ego.controller.impl;

public class ModifyUserInfoServlet extends UserControllerSupport {

	@Override
	public String execute() throws Exception 
	{
		// TODO Auto-generated method stub
		this.update("modifyUserInfo","ÐÞ¸Ä");
		return "person/information";
	}
}