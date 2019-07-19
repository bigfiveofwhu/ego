package com.ego.controller.ajaxServlet.impl;

import java.util.Map;

import javax.servlet.http.HttpSession;

import com.ego.controller.ajaxServlet.AjaxControllerSupport;
import com.ego.services.BaseServices;
import com.ego.services.impl.AdvertiseService;

public class ChargeAccountController extends AjaxControllerSupport{

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
		if (service.update("recharge")) {
			put("result", true);
		}else {
			put("result", false);
		}
	}
	
}
