package com.ego.web.impl;

public class ModifyEmpServlet extends EmpControllerSupport {

	@Override
	public String execute() throws Exception
	{
		this.update("modifyEmp", "ÐÞ¸Ä");
		return "addEmp";
	}

}
