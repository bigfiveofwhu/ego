package com.ego.controller.impl;

import com.ego.controller.ControllerSupport;
import com.ego.services.impl.Aa01Service;

public class RegisterController extends ControllerSupport 
{

	@Override
	public String execute() throws Exception 
	{
		this.setServices(new Aa01Service());
		this.update("", "×¢²á³É¹¦");
		return "home/register";
	}

}
