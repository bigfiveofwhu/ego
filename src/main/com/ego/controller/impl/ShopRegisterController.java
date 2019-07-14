package com.ego.controller.impl;

import java.util.Map;

import javax.servlet.http.HttpSession;

import com.ego.controller.ControllerSupport;
import com.ego.services.impl.Aa01ServiceImpl;
import com.ego.services.impl.Ab01ServiceImpl;

public class ShopRegisterController extends ControllerSupport
{
	public ShopRegisterController() 
	{
		this.setServices(new Ab01ServiceImpl());
	}

	@Override
	public String execute() throws Exception
	{
		HttpSession session=this.getSession();
		//����û��Ƿ��¼
		String uid=(String)session.getAttribute("aaa102"); //�û�id
		System.out.println(uid);
		if(uid==null) return "home/home";
		
		//����Ƿ���ע�����
		Map<String,String> ins=this.getServices().findById("aaa102");
		System.out.println(ins);
		if(ins!=null && ins.get("aab102")!=null) return "home/home";
		
		//δע�����
		this.setServices(new Aa01ServiceImpl());
		this.dto.put("aaa102", uid);
		this.getServices().setMapDto(this.dto);
		ins=this.getServices().findById("aaa102");
		System.out.println(ins);
		String addr=ins.get("aaa111");
		if(addr!=null) 
		{
			String addrs[]=addr.split(" ");
			this.saveAttribute("addr_1", addrs[0]);
			this.saveAttribute("addr_2", addrs[1]);
			this.saveAttribute("addr_3", addrs[2]);
			this.saveAttribute("addr_4", addrs[3]);
		}
		return "WEB-INF/views/shop/register";
	}
}
