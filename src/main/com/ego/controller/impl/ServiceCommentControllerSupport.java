package com.ego.controller.impl;

import com.ego.controller.ControllerSupport;
import com.ego.services.impl.Ac05ServicesImpl;

public abstract class ServiceCommentControllerSupport extends ControllerSupport 
{
	public ServiceCommentControllerSupport() 
	{
		this.setServices(new Ac05ServicesImpl());
		System.out.println("***��ServiceCommentControllerSupport��,Ac05ServicesImpl��ʵ����***");
	}

}
