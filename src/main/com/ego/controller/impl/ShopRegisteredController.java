package com.ego.controller.impl;

import com.ego.controller.ControllerSupport;
import com.ego.services.impl.Ab01ServiceImpl;
import com.ego.services.impl.Ad08ServicesImpl;

public class ShopRegisteredController extends ControllerSupport 
{

	public ShopRegisteredController() 
	{
		this.setServices(new Ab01ServiceImpl());
	}
	
	@Override
	public String execute() throws Exception 
	{
		//������в�������
		this.dto.put("aab103", this.get("shopname"));
		String addr_1=(String)this.get("addr_1")+" ";
		String addr_2=(String)this.get("addr_2")+" ";
		String addr_3=(String)this.get("addr_3")+" ";
		String addr_4=(String)this.get("addr_4");
		String shopaddr=addr_1+addr_2+addr_3+addr_4;
		this.dto.put("aab105", shopaddr);  //���̵�ַ
		this.dto.put("aab106", this.get("subscribe"));  //��������
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
