package com.ego.controller.impl;

import com.ego.controller.ControllerSupport;
import com.ego.services.impl.Ac04ServicesImpl;

public abstract class ServiceOrderControllerSupport extends ControllerSupport 
{
	public ServiceOrderControllerSupport() 
	{
		this.setServices(new Ac04ServicesImpl());
		System.out.println("***��ServerOrderControllerSupport��,Ac04ServicesImpl��ʵ����***");
	}

}
