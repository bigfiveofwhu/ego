package com.ego.controller.impl;

import com.ego.services.impl.UserManageServicesImpl;
import com.ego.controller.ControllerSupport;

public abstract class UserControllerSupport extends ControllerSupport {

       public UserControllerSupport() 
    {
		this.setServices(new UserManageServicesImpl());
	}

}
