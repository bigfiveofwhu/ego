package com.ego.controller.impl;

public class MakeCommentServlet extends CommentControllerSupport {

	@Override
	public String execute() throws Exception {
		this.update("comment", "����");
		this.savePageData("allComment");
		return "WEB-INF/views/comment";
	}

}
