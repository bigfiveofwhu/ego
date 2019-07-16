package com.ego.controller.impl;

public class ShowPointHistoryServlet extends CommentControllerSupport 
{

	@Override
	public String execute() throws Exception 
	{
		this.savePageData("point");
		this.savePageInstance("userPoint");
		return "WEB-INF/views/point";
	}

}
