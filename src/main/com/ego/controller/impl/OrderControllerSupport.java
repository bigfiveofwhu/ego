package com.ego.controller.impl;

import com.ego.services.impl.Ab03ServicesImpl;
import com.ego.controller.ControllerSupport;

public abstract class OrderControllerSupport extends ControllerSupport {

	public OrderControllerSupport() {
		this.setServices(new Ab03ServicesImpl());
		System.out.println("***在OrderControllerSupport中,Ab03ServicesImpl被实例化***");
	}


}
