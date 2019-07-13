package com.ego.controller.impl;

import java.util.HashMap;
import java.util.Map;


public class ShowUserInfoServlet extends UserControllerSupport
{
    
	
	@Override
	public String execute() throws Exception
	{
		Map<String,String> user = this.getServices().findById();
		System.out.println(this.get("aaa102"));
		String imgName = "user"+"_"+this.get("aaa102");
		user.put("imgName", imgName);
		this.saveAttribute("user", user);
		System.out.println(user);
		//User user = new User();
		//user.setUserName(user_info.get("aaa103"));
		
		return "person/information";
	}

}
