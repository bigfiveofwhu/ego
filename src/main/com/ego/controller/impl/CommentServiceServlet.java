package com.ego.controller.impl;

public class CommentServiceServlet extends ServiceCommentControllerSupport 
{

	@Override
	public String execute() throws Exception 
	{
		this.update("commentService", "���۷��񶩵�");
		//this.savePageData("allComment");
		return "WEB-INF/views/serviceComment";
	}

}
