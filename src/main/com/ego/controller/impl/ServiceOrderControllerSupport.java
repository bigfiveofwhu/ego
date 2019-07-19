package com.ego.controller.impl;

import com.ego.controller.ControllerSupport;
import com.ego.services.impl.Ac04ServicesImpl;

public abstract class ServiceOrderControllerSupport extends ControllerSupport 
{
	public ServiceOrderControllerSupport() 
	{
		this.setServices(new Ac04ServicesImpl());
		System.out.println("***在ServerOrderControllerSupport中,Ac04ServicesImpl被实例化***");
	}

}
