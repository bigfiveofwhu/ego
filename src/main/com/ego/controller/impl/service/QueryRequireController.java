package com.ego.controller.impl.service;

import java.util.List;
import java.util.Map;

import com.ego.controller.ControllerSupport;
import com.ego.services.impl.Ac06ServicesImpl;

public class QueryRequireController extends ControllerSupport
{

	@Override
	public String execute() throws Exception
	{
		this.setServices(new Ac06ServicesImpl());
		List<Map<String,String>> rows=this.getServices().query("queryRequireByAac102");
		this.saveAttribute("requires", rows);
		return "houtai/html/service_provider/require";
	}

}
