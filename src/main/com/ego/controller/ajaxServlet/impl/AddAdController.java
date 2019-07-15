package com.ego.controller.ajaxServlet.impl;

import java.util.Map;

import javax.servlet.http.HttpSession;

import com.ego.controller.ajaxServlet.AjaxControllerSupport;
import com.ego.services.BaseServices;
import com.ego.services.impl.AdvertiseService;
import com.ego.system.utils.FileUpload;

public class AddAdController extends AjaxControllerSupport{

	BaseServices service=new AdvertiseService();
	@Override
	public void setMap(Map<String, Object> dto) {
		// TODO Auto-generated method stub
		super.setMap(dto);
		service.setMapDto(dto);
	}
	
	@Override
	public void execute(HttpSession session) throws Exception {
		// TODO Auto-generated method stub
		boolean result=service.update("insertAd");
		if (result) {
			this.put("result", true);
		}else {
			this.put("result", false);
		}
	}

}
