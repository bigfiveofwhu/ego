package com.ego.controller.impl;

import java.util.List;
import java.util.Map;

import com.ego.services.impl.Aa04ServiceImpl;

public class CreateOrderServlet extends OrderControllerSupport {

	@Override
	public String execute() throws Exception {
		// TODO Auto-generated method stu
		this.setServices(new Aa04ServiceImpl());
		List<Map<String,String>> list = this.getServices().query();
		if(list.size() > 0)
		{
			//System.out.println(list);
		  this.saveAttribute("addrlist", list);
		}
		return "WEB-INF/views/createOrder";
	}

}
