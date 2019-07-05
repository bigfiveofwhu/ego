package com.ego.web.impl;

public class DelEmpServlet extends EmpControllerSupport {

	@Override
	public String execute() throws Exception
	{
		this.update("batchDelete", "É¾³ý");
		this.savePageDataForDelete();
		return "queryEmp";
	}
}
