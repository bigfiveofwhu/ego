/**
 * @author hug
 */

package com.ego.controller.ajaxServlet.impl;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import com.ego.controller.ajaxServlet.AjaxControllerSupport;
import com.ego.services.impl.SyscodeServiceImpl;

public class GetSortController extends AjaxControllerSupport 
{
	@Override
	public void execute(HttpSession session) throws Exception 
	{
		this.setService(new SyscodeServiceImpl());
		List<Map<String,String>> rows=this.getService().query();
		this.put("sorts", rows);
		this.put("status", "200");
	}

}
