package com.ego.controller;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public interface Controller 
{
	//Ϊҵ����������DTO
	void setMapDto(Map<String,Object> dto);
	
    String execute()throws Exception;

    Map<String,Object> getAttribute();
    
}
