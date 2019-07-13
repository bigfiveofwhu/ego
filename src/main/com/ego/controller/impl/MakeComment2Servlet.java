package com.ego.controller.impl;

public class MakeComment2Servlet extends CommentControllerSupport {

	@Override
	public String execute() throws Exception {
		this.update("comment2", "×·ÆÀ");
		this.savePageData("allComment");
		return "WEB-INF/views/comment";
	}

}
