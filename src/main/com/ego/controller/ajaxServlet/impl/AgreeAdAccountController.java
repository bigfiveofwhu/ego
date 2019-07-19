package com.ego.controller.ajaxServlet.impl;

import java.util.Map;

import javax.servlet.http.HttpSession;

import com.ego.controller.ajaxServlet.AjaxControllerSupport;
/**
 * 当点击通过或否决申请时的控制器
 * @author lenovo
 *
 */
import com.ego.services.BaseServices;
import com.ego.services.impl.Ad08ServicesImpl;
import com.ego.services.impl.AdAuditServiceImpl;
import com.ego.services.impl.AdvertiseService;
public class AgreeAdAccountController extends AjaxControllerSupport{

	BaseServices service1=new AdvertiseService();
	BaseServices service2=new AdAuditServiceImpl();
	@Override
		public void setMap(Map<String, Object> dto) {
			// TODO Auto-generated method stub
			super.setMap(dto);
			service1.setMapDto(dto);
			service2.setMapDto(dto);
		}
	
	@Override
	public void execute(HttpSession session) throws Exception {
		// TODO Auto-generated method stub
		String yesOrNo= get("yesOrNo").toString();
		//如果同意，需要传递 aad403,aaa102
		if (yesOrNo.equals("yes")) {
			service1.update("insertAdAccount");
			service2.update("pass");
			put("result", true);
		}else if (yesOrNo.equals("no")) {
			service2.update("reject");
			put("result", true);
		}else {
			this.put("result", false);
			this.put("reason","无效的前端数据");
		}
	}

}
