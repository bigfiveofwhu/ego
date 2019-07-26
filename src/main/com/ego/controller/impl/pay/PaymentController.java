package com.ego.controller.impl.pay;

import java.util.Date;

import javax.servlet.http.HttpServletRequest;

import com.ego.controller.BaseServlet;
import com.ego.controller.ControllerSupport;
import com.ego.services.BaseServices;
import com.ego.services.impl.AdvertiseService;
import com.sun.org.apache.bcel.internal.generic.NEW;

public class PaymentController extends ControllerSupport{

	AdvertiseService service=new AdvertiseService();
	@Override
	public String execute() throws Exception {
		// TODO Auto-generated method stub
		HttpServletRequest request=(HttpServletRequest)dto.get("request");
		request.setAttribute("WIDout_trade_no", produceTradeNo());
		request.setAttribute("WIDsubject","ego广告充值" );
		request.setAttribute("WIDtotal_amount",dto.get("WIDtotal_amount") );
		request.setAttribute("WIDbody", "向账户充值"+dto.get("WIDtotal_amount")+"元");
		return BaseServlet.prefix+"aliPay/wappay/pay";
	}


	private String produceTradeNo() {
		StringBuilder tn=new StringBuilder();
		Date current=new Date();
		tn.append(current.getYear());
		tn.append(current.getMonth());
		tn.append(current.getDay());
		tn.append(current.getHours());
		tn.append(current.getMinutes());
		tn.append(current.getSeconds());
		tn.append(current.getTime());
		return tn.toString();
	}
}
