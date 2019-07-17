package com.ego.controller.impl;

import java.util.List;
import java.util.Map;

public class ReplyComment extends ShopControllerSupport {

	@Override
	public String execute() throws Exception {
		if(this.getServices().update("replyComment"))
			this.saveAttribute("msg", "回复成功");
		else
			this.saveAttribute("msg", "回复失败");
		
		List<Map<String,String>> list = this.getServices().query("queryforcomment");
		this.saveAttribute("commentList", list);
		return "houtai/html/seller/sellerpage/shopcomment";
	}

}
