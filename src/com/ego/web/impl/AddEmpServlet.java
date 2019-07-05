package com.ego.web.impl;

public class AddEmpServlet extends EmpControllerSupport 
{

	@Override
	public String execute() throws Exception 
	{
		this.update("addEmp", "添加", "添加成功,该员工编号是:", "aab103");
		return "addEmp";
	}

}
