package com.ego.controller;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public interface Controller 
{
	
	/**
	 * 作用：接受一个请求，处理request中的数据，并将处理后的数据放入request或sessiong中，然后返回相应的视图名
	 * @param request 请求对象，需要的参数和处理后的数据都放里面
	 * @param response	相应对象，一般不需要管
	 * @return 返回相应的视图名，视图全放在views下面
	 * @throws Exception
	 */
    String execute(HttpServletRequest request,HttpServletResponse response)throws Exception;

}
