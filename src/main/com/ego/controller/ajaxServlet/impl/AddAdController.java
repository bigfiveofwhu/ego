package com.ego.controller.ajaxServlet.impl;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import com.ego.controller.ajaxServlet.AjaxControllerSupport;
import com.ego.services.BaseServices;
import com.ego.services.impl.AdvertiseService;
import com.ego.system.db.DBUtils;
import com.ego.system.tools.Tools;
import com.ego.system.utils.FileUpload;

public class AddAdController extends AjaxControllerSupport {

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
		// boolean result=service.update("insertAd");
		HttpServletRequest request = (HttpServletRequest) dto.get("request");
		int adId = Tools.getIncrementId("ad03");
		dto.put("aad302", adId);
		try {
			FileUpload.writeFile(Integer.toString(adId), request,dto);//添加文件同时给dto插入数据
			if (service.update("insertAd")) {
				this.put("result", true);
			}else {
				this.put("result", false);
				this.put("reason", "操作数据库失败");
			}
		} catch (Exception e) {
			// TODO: handle exception
			this.put("result", false);
			this.put("reason", "写入文件失败");
			e.printStackTrace();
		}
		
	}

}
