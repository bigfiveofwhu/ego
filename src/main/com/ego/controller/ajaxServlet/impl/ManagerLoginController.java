package com.ego.controller.ajaxServlet.impl;

import java.util.Map;

import javax.servlet.http.HttpSession;

import com.ego.controller.ajaxServlet.AjaxControllerSupport;
import com.ego.services.BaseServices;
import com.ego.services.impl.manager.ManagerService;

public class ManagerLoginController extends AjaxControllerSupport{
	BaseServices service=new ManagerService();
	@Override
	public void setMap(Map<String, Object> dto) {
		// TODO Auto-generated method stub
		super.setMap(dto);
		service.setMapDto(dto);
	}
	@Override
	public void execute(HttpSession session) throws Exception {
		// TODO Auto-generated method stub
		if (this.get("aad102").equals("0")) {
			this.put("result", false);
			return ;
		};
		String password=service.findById("getPassword").get("aad103");//获得数据库的密码
		String userInput=get("aad103").toString();//获得前端用户输入的密码
		if (password.equals(userInput)) {
			session.setAttribute("aad102", get("aad102"));
			put("result", true);
		}else {
			put("result", false);
		}
	}
}
