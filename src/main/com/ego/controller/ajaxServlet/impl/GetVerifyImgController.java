package com.ego.controller.ajaxServlet.impl;

import java.util.Date;

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
		long later=(now+54321);
		String name="000002"+".jpg";
		System.out.println(path+name+",  code: "+vCode.getCode());
		vCode.write(path+name);
		this.put("url", "/ego/images/001/"+name);
	}

}
