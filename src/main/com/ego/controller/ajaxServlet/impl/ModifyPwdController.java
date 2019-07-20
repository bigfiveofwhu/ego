package com.ego.controller.ajaxServlet.impl;

import javax.servlet.http.HttpSession;

import com.ego.controller.ajaxServlet.AjaxControllerSupport;
import com.ego.services.impl.UserManageServicesImpl;

public class ModifyPwdController extends AjaxControllerSupport {

	@Override
	public void execute(HttpSession session) throws Exception {
          this.setService(new UserManageServicesImpl());
          if(this.getService().update("modifyPwd"))
        	  this.put("bigtag", 1);
          else
        	  this.put("bigtag", 0);
		
	}

}
