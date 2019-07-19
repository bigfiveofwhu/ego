package com.ego.controller.ajaxServlet.impl;

import java.util.Map;

import javax.servlet.http.HttpSession;

import com.ego.controller.ajaxServlet.AjaxControllerSupport;
import com.ego.services.BaseServices;
import com.ego.services.impl.Aa05ServiceImpl;
import com.ego.services.impl.Ab05ServiceImpl;
import com.ego.system.db.DBUtils;

public class GetCouponController extends AjaxControllerSupport{

	BaseServices ab05= new Ab05ServiceImpl();//店铺优惠券
	BaseServices aa05=new Aa05ServiceImpl();//商家优惠券
	@Override
	public void setMap(Map<String, Object> dto) {
		// TODO Auto-generated method stub
		super.setMap(dto);
		ab05.setMapDto(dto);
		aa05.setMapDto(dto);
	}
	
	@Override
	public void execute(HttpSession session) throws Exception {
		// TODO Auto-generated method stub
		Map<String, String> coupon=ab05.findById("getCoupon");
		int amount=Integer.parseInt(coupon.get("aab506"));
		if (amount>0) {
			try {
				DBUtils.beginTransaction();
				ab05.update("decreseByOne");
				dto.putAll(coupon);
				aa05.update("addUserCoupon");
				DBUtils.commit();
				this.put("result",true);
			} catch (Exception e) {
				// TODO: handle exception
				DBUtils.rollback();
				this.put("result",false);
				this.put("reason","服务端异常");
				e.printStackTrace();
			}finally {
				DBUtils.endTransaction();
			}
		}else if(amount==0){
			this.put("result",false);
			this.put("reason","优惠券已经领完了");
		}else {
			dto.putAll(coupon);
			aa05.update("addUserCoupon");
			this.put("result", true);
		}
	}

}
