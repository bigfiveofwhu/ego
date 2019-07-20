package com.ego.controller.impl.advertise;

import java.util.List;
import java.util.Map;

import com.ego.controller.BaseServlet;
import com.ego.controller.ControllerSupport;
import com.ego.services.BaseServices;
import com.ego.services.impl.AdvertiseService;
import com.ego.services.impl.advertise.PlatformAdStatisticService;

public class PlatformAdInfoController extends ControllerSupport{

	BaseServices service=new PlatformAdStatisticService();
	@Override
	public void setMapDto(Map<String, Object> dto) {
		// TODO Auto-generated method stub
		super.setMapDto(dto);
		service.setMapDto(dto);
	}
	@Override
	public String execute() throws Exception {
		// TODO Auto-generated method stub
		List<Map<String, String>>founds= service.query("getFounds");
		List<Map<String, String>>clicks=service.query("getClickInfo");
		for (Map<String, String> map : clicks) {
			switch (map.get("aad305")) {
			case AdvertiseService.headLine:
				map.put("type", "首页轮播");
				break;
			case AdvertiseService.homePage:
				map.put("type", "热门商品");
				break;
			case AdvertiseService.search:
				map.put("type", "搜索靠前");
				break;
			case AdvertiseService.AIads:
				map.put("type", "定向广告");
				break;
			default:
				throw new Exception("不支持的广告类型，in platformAdInfoControllers");
			}
		}
		for (Map<String, String> map : founds) {
			switch (map.get("aad305")) {
			case AdvertiseService.headLine:
				map.put("type", "首页轮播");
				break;
			case AdvertiseService.homePage:
				map.put("type", "热门商品");
				break;
			case AdvertiseService.search:
				map.put("type", "搜索靠前");
				break;
			case AdvertiseService.AIads:
				map.put("type", "定向广告");
				break;
			default:
				throw new Exception("不支持的广告类型，in platformAdInfoControllers");
			}
		}
		saveAttribute("founds", founds);
		saveAttribute("clicks", clicks);
		return BaseServlet.prefix+"advertise/platformAdInfo";
	}
}
