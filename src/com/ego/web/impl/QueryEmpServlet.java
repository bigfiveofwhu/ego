package com.ego.web.impl;

public final class QueryEmpServlet extends EmpControllerSupport 
{
	@Override
	public String execute() throws Exception 
	{
		this.savePageData();
		return "queryEmp";
	}
}
