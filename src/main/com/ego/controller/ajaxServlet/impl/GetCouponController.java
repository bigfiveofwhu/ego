package com.ego.controller.ajaxServlet.impl;

import java.util.Map;

import javax.servlet.http.HttpSession;

import com.ego.controller.ajaxServlet.AjaxControllerSupport;
import com.ego.services.BaseServices;
import com.ego.services.impl.Aa05ServiceImpl;
import com.ego.services.impl.Ab05ServiceImpl;
import com.ego.system.db.DBUtils;

/**
 * �û������ȡ�Ż�ȯ�Ĵ������
 * @author lenovo
 *
 */
public class GetCouponController extends AjaxControllerSupport{

	BaseServices ab05= new Ab05ServiceImpl();//�����Ż�ȯ
	BaseServices aa05=new Aa05ServiceImpl();//�̼��Ż�ȯ
	@Override
	public void setMap(Map<String, Object> dto) {
		// TODO Auto-generated method stub
		super.setMap(dto);
		ab05.setMapDto(dto);
		aa05.setMapDto(dto);
	}

	/**
	 * dto�����û�id���Ż�ȯ��ˮ��
	 */
	@Override
	public void execute(HttpSession session) throws Exception {
		// TODO Auto-generated method stub
		Map<String, String> coupon=ab05.findById("getCoupon");
		int amount=Integer.parseInt(coupon.get("aab506"));
		//��Ҫaaa502��aab505,aaa102,aab102,aaa503,aaa504
		dto.put("aab102", coupon.get("aab102"));//���������ݲ��ø���
		dto.put("aab505", coupon.get("aab505"));
		
		dto.put("aaa502", coupon.get("aab502"));//��������Ҫ����
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
				this.put("reason","������쳣");
				e.printStackTrace();
			}finally {
				DBUtils.endTransaction();
			}
		}else if(amount==0){
			this.put("result",false);
			this.put("reason","�Ż�ȯ�Ѿ�������");
		}else {//�����������
			aa05.update("addUserCoupon");
			this.put("result", true);
		}
	}

}
