package com.ego.controller.impl;

public class GoCommentServlet extends OrderControllerSupport 
{

	@Override
	public String execute() throws Exception 
	{
		this.savePageInstance("detail");
		return "WEB-INF/views/makeComment";
	}

}
