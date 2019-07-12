package com.ego.controller.impl;

import com.ego.controller.ControllerSupport;
import com.ego.services.impl.Ab01ServiceImpl;
import com.ego.services.impl.Ad08ServicesImpl;

public class ShopResgisteredController extends ControllerSupport 
{

	public ShopResgisteredController() 
	{
		this.setServices(new Ab01ServiceImpl());
	}
	
	@Override
	public String execute() throws Exception 
	{
		//������в�������
		this.dto.put("aab103", this.get("shopname"));
		this.dto.put("aab105", this.get("shopaddr"));  //���̵�ַ
		this.dto.put("aab106", this.get("subscribe"));
		this.dto.put("aab108", this.get("amount"));    //��֤��
		this.getServices().update("insertShop");
		//����˱��ύ����
		this.setServices(new Ad08ServicesImpl());
		this.setMapDto(this.dto);
		this.dto.put("aad802", this.get("subscribe"));
		this.dto.put("aad805", this.get("aab102"));
		this.getServices().update("insertAd08");
		
		this.saveAttribute("msg", "�ύ��˳ɹ�!");
		return "WEB-INF/views/shop/register";
	}

}
