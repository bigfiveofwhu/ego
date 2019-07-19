package com.ego.controller.impl;

public class GoCommentServiceServlet extends ServiceOrderControllerSupport 
{

	@Override
	public String execute() throws Exception 
	{
		this.savePageInstance("comment");
		return "WEB-INF/views/commentService";
	}

}
