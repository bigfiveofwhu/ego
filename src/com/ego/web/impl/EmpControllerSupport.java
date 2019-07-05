package com.ego.web.impl;

import com.ego.services.impl.Ab01ServicesImpl;
import com.ego.web.support.ControllerSupport;

public abstract class EmpControllerSupport extends ControllerSupport
{
	public EmpControllerSupport() 
	{
		this.setServices(new Ab01ServicesImpl());
	}
}
