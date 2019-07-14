package com.ego.controller.impl;

import java.util.Map;

import javax.servlet.http.HttpSession;

import com.ego.controller.ControllerSupport;
import com.ego.services.impl.Aa01ServiceImpl;
import com.ego.services.impl.Ab01ServiceImpl;

public class ShopRegisterController extends ControllerSupport
{
	@Override
	public String execute() throws Exception
	{
		HttpSession session=this.getSession();
		//����û��Ƿ��¼
		Object uid=session.getAttribute("aaa102"); //�û�id
		System.out.println("uid: "+uid);
		if(uid==null) 
		{
			this.saveAttribute("msg", "���¼!");
			return "home/home";
		}
		//����Ƿ���ע�����
		Object shopId=session.getAttribute("aab102");   //����id
		System.out.println("shopId: "+shopId);
		if(shopId!=null)
		{
			this.saveAttribute("msg", "��ע�����,�����ٴγ���!");
			return "home/home";
		}
		//�ѵ�¼����δע����̿ɽ���
		return "WEB-INF/views/shop/register";
	}
}
