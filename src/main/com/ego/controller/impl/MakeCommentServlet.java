package com.ego.controller.impl;

public class MakeCommentServlet extends CommentControllerSupport {

	@Override
	public String execute() throws Exception {
		this.update("comment", "ÆÀÂÛ");
		return "WEB-INF/views/comment";
	}

}
