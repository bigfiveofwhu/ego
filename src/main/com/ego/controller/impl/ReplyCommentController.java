package com.ego.controller.impl;

import java.util.List;
import java.util.Map;

public class ReplyCommentController extends ShopControllerSupport {

	@Override
	public String execute() throws Exception {
		if(this.getServices().update("replyComment"))
			System.out.println("�ظ��ɹ�");
		else
			System.out.println("�ظ�ʧ��");
		
		List<Map<String,String>> list = this.getServices().query("queryforcomment");
		this.saveAttribute("commentList", list);
		return "houtai/html/seller/sellerpage/shopcomment";
	}

}
