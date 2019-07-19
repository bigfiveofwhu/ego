package com.ego.controller.impl.localCity;

import com.ego.controller.ControllerSupport;

public class SearchController extends ControllerSupport 
{

	@Override
	public String execute() throws Exception 
	{
		if(this.get("key")!=null)    //¹Ø¼ü×ÖËÑË÷
		{
			
		}else if(this.get("type")!=null)   //·ÖÀàËÑË÷
		{
			
		}
		return "localCity/search";
	}

}
