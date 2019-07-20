package com.ego.controller.ajaxServlet.impl;

import com.ego.controller.ajaxServlet.AjaxControllerSupport;
import com.ego.services.BaseServices;
import com.ego.services.impl.Ae01ServicesImpl;

import javax.servlet.http.HttpSession;

public class UpdateStateController extends AjaxControllerSupport{
    @Override
    public void execute(HttpSession session) throws Exception {
        BaseServices services=new Ae01ServicesImpl();
        services.setMapDto(this.dto);
        services.update("modify");
        this.put("msg","³É¹¦");
    }
}
