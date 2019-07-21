package com.ego.controller.ajaxServlet.impl;

import javax.servlet.http.HttpSession;

import com.ego.controller.ajaxServlet.AjaxControllerSupport;
import com.ego.services.impl.Aa03ServiceImpl;

public class DelCollectionController extends AjaxControllerSupport {

	@Override
	public void execute(HttpSession session) throws Exception 
	{
        this.setService(new Aa03ServiceImpl());
        this.getService().update("delCollectionById");
	}

}
