package com.ego.controller.impl;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;


import com.ego.controller.BaseServlet;
import com.ego.controller.ControllerSupport;
import com.ego.services.BaseServices;
import com.ego.services.impl.Aa05ServiceImpl;
import com.ego.services.impl.Ab05ServiceImpl;
import com.ego.services.impl.AdvertiseService;

public class DiscountController extends ControllerSupport{

	BaseServices ab05Service =new Ab05ServiceImpl();
	BaseServices aa05Service=new Aa05ServiceImpl();
	AdvertiseService adservice=new AdvertiseService();
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
			List<Map<String,String>> coupons= aa05Service.query();
			for (Map<String, String> map : coupons) {
				//获得每个优惠券的店铺名
				map.put("shopName",adservice.getName(AdvertiseService.shoptAd, map.get("aab102")) );
			}
			this.saveAttribute("userCoupons", coupons);
			return prefix+"userDiscount";
		case "discountManage":
			this.saveAttribute("shopCoupons", ab05Service.query());
			return prefix+"discountManage";
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
			this.saveAttribute("shopCoupons", ab05Service.query());
			return prefix+"shopDiscount";
		case "addCoupon"://获取添加页面
			return prefix+"addCoupon";
		default:
			throw new Exception("DiscountController无法处理此类请求");
		}
	}
}
