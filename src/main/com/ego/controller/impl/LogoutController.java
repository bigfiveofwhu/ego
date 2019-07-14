/**
 * @author hug
 */
package com.ego.controller.impl;

import javax.servlet.http.HttpSession;

import com.ego.controller.ControllerSupport;

public class LogoutController extends ControllerSupport 
{

	@Override
	public String execute() throws Exception 
	{
		try 
		{
			HttpSession session=this.getSession();
			session.invalidate();
			this.dto.clear();
		} catch (Exception e) 
		{
			this.saveAttribute("msg", "Î´µÇÂ¼!");
			e.printStackTrace();
		}
		return "home/home";
	}

}
