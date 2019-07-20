/**
 * @author zb
 * 验证进入个人中心入口
 */
package com.ego.controller.impl;

import java.util.Map;

import com.ego.controller.ControllerSupport;
import com.ego.services.BaseServices;

public class CheckInUserController extends ControllerSupport {

	@Override
	public String execute() throws Exception 
	{
	    if(this.get("aaa102") == null)
	    	return "home/home";
	    else
		    return "person/index";
	}

}
