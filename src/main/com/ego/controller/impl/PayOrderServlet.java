package com.ego.controller.impl;

import javax.servlet.http.HttpServletRequest;

import com.ego.controller.BaseServlet;

public class PayOrderServlet extends OrderControllerSupport {

	public static String orderId;
	@Override
	public String execute() throws Exception {
//		this.update("payOrder", "֧��");
		this.savePageInstance("pay");
//		return "WEB-INF/views/success";
		orderId=this.get("aab302").toString();
		
		HttpServletRequest request=(HttpServletRequest)dto.get("request");
		//���ö�����
		request.setAttribute("WIDout_trade_no",this.get("aab302"));
		//���ö�������
		request.setAttribute("WIDsubject","Ego Business" );
		//���ý��׶��
		request.setAttribute("WIDtotal_amount", this.get("aab316"));
		//���ù�
		request.setAttribute("WIDbody", "���˻���ֵ"+dto.get("WIDtotal_amount")+"Ԫ");
		return BaseServlet.prefix+"aliPay/wappay/alipay.trade.page.pay";
	}

}
