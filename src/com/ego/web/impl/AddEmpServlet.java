package com.ego.web.impl;

public class AddEmpServlet extends EmpControllerSupport 
{

	@Override
	public String execute() throws Exception 
	{
		this.update("addEmp", "���", "��ӳɹ�,��Ա�������:", "aab103");
		return "addEmp";
	}

}
