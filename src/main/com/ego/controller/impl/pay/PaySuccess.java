package com.ego.controller.impl.pay;

import java.util.Map;

import com.ego.controller.BaseServlet;
import com.ego.controller.ControllerSupport;
import com.ego.controller.impl.PayOrderServlet;
import com.ego.services.BaseServices;
import com.ego.services.impl.Ab03ServicesImpl;

public class PaySuccess extends ControllerSupport{

	Ab03ServicesImpl service=new Ab03ServicesImpl();
	@Override
	public void setMapDto(Map<String, Object> dto) {
		// TODO Auto-generated method stub
		super.setMapDto(dto);
		service.setMapDto(dto);
	}
	@Override
	public String execute() throws Exception {
		// TODO Auto-generated method stub
		dto.put("aab302", PayOrderServlet.orderId);
		
		service.update("payOrder");
		saveAttribute("ins", service.findById("pay"));
		return BaseServlet.prefix+"success";
	}

}
