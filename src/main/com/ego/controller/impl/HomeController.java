package com.ego.controller.impl;

import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStreamWriter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.ego.controller.ControllerSupport;
import com.ego.services.impl.SyscodeServiceImpl;
import com.ego.system.utils.GeneJSP;

public class HomeController extends ControllerSupport
{
	public HomeController()
	{
		this.setServices(new SyscodeServiceImpl());
	}

	@Override
	public String execute() throws Exception 
	{
		//初始化用户信息
		//初始化商品分类
		//File file=new File("WebContent/home/productType.jsp");
		//GeneJSP.geneJSP(this.getServices());
		//初始化轮播图片
		//初始化新品推荐
		//初始化热门活动
		//初始化广告
		this.saveAttribute("isSendRedirect", false);
		return "home/home";
	}
}
