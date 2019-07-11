package com.ego.controller.impl;

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
		this.update("", "зЂВс");
		return "home/home";
	}

}
