package com.ego.controller.impl.localCity;

import com.ego.controller.ControllerSupport;

public class HomeController extends ControllerSupport 
{

	@Override
	public String execute() throws Exception 
	{
		this.saveAttribute("isSendRedirect", false);
		return "localCity/home";
	}

}
