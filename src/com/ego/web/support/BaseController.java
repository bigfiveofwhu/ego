package com.ego.web.support;

import java.util.Map;

public interface BaseController 
{
	//为业务控制器填充DTO
	void setMapDto(Map<String,Object> dto);
	
    String execute()throws Exception;
    
    Map<String,Object> getAttribute();
}
