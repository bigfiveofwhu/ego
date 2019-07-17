package com.ego.controller.impl;

import com.ego.controller.ControllerSupport;


public class GetSortNameServlet extends ControllerSupport
{

	@Override
	public String execute() throws Exception 
	{
		//this.setMapDto(dto);
		String sortName = (String)this.get("sortName");
		this.saveAttribute("sortName", sortName);
		return "houtai/html/seller/sellerpage/goods_edit";
	}
   
}
