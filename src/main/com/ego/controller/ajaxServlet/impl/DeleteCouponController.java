package com.ego.controller.ajaxServlet.impl;

import java.util.Map;

import javax.servlet.http.HttpSession;

import com.ego.controller.ajaxServlet.AjaxControllerSupport;
import com.ego.services.BaseServices;
import com.ego.services.impl.Ab05ServiceImpl;

public class DeleteCouponController extends AjaxControllerSupport{

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
		boolean flag=service.update("delete");
		if (flag) {
			put("result", true);	
		}else {
			put("result", false);
		}
	}

}
