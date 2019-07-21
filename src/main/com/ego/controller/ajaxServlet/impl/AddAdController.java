package com.ego.controller.ajaxServlet.impl;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import com.ego.controller.ajaxServlet.AjaxControllerSupport;
import com.ego.services.BaseServices;
import com.ego.services.impl.AdvertiseService;
import com.ego.system.db.DBUtils;
import com.ego.system.tools.Tools;
import com.ego.system.utils.FileUpload;

public class AddAdController extends AjaxControllerSupport {

	BaseServices service = new AdvertiseService();

	@Override
	public void setMap(Map<String, Object> dto) {
		// TODO Auto-generated method stub
		super.setMap(dto);
		service.setMapDto(dto);
	}

	@Override
	public void execute(HttpSession session) throws Exception {
		// TODO Auto-generated method stub
		// boolean result=service.update("insertAd");
		HttpServletRequest request = (HttpServletRequest) dto.get("request");
		int adId = Tools.getIncrementId("ad03");
		dto.put("aad302", adId);
		try {
			DBUtils.beginTransaction();
			FileUpload.writeFile(Integer.toString(adId), request,dto);//����ļ�ͬʱ��dto��������
			Map<String, String> account=service.findById("getAccountById");
			double balance=Double.parseDouble(account.get("aad403"));
			double money=Double.parseDouble(this.get("aad304").toString());
			dto.put("decrement", money);
			String productType=dto.get("aad303").toString();//��ȡ�ƹ�Ʒ����
			if (productType.equals(AdvertiseService.shoptAd)) {
				dto.put("aad306", dto.get("aab102"));
			}
			if (balance<money) {
				this.put("result", false);
				this.put("reason", "�˻�����");
				return;
			}
			else if (service.update("insertAd")&&service.update("chargeMoney")) {
				this.put("result", true);
			}else {
				this.put("result", false);
				this.put("reason", "�������ݿ�ʧ��");
				DBUtils.rollback();
			}
			DBUtils.commit();
		} catch (Exception e) {
			// TODO: handle exception
			this.put("result", false);
			this.put("reason", "���ݿ��쳣");
			e.printStackTrace();
			DBUtils.rollback();
		}finally {
			DBUtils.endTransaction();
		}
	}
	
	

}
