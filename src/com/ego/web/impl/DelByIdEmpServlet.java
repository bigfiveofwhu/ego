package com.ego.web.impl;


public class DelByIdEmpServlet extends EmpControllerSupport 
{

	@Override
	public String execute() throws Exception 
	{
		this.update("deleteById", "ɾ��");
		this.savePageDataForDelete();
		//this.savePageData();
		return "queryEmp";
	}

}
