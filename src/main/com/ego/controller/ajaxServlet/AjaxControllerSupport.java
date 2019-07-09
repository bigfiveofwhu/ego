package com.ego.controller.ajaxServlet;

import java.util.Map;

import com.alibaba.fastjson.JSONObject;

public abstract class AjaxControllerSupport implements AjaxController
{

	protected Map<String,Object> dto=null;
	
	protected JSONObject jsonOject=new JSONObject();
	
	@Override
	public void setMap(Map<String, Object> dto) 
	{
		this.dto=dto;
	}
	
	@Override
	public JSONObject getJSON()
	{
		return this.jsonOject;
	}
	
	protected void put(String key,Object value)
	{
		this.jsonOject.put(key, value);
	}
}
