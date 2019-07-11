package com.ego.controller.impl;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;


import com.ego.controller.BaseServlet;
import com.ego.controller.ControllerSupport;
import com.ego.services.BaseServices;
import com.ego.services.impl.Aa05ServiceImpl;
import com.ego.services.impl.Ab05ServiceImpl;

public class DiscountController extends ControllerSupport{

	BaseServices ab05Service=Ab05ServiceImpl.getInstance();
	BaseServices aa05Service=Aa05ServiceImpl.getInstance();

	@Override
	public void setMapDto(Map<String,Object> dto) {
		// TODO Auto-generated method stub
		this.dto=dto;
		ab05Service.setMapDto(dto);
		aa05Service.setMapDto(dto);
	}

	@Override
	public String execute() throws Exception {
		String prefix=BaseServlet.prefix+"discount/";

		String servletPath=((HttpServletRequest)this.dto.get("request")).getServletPath();
		String mapping=servletPath.substring(servletPath.lastIndexOf('/')+1
				,servletPath.indexOf('.'));
		switch (mapping) {
		case "getCustomerCoupons":
			this.saveAttribute("coupons", aa05Service.query());
			this.saveAttribute("shopCoupons", ab05Service.query());
			return prefix+"discount";
		case "addUserCoupon":
			Map<String, String> ins=ab05Service.findById("getCoupon");
			dto.put("aab102", ins.get("aab102"));//店铺id
			dto.put("aaa502", ins.get("aab502"));//卡券类型
			dto.put("aaa503", ins.get("aab503"));//优惠值
			dto.put("aaa504", ins.get("aab504"));//条件
			dto.put("aab505", ins.get("aab505"));//持续时间
			this.saveAttribute("msg", aa05Service.update("addUserCoupon")?"成功":"失败");
			return prefix+"result";

		case "useCoupon":
			this.saveAttribute("msg", aa05Service.update("useCoupon")?"成功":"update无影响");
			return prefix+"result";
		case "getShopCoupons":
			return prefix+"discount";
		default:
			throw new Exception("DiscountController无法处理此类请求");
		}
	}
}
