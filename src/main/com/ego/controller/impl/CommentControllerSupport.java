package com.ego.controller.impl;

import com.ego.controller.ControllerSupport;
import com.ego.services.impl.Ab04ServicesImpl;

public abstract class CommentControllerSupport extends ControllerSupport 
{

	public CommentControllerSupport() {
		this.setServices(new Ab04ServicesImpl());
		System.out.println("***在CommentControllerSupport中,Ab04ServicesImpl被实例化***");
	}

}
