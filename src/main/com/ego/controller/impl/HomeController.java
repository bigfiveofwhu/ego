package com.ego.controller.impl;

import java.util.List;
import java.util.Map;

import com.ego.controller.ControllerSupport;
import com.ego.services.impl.Ab02ServiceImpl;
import com.ego.services.impl.Ab06ServiceImpl;
import com.ego.services.impl.AdvertiseService;
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
		this.setServices(new AdvertiseService());
		List<Map<String, String>> rows=this.getServices().query("getTopHeadLine");
		this.saveAttribute("loopShow", rows);
		//初始化热门商品
		rows=this.getServices().query("gethotProducts");
		this.saveAttribute("hotProduct", rows);
		//初始化热门店铺
		rows=this.getServices().query("gethotShops");
		this.saveAttribute("hotShop", rows);
		//初始化猜你喜欢
		if (this.get("aaa102")!=null&&!this.get("aaa102").equals("")) {
			rows=this.getServices().query("getTargetAds");
			this.saveAttribute("guessProduct", rows);
		}
		//初始化热门活动
		this.setServices(new Ab06ServiceImpl());
		rows=this.getServices().query("findByUpToDate");
		this.saveAttribute("activityList", rows);
		
		//初始化新品推荐
		this.setServices(new Ab02ServiceImpl());
		    /*要返回多个list,无法使用savePageData*/
		rows = this.getServices().query("findByUpToDate");
		this.saveAttribute("productList", rows);
		this.saveAttribute("isSendRedirect", false);
		return "home/home";
	}
}
