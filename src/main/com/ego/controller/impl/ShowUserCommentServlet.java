/**
 * @author zb
 */
package com.ego.controller.impl;

import java.util.List;
import java.util.Map;

public class ShowUserCommentServlet extends ShopControllerSupport {

	@Override
	public String execute() throws Exception {
        List<Map<String,String>> list = this.getServices().query("queryforcomment");
        this.saveAttribute("commentList", list);
		return "houtai/html/seller/sellerpage/shopcomment";
	}

}
