package com.ego.controller.ajaxServlet.impl;

import javax.servlet.http.HttpSession;

import com.ego.controller.ajaxServlet.AjaxControllerSupport;
import com.ego.services.impl.Aa03ServiceImpl;
import com.ego.services.impl.PreferenceService;

public class AddCollectionController extends AjaxControllerSupport {

	@Override
	public void execute(HttpSession session) throws Exception {
           this.setService(new Aa03ServiceImpl());
           System.out.println("dto:" + this.dto);
           if(this.getService().update("addCollection"))
        	   this.put("tag", 1);
           else
        	   this.put("tag", 0);
           //修改用户偏好
           if (this.get("aaa302").equals("01")) {
        	   dto.put("aab203", this.get("aaa303"));
        	   this.setService(new PreferenceService());
               this.getService().update("like");
           }
           
	}

}
