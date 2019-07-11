package com.ego.controller.impl;

import com.ego.controller.ControllerSupport;
import com.ego.services.impl.Aa04ServiceImpl;

public abstract class AddressControllerSupport extends ControllerSupport 
{
   public AddressControllerSupport() 
   {
    this.setServices(new Aa04ServiceImpl());
   }
}
