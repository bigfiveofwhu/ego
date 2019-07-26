package com.ego.controller.impl;

import javax.servlet.http.HttpServletRequest;

import com.ego.controller.BaseServlet;

public class PayOrderServlet extends OrderControllerSupport {

	public static String orderId;
	@Override
	public String execute() throws Exception {
//		this.update("payOrder", "支付");
		this.savePageInstance("pay");
//		return "WEB-INF/views/success";
		orderId=this.get("aab302").toString();
		
		HttpServletRequest request=(HttpServletRequest)dto.get("request");
		//设置订单号
		request.setAttribute("WIDout_trade_no",this.get("aab302"));
		//设置订单标题
		request.setAttribute("WIDsubject","Ego Business" );
		//设置交易额度
		request.setAttribute("WIDtotal_amount", this.get("aab316"));
		//不用管
		request.setAttribute("WIDbody", "向账户充值"+dto.get("WIDtotal_amount")+"元");
		return BaseServlet.prefix+"aliPay/wappay/alipay.trade.page.pay";
	}

}
