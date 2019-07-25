package com.ego.controller.impl;

import com.ego.services.impl.ShopManageServicesImpl;

public class MakeCommentServlet extends CommentControllerSupport {

	@Override
	public String execute() throws Exception {
		this.update("comment", "����");
		this.savePageData("allComment");
		
		//��������
		this.setServices(new ShopManageServicesImpl());
		this.getServices().update("updateRank");
		return "WEB-INF/views/comment";
	}

}
