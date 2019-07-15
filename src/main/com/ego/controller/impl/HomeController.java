package com.ego.controller.impl;

import java.util.List;
import java.util.Map;

import com.ego.controller.ControllerSupport;
import com.ego.services.impl.Ab02ServiceImpl;
import com.ego.services.impl.Ab06ServiceImpl;
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

		//初始化热门活动
		this.setServices(new Ab06ServiceImpl());
		List<Map<String, String>> rows=this.getServices().query("findByUpToDate");
		this.saveAttribute("activityList", rows);
		//初始化新品推荐
		this.setServices(new Ab02ServiceImpl());
		//要返回多个list,无法使用savePageData
		rows = this.getServices().query("findByUpToDate");
		this.saveAttribute("productList", rows);
		this.saveAttribute("productImg", "/ego/images/01_mid.jpg");
		//初始化广告
		this.saveAttribute("isSendRedirect", false);
		return "home/home";
	}
}
