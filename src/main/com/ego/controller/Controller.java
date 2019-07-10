package com.ego.controller;

import java.util.Map;

public interface Controller 
{
	//Ϊҵ����������DTO
	void setMapDto(Map<String,Object> dto);
	
    String execute()throws Exception;

    Map<String,Object> getAttribute();
    
}
