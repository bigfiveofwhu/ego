package com.ego.controller.ajaxServlet.impl;

import java.util.Date;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.ego.controller.ajaxServlet.AjaxControllerSupport;
import com.ego.system.utils.GeneVerifyImg;

public class GetVerifyImgController extends AjaxControllerSupport
{

	private final String path="./WebContent/images/001/";     //定义存放图片的路径前缀
	
	@Override
	public void execute(HttpSession session) throws Exception
	{
		GeneVerifyImg vCode = new GeneVerifyImg(160,40,5,150);
		session.setAttribute("regVerCode", vCode.getCode());
		long now=new Date().getTime();
		session.setAttribute("regVerCodeTime", now);
		session.setAttribute("internel", 300000L);      //五分钟有效
		System.out.println("code: "+vCode.getCode());
		vCode.write(this.getResponse().getOutputStream());
	}

}
