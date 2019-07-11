package com.ego.controller.impl;

import java.util.HashMap;
import java.util.Map;


public class ShowUserInfoServlet extends UserControllerSupport
{
    
	
	@Override
	public String execute() throws Exception
	{
		Map<String,String> user = this.getServices().findById();
		this.saveAttribute("user", user);
		System.out.println(user);
		//User user = new User();
		//user.setUserName(user_info.get("aaa103"));
		
		
		return "person/information";
	}

}
