package com.ego.controller.impl;

import com.ego.controller.ControllerSupport;
import com.ego.services.impl.Ac06ServicesImpl;

public abstract class NeedControllerSupport extends ControllerSupport 
{
	public NeedControllerSupport() 
	{
		this.setServices(new Ac06ServicesImpl());
		System.out.println("***在NeedControllerSupport中,Ac06ServicesImpl被实例化***");
	}

}
