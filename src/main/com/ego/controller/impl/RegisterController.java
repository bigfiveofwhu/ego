package com.ego.controller.impl;

import com.ego.controller.ControllerSupport;
import com.ego.services.impl.Aa01Service;

public class RegisterController extends ControllerSupport 
{

	@Override
	public String execute() throws Exception 
	{
		this.setServices(new Aa01Service());
		this.update("", "ע��ɹ�");
		return "home/register";
	}

}
