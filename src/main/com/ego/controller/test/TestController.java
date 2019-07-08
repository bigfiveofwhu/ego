package com.ego.controller.test;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ego.controller.Controller;

public class TestController implements Controller{

	@Override
	public String execute(HttpServletRequest request,HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		request.setAttribute("testData", "test controller work well");
		return "test";
	}
}
