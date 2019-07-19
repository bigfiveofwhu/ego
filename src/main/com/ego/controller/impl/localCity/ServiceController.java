package com.ego.controller.impl.localCity;

import com.ego.controller.ControllerSupport;

public class ServiceController extends ControllerSupport
{

	@Override
	public String execute() throws Exception
	{
		this.dto.put("aac102", this.get("id"));  //转换服务商id
		return "localCity/service";
	}

}
