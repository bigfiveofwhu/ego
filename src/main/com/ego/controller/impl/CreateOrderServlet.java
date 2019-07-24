package com.ego.controller.impl;

import java.util.List;
import java.util.Map;

import com.ego.services.impl.Aa04ServiceImpl;
import com.ego.services.impl.Aa05ServiceImpl;
import com.ego.services.impl.Ab02ServiceImpl;
import com.ego.services.impl.PreferenceService;

public class CreateOrderServlet extends OrderControllerSupport
{

	@Override
	public String execute() throws Exception
	{
		//��ѯ�û�Ĭ�ϵ�ַ
		this.setServices(new Aa04ServiceImpl());
		List<Map<String,String>> list = this.getServices().query();
		if(list.size() > 0)
		{
			//System.out.println(list);
		  this.saveAttribute("addrlist", list);
		}
		//������Ʒid��ѯ��Ʒ��ϸ��Ϣ
		this.setServices(new Ab02ServiceImpl());
		Map<String,String> ins=this.getServices().findById("findNameAndPriceByAab203");
		ins.put("count", this.get("count").toString());   //��Ʒ����
		ins.put("args", this.get("args").toString());     //��Ʒ���
		ins.put("fee", this.get("fee").toString());       //��ݷ���
		this.saveAttribute("product", ins);
		
		//��õ�����Ϣ
		this.setServices(new Ab02ServiceImpl());
		Map<String, String> shopInfo=this.getServices().findById("findByAab203");
		dto.put("aab102", shopInfo.get("aab102"));
		//��ÿ����Ż�ȯ
		this.setServices(new Aa05ServiceImpl());
		double prince= Integer.parseInt(this.get("count").toString())
				*Double.parseDouble(ins.get("aab205").toString());
		dto.put("price", prince);
		List<Map<String, String>> coupons=this.getServices().query("getUsableCoupons");
		saveAttribute("coupons",coupons);
		//�޸��û�ƫ��
		this.setServices(new PreferenceService());
		this.getServices().update("purchase");
		return "WEB-INF/views/createOrder";
		
	}
}
