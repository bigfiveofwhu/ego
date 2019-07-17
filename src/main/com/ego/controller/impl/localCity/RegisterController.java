package com.ego.controller.impl.localCity;

import com.ego.controller.ControllerSupport;

public class RegisterController extends ControllerSupport
{

	@Override
	public String execute() throws Exception 
	{
		System.out.println("WEB-INF/views/localCity/register");
		return "WEB-INF/views/localCity/register";
	}

}
