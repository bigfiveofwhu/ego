package com.ego.controller.ajaxServlet;

import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import com.alibaba.fastjson.JSONObject;
import com.ego.services.BaseServices;

public abstract class AjaxControllerSupport implements AjaxController
{

	protected Map<String,Object> dto=null;
	
	private BaseServices service=null;
	
	protected JSONObject jsonOject=new JSONObject();
	
	protected void setService(BaseServices service)
	{
		this.service=service;
		this.service.setMapDto(this.dto);
	}
	
	protected BaseServices getService()
	{
		return this.service;
	}
	
	protected Object get(String key)
	{
		return this.dto.get(key);
	}
	
	protected void dtoPut(String key,Object value)
	{
		this.dto.put(key, value);
	}
	
	@Override
	public void setMap(Map<String, Object> dto) 
	{
		this.dto=dto;
		if(this.service!=null) this.service.setMapDto(this.dto);
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
	
	protected HttpServletResponse getResponse()
	{
		return (HttpServletResponse)this.get("response");
	}
}
