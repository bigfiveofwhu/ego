package com.ego.controller.ajaxServlet.impl;

import java.util.Map;

import javax.servlet.http.HttpSession;

import com.ego.controller.ajaxServlet.AjaxControllerSupport;
import com.ego.services.BaseServices;
import com.ego.services.impl.Ab05ServiceImpl;

public class UpdateCouponController extends AjaxControllerSupport {

	BaseServices service=new Ab05ServiceImpl();
	@Override
	public void setMap(Map<String, Object> dto) {
		// TODO Auto-generated method stub
		super.setMap(dto);
		service.setMapDto(dto);
	}

	@Override
	public void execute(HttpSession session) throws Exception {
		// TODO Auto-generated method stub
		boolean flag=service.update("updateCoupon");
		if (flag) {
			this.put("result", true);
		}else {
			this.put("result", false);
		}
	}

}
