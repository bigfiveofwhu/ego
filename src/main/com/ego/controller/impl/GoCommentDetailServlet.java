package com.ego.controller.impl;

public class GoCommentDetailServlet extends CommentControllerSupport 
{

	@Override
	public String execute() throws Exception 
	{
		this.savePageInstance("commentDetail");
		return "WEB-INF/views/commentDetail";
	}

}
