package com.ego.controller.ajaxServlet.impl;

import java.util.Map;

import javax.servlet.http.HttpSession;

import com.ego.controller.ajaxServlet.AjaxControllerSupport;
import com.ego.services.BaseServices;
import com.ego.services.impl.Ab05ServiceImpl;

public class AddCouponController extends AjaxControllerSupport{

	BaseServices service=new Ab05ServiceImpl();
	@Override
	public void setMap(Map<String, Object> dto) {
		// TODO Auto-generated method stub
		super.setMap(dto);
		service.setMapDto(dto);
	}
	
	@Override
	public void execute(HttpSession session) {
		// TODO Auto-generated method stub
		try {
			this.put("result", service.update("addCoupon"));
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			this.put("result", false);
		}
	}
}
