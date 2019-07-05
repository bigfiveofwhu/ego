package com.ego.web.impl;


public class DelByIdEmpServlet extends EmpControllerSupport 
{

	@Override
	public String execute() throws Exception 
	{
		this.update("deleteById", "É¾³ý");
		this.savePageDataForDelete();
		//this.savePageData();
		return "queryEmp";
	}

}
