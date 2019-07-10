package com.ego.controller.impl;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.eclipse.jdt.internal.compiler.ast.ThisReference;

import com.ego.controller.BaseServlet;
import com.ego.controller.ControllerSupport;
import com.ego.services.impl.Aa05ServicesImpl;
import com.ego.services.impl.Ab05ServiceImpl;

public class DiscountController extends ControllerSupport{

	public DiscountController() {
		// TODO Auto-generated constructor stub
		this.setServices(new Ab05ServiceImpl());
	}
	
	@Override
	public String execute() throws Exception {
		String servletPath=((HttpServletRequest)get("request")).getServletPath();
		String mapping=servletPath.substring(servletPath.lastIndexOf('/')+1
				,servletPath.indexOf('.'));
		switch (mapping) {
		case "getCustomerCoupons":
			this.changeService(Aa05ServicesImpl.getInstance());
			this.saveAttribute("coupons", this.getServices().query());
			Object a=this.get("coupons");
			return BaseServlet.prefix+"discount";
		default:
			return null;
		}
	}

}
