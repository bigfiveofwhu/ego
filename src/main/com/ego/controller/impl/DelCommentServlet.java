package com.ego.controller.impl;

public class DelCommentServlet extends CommentControllerSupport 
{
	@Override
	public String execute() throws Exception 
	{
		this.update("delComment", "ɾ������");
		this.savePageData("allComment");
		return "WEB-INF/views/comment";
	}

}
