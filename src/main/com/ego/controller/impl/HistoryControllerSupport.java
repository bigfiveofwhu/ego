package com.ego.controller.impl;

import com.ego.controller.ControllerSupport;
import com.ego.services.impl.Aa07ServicesImpl;

public abstract class HistoryControllerSupport extends ControllerSupport 
{

	public HistoryControllerSupport() 
	{
		this.setServices(new Aa07ServicesImpl());
		System.out.println("***��HistoryControllerSupport��,Aa07ServicesImpl��ʵ����***");
	}

}
