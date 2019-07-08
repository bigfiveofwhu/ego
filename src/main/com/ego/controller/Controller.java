package com.ego.controller;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public interface Controller 
{
	//为业务控制器填充DTO
	void setMapDto(Map<String,Object> dto);
	
    String execute()throws Exception;

    Map<String,Object> getAttribute();
    
}
