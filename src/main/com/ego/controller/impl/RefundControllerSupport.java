package com.ego.controller.impl;

import com.ego.controller.ControllerSupport;
import com.ego.services.impl.Aa08ServicesImpl;

public abstract class RefundControllerSupport extends ControllerSupport 
{
	public RefundControllerSupport() 
	{
		this.setServices(new Aa08ServicesImpl());
		System.out.println("***��RefundControllerSupport��,Aa08ServicesImpl��ʵ����***");
	}

}
