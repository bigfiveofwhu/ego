package com.ego.controller.impl.advertise;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.ego.controller.ControllerSupport;
import com.ego.services.BaseServices;
import com.ego.services.impl.AdAuditServiceImpl;

public class AdAuditController extends ControllerSupport{
	BaseServices service=new AdAuditServiceImpl();
	@Override
	public void setMapDto(Map<String, Object> dto) {
		// TODO Auto-generated method stub
		super.setMapDto(dto);
		service.setMapDto(dto);
	}
	@Override
	public String execute() throws Exception {
		// TODO Auto-generated method stub
		List<Map<String, String>> maps=service.query("getAdAccountAudits");
		for (Map<String, String> map : maps) {
			Map<String, String> result=parse(map.get("aad802"));
			map.put("realName",result.get("realName") );
			map.put("identity",result.get("identity") );
			map.put("bankAccount",result.get("bankAccount") );
			map.put("phoneNumber",result.get("phoneNumber") );
		}
		this.saveAttribute("applications",maps);
		return "houtai/html/admin/adAccount";
	}
	
	public Map<String, String> parse(String info) {
		Map<String, String> result=new HashMap<String, String>();
		String[] data=info.split("&");
		for (String piece : data) {
			int index=piece.indexOf('=');
			result.put(piece.substring(0, index),piece.substring(index+1));
		}
		return result;
	}
}
