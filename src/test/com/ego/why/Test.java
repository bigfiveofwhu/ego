package com.ego.why;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.Map;

import com.ego.services.BaseServices;
import com.ego.services.impl.Ab05ServiceImpl;
import com.ego.system.tools.Tools;


public class Test {
	public static void main(String args[]) {
		Map<String, Object> dto=new HashMap<String, Object>();
		dto.put("aab501", 2);
		dto.put("aab102", 1);
		dto.put("aab502", "1");
		dto.put("aab503", 50);
		dto.put("aab504", 100);
		dto.put("aab505", 40);
		dto.put("aab506", 111);
		
		BaseServices service=new Ab05ServiceImpl();
		service.setMapDto(dto);
		try {
			service.update("changeAmount");
			System.out.println("success");
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}
