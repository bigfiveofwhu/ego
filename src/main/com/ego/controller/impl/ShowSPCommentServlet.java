package com.ego.controller.impl;

import java.util.List;
import java.util.Map;

public class ShowSPCommentServlet extends SPManageConntroller {

	@Override
	public String execute() throws Exception 
	{
       List<Map<String,String>> list = this.getServices().query("queryforcomment");
       if(list.size() > 0)
    	   this.saveAttribute("commentList", list);
		return "houtai/html/service_provider/sp_comment";
	}

}
