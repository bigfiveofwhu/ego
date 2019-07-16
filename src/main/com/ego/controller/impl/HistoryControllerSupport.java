package com.ego.controller.impl;

import com.ego.controller.ControllerSupport;
import com.ego.services.impl.Aa07ServicesImpl;

public abstract class HistoryControllerSupport extends ControllerSupport 
{

	public HistoryControllerSupport() 
	{
		this.setServices(new Aa07ServicesImpl());
		System.out.println("***在HistoryControllerSupport中,Aa07ServicesImpl被实例化***");
	}

}
