package com.ego.controller.impl;

public class ShowServiceCommentServlet extends ServiceCommentControllerSupport 
{

	@Override
	public String execute() throws Exception 
	{
		this.savePageData("allComment");
		return "WEB-INF/views/serviceComment";
	}

}
