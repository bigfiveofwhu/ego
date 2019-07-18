package com.ego.controller.ajaxServlet.impl;

import java.util.Map;

import javax.servlet.http.HttpSession;

import com.ego.controller.ajaxServlet.AjaxControllerSupport;
import com.ego.services.BaseServices;
import com.ego.services.impl.AdvertiseService;
import com.ego.system.db.DBUtils;

public class ChargeAdController extends AjaxControllerSupport{

	BaseServices service=new AdvertiseService();
	@Override
	public void setMap(Map<String, Object> dto) {
		// TODO Auto-generated method stub
		super.setMap(dto);
		service.setMapDto(dto);
	}
	/**
	 * 需传递广告id和充值额度，账户id在sessiong里面
	 * 
	 */
	@Override
	public void execute(HttpSession session) throws Exception {
		// TODO Auto-generated method stub
		Map<String, String> account= service.findById("getAccountById");
		double balance=Double.parseDouble(account.get("aad403").toString());
		double amount=Double.parseDouble(this.get("increment").toString());
		dto.put("decrement", amount);
		if (balance<amount) {
			put("result", false);
			put("reason", "账户余额不足");
			return;
		}else {
			try {
				DBUtils.beginTransaction();
				if (service.update("addMoney")&&service.update("chargeMoney")) {
					put("result", true);
				}else {
					put("result", false);
					put("reason", "未知错误");
				}
				DBUtils.commit();
			} catch (Exception e) {
				// TODO: handle exception
				put("result", true);
				put("reason", "未知错误");
				DBUtils.rollback();
				e.printStackTrace();
			}finally {
				DBUtils.endTransaction();
			}
		}
	}
}
