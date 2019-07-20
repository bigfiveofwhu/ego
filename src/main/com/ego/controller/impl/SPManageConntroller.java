package com.ego.controller.impl;

import com.ego.controller.ControllerSupport;
import com.ego.services.impl.seller.SPManageServicesImpl;

abstract class SPManageConntroller extends ControllerSupport {

   public SPManageConntroller() {
      this.setServices(new SPManageServicesImpl());
   }

}
