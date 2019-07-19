package com.ego.controller.ajaxServlet.impl;

import java.util.Map;

import javax.servlet.http.HttpSession;

import com.ego.controller.ajaxServlet.AjaxControllerSupport;
import com.ego.services.BaseServices;
import com.ego.services.impl.Aa05ServiceImpl;

/**
 * 删除用户过期的优惠券
 * @author lenovo
 *
 */
public class DeleteUserCouponController extends AjaxControllerSupport{

	BaseServices service=new Aa05ServiceImpl();
	@Override
		public void setMap(Map<String, Object> dto) {
			// TODO Auto-generated method stub
			super.setMap(dto);
			service.setMapDto(dto);
		}
	@Override
	public void execute(HttpSession session) throws Exception {
		// TODO Auto-generated method stub
		if (service.update("removeCoupon")) {
			put("result", true);
		}else {
			put("result", false);
		}
	}
}
