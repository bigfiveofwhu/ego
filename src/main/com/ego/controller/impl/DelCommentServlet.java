package com.ego.controller.impl;

public class DelCommentServlet extends CommentControllerSupport 
{
	@Override
	public String execute() throws Exception 
	{
		this.update("delComment", "É¾³ýÆÀÂÛ");
		this.savePageData("allComment");
		return "WEB-INF/views/comment";
	}

}
