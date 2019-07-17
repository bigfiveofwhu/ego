
package com.ego.controller.impl;

import com.ego.controller.ControllerSupport;
import com.ego.services.impl.ShopManageServicesImpl;

public abstract class ShopControllerSupport extends ControllerSupport {

	public ShopControllerSupport()
	{
		this.setServices(new ShopManageServicesImpl());
	}
}