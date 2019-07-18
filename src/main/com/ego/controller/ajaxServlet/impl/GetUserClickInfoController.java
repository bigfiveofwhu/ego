package com.ego.controller.ajaxServlet.impl;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import com.ego.controller.ajaxServlet.AjaxControllerSupport;
import com.ego.services.BaseServices;
import com.ego.services.impl.AdStatistic;

public class GetUserClickInfoController extends AjaxControllerSupport{

	BaseServices service=new AdStatistic();
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
			List<Map<String, String>> lists=service.query("getUserInfo");
			put("status", 0);
			put("message", "成功");
			put("data", lists);
			put("count",lists.size());
		} catch (Exception e) {
			// TODO: handle exception
			put("status", 1);
			put("message", "数据库错误");
			e.printStackTrace();
		}
		
	}

}
