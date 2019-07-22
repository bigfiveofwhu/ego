package com.ego.controller.impl;

public class ShowCommentServlet extends CommentControllerSupport 
{

	@Override
	public String execute() throws Exception 
	{
		this.savePageData("allComment");
		return "WEB-INF/views/comment";
	}

}
