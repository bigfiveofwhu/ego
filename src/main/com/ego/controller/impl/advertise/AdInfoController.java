package com.ego.controller.impl.advertise;

import java.util.List;
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
		String total=service.findById("getTotal").get("total");
		saveAttribute("total",total==null?0:total );//所有广告的点击总量
		List<Map<String,String>> map=service.query("getRecentInfo");
		int sum=0;
		for (Map<String, String> item : map) {
			sum+=Integer.parseInt(item.get("sum"));
		}
		saveAttribute("aad302", get("aad302"));
		saveAttribute("recentInfo", map);
		saveAttribute("sum", sum);//30天的点击总量
		return AdvertiseController.prefix+"adInfo";
	}
}
