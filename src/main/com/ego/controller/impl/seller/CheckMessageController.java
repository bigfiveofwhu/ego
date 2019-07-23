package com.ego.controller.impl.seller;

import com.ego.controller.ControllerSupport;

public class CheckMessageController extends ControllerSupport
{
    @Override
    public String execute() throws Exception
    {
        this.saveAttribute("type", this.get("type"));
        return "houtai/html/seller/sellerpage/checkMessage";
    }
}
