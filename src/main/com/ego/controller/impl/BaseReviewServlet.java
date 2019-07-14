package com.ego.controller.impl;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import com.ego.controller.ControllerSupport;
import com.ego.services.impl.ManageReviewServicesImpl;

public class BaseReviewServlet extends ControllerSupport
{
	public BaseReviewServlet() {
		this.setServices(new ManageReviewServicesImpl());
	}
	
	@Override
	public String execute() throws Exception
	{
		String path=null;
		String servletPath=((HttpServletRequest)this.dto.get("request")).getServletPath();
		String mapping=servletPath.substring(servletPath.lastIndexOf('/')+1
				,servletPath.indexOf('.'));
		List<Map<String,String>> list=null;
		switch (mapping) 
		{
			case "queryShop":
				list =this.getServices().query("queryForShops");
				this.saveAttribute("shoplist", list);
				path="houtai/html/admin/seller";
				break;
				
			case "queryGood":
				list =this.getServices().query("queryForGoods");
				this.saveAttribute("goodslist", list);
				path="houtai/html/admin/goods";
				break;
				
			case "queryServiceProvider":
				list =this.getServices().query("queryForServiceProvider");
				this.saveAttribute("serviceProviderlist", list);
				path="houtai/html/admin/serviceProvider";
				break;
				
			case "queryService":
				list =this.getServices().query("queryForServices");
				this.saveAttribute("servicelist", list);
				path="houtai/html/admin/service";
				break;
				
			default:
				throw new Exception("DiscountController无法处理此类请求");
		}
		System.out.println(list);
		return path;
	}
}
