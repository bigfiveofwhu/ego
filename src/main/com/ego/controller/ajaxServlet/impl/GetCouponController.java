package com.ego.controller.ajaxServlet.impl;

import java.util.Map;

import javax.servlet.http.HttpSession;

import com.ego.controller.ajaxServlet.AjaxControllerSupport;
import com.ego.services.BaseServices;
import com.ego.services.impl.Aa05ServiceImpl;
import com.ego.services.impl.Ab05ServiceImpl;
import com.ego.system.db.DBUtils;

/**
 * 用户点击领取优惠券的处理对象
 * @author lenovo
 *
 */
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

	/**
	 * dto中有用户id和优惠券流水号
	 */
	@Override
	public void execute(HttpSession session) throws Exception {
		// TODO Auto-generated method stub
		Map<String, String> coupon=ab05.findById("getCoupon");
		int amount=Integer.parseInt(coupon.get("aab506"));
		//需要aaa502，aab505,aaa102,aab102,aaa503,aaa504
		dto.put("aab102", coupon.get("aab102"));//这两个数据不用改名
		dto.put("aab505", coupon.get("aab505"));
		
		dto.put("aaa502", coupon.get("aab502"));//这三个需要改名
		dto.put("aaa503", coupon.get("aab503"));
		dto.put("aaa504", coupon.get("aab504"));
		if (amount>0) {
			try {
				DBUtils.beginTransaction();
				ab05.update("decreseByOne");
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
		}else {//如果数量不限
			aa05.update("addUserCoupon");
			this.put("result", true);
		}
	}

}
