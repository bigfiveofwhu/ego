package com.ego.controller.impl;

import javax.servlet.http.HttpServletRequest;

import org.eclipse.jdt.internal.compiler.ast.ThisReference;

import com.ego.controller.BaseServlet;
import com.ego.controller.ControllerSupport;
import com.ego.services.BaseServices;
import com.ego.services.impl.Ab05ServiceImpl;

public class DiscountController extends ControllerSupport{

	public DiscountController() {
		// TODO Auto-generated constructor stub
		this.setServices(new Ab05ServiceImpl());
	}
	
	@Override
	public String execute() throws Exception {
		String servletPath=((HttpServletRequest)get("request")).getServletPath();
		String mapping=servletPath.substring(servletPath.indexOf('/')+1
				,servletPath.indexOf('.'));
		switch (servletPath) {
		case "getCustomerCoupons":
			this.saveAttribute("coupons", this.getServices().query());
			return BaseServlet.prefix+"discount";
		default:
			return null;
		}
	}

}
