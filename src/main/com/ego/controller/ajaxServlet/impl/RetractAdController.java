package com.ego.controller.ajaxServlet.impl;

import java.util.Map;

import javax.servlet.http.HttpSession;

import com.ego.controller.ajaxServlet.AjaxControllerSupport;
import com.ego.services.BaseServices;
import com.ego.services.impl.AdvertiseService;
import com.ego.system.db.DBUtils;

public class RetractAdController extends AjaxControllerSupport{

	BaseServices service = new AdvertiseService();

	@Override
	public void setMap(Map<String, Object> dto) {
		// TODO Auto-generated method stub
		super.setMap(dto);
		service.setMapDto(dto);
	}
	
	@Override
	public void execute(HttpSession session) throws Exception {
		// TODO Auto-generated method stub
		try {
			DBUtils.beginTransaction();
			Map<String,String> ad=service.findById("getAdById");
			dto.put("increment", ad.get("aad304"));
			if (service.update("retractAd")&&service.update("recharge")) {
				put("result", true);
			}else {
				put("result", false);
			}
			DBUtils.commit();
		} catch (Exception e) {
			// TODO: handle exception
			put("result", false);
			put("reason", "Î´Öª´íÎó");
			DBUtils.rollback();
			e.printStackTrace();
		}finally {
			DBUtils.endTransaction();
		}
		
	}

}
