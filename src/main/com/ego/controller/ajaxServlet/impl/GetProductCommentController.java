package com.ego.controller.ajaxServlet.impl;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import com.ego.controller.ajaxServlet.AjaxControllerSupport;
import com.ego.services.impl.Ab04ServicesImpl;

public class GetProductCommentController extends AjaxControllerSupport
{

	@Override
	public void execute(HttpSession session) throws Exception
	{
		String type=(String)this.get("type");
		if(type.equals("1"))    //根据商品id查询商品的评论
		{
			this.setService(new Ab04ServicesImpl());
			List<Map<String,String>> rows=this.getService().query("queryCommentByAab203");
			this.put("status", "200");
			this.put("comments", rows);
		}
	}

}
