package com.ego.controller.ajaxServlet.impl;

import javax.servlet.http.HttpSession;

import com.ego.controller.ajaxServlet.AjaxControllerSupport;
import com.ego.services.BaseServices;
import com.ego.services.impl.UserManageServicesImpl;

public class ModifyEmailController extends AjaxControllerSupport {

	@Override
	public void execute(HttpSession session) {
		BaseServices services = new UserManageServicesImpl();
		System.out.println(this.dto);
		services.setMapDto(this.dto);
		try {
			//String verifyCode=(String)this.get("verifyCode");
			services.update("modifyEmail");
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}

}
