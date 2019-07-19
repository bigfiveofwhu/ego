/**
 * 店铺后台查看评论
 * @author zb
 */

package com.ego.controller.impl;

import java.util.List;
import java.util.Map;

import com.ego.controller.ControllerSupport;
import com.ego.services.impl.ShopManageServicesImpl;

public class QueryComment extends ControllerSupport
{


	@Override
	public String execute() throws Exception 
	{
        this.setServices(new ShopManageServicesImpl());
        List<Map<String,String>> list = this.getServices().query("queryforcomment");
        this.saveAttribute("commentList", list);
        
		return "";
	}
}
