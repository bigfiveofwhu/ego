package com.ego.controller.ajaxServlet.impl;

import javax.servlet.http.HttpSession;

import com.ego.controller.ajaxServlet.AjaxControllerSupport;
import com.ego.services.impl.Aa03ServiceImpl;

public class AddCollectionController extends AjaxControllerSupport {

	@Override
	public void execute(HttpSession session) throws Exception {
           this.setService(new Aa03ServiceImpl());
           System.out.println("dto:" + this.dto);
           if(this.getService().update("addCollection"))
        	   this.put("tag", 1);
           else
        	   this.put("tag", 0);
	}

}
