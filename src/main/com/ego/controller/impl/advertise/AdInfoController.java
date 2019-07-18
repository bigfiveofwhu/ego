package com.ego.controller.impl.advertise;

import java.util.Map;

import com.ego.controller.ControllerSupport;
import com.ego.services.BaseServices;
import com.ego.services.impl.AdStatistic;
import com.ego.services.impl.AdvertiseService;

public class AdInfoController extends ControllerSupport{

	BaseServices service=new AdStatistic();
	@Override
	public void setMapDto(Map<String, Object> dto) {
		// TODO Auto-generated method stub
		super.setMapDto(dto);
		service.setMapDto(dto);
	}
	
	@Override
	public String execute() throws Exception {
		// TODO Auto-generated method stub
		saveAttribute("total", service.findById("getTotal").get("total"));;
		saveAttribute("rencentInfo",service.query("getRecentInfo") );
		return AdvertiseController.prefix+"adInfo";
	}
	
}
