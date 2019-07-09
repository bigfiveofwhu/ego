package com.ego.controller.ajaxServlet;

import java.util.Map;

import javax.servlet.http.HttpSession;

import com.alibaba.fastjson.JSONObject;

public interface AjaxController 
{
	void setMap(Map<String,Object> dto);
	
	void execute(HttpSession session);
	
	JSONObject getJSON();
}
