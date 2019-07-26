package com.ego.controller.impl;

import com.ego.controller.BaseServlet;
import com.ego.controller.ControllerSupport;
import com.ego.services.impl.ManageReviewServicesImpl;

import javax.servlet.http.HttpServletRequest;
import java.util.List;
import java.util.Map;

public class BaseReviewServlet extends ControllerSupport
{
	public BaseReviewServlet() {
		this.setServices(new ManageReviewServicesImpl());
	}
	
	@Override
	public String execute() throws Exception
	{
		if (getSession().getAttribute("aad102")==null) {
			return BaseServlet.prefix+"manager/login";
		}

		String path;
		String servletPath=((HttpServletRequest)this.dto.get("request")).getServletPath();
		String mapping=servletPath.substring(servletPath.lastIndexOf('/')+1
				,servletPath.indexOf('.'));
		List<Map<String,String>> list;
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
			case "queryJubao":
				list =this.getServices().query("queryForJubao");
				this.saveAttribute("complainList", list);
				path="houtai/html/admin/complain";
				break;
			default:
				throw new Exception("BaseReviewServlet�޷������������");
		}
		System.out.println(list);
		return path;
	}
}
