package com.ego.controller.ajaxServlet.impl;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import com.ego.controller.ajaxServlet.AjaxControllerSupport;
import com.ego.services.BaseServices;
import com.ego.services.impl.Ab04ServicesImpl;
import com.ego.system.tools.Tools;
import com.ego.system.utils.FileUpload;

public class MakeCommentController extends AjaxControllerSupport{

	BaseServices service=new Ab04ServicesImpl();
	@Override
	public void setMap(Map<String, Object> dto) {
		// TODO Auto-generated method stub
		super.setMap(dto);
		service.setMapDto(dto);
	}
	
	@Override
	public void execute(HttpSession session) throws Exception {
		// TODO Auto-generated method stub
		String aab402=Tools.getCommentId();
		dto.put("aab402", aab402);
		dto.put("aab412", "02");//默认02无图
		try {
			FileUpload.writeFile2("WebContent/images/comments",aab402, (HttpServletRequest)dto.get("request"), dto);
			service.update("comment");
			this.put("result", true);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			this.put("result", false);
			this.put("reason", "服务端错误");
		}
	}
}
