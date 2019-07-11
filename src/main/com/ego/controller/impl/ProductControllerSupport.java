package com.ego.controller.impl;

import com.ego.controller.ControllerSupport;
import com.ego.services.impl.ProductManageServicesImpl;

public abstract class ProductControllerSupport extends ControllerSupport {

    public ProductControllerSupport() 
  {
		this.setServices(new ProductManageServicesImpl());
	}

}
