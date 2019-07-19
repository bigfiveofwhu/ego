package com.ego.controller.impl;

public class ReplySPCommentServlet extends SPManageConntroller {

	@Override
	public String execute() throws Exception 
	{
        if(this.getServices().update("replyComment"))
        {
        	System.out.println("comment:" + this.getServices().query("queryforcomment"));
        
        	this.saveAttribute("commentList", this.getServices().query("queryforcomment"));
        } 
		return "houtai/html/service_provider/sp_comment";
	}

}
