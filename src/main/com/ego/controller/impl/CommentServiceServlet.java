package com.ego.controller.impl;

public class CommentServiceServlet extends ServiceCommentControllerSupport 
{

	@Override
	public String execute() throws Exception 
	{
		this.update("commentService", "评价服务订单");
		//this.savePageData("allComment");
		return "WEB-INF/views/serviceComment";
	}

}
