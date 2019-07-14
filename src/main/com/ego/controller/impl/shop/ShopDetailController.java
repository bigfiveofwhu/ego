/**
 * @author hug
 */
package com.ego.controller.impl.shop;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.ego.controller.ControllerSupport;
import com.ego.services.impl.Ab02ServiceImpl;
import com.ego.services.impl.Ab03ServiceImpl;
import com.ego.services.impl.Ab03ServicesImpl;
import com.ego.services.impl.Ab04ServicesImpl;

public class ShopDetailController extends ControllerSupport 
{

	@Override
	public String execute() throws Exception 
	{
		this.setServices(new Ab02ServiceImpl());
		this.dto.put("aab203", this.get("productId"));
		//��Ʒ�Ļ�����Ϣ
		Map<String,String> ins=this.getServices().findById("findByAab203");
		this.saveAttribute("product", ins);
		//��dto�з������id
		this.dto.put("aab102", ins.get("aab102"));
		String describe=(String)ins.get("aab207");
		System.out.println(describe);
		//������������ı�
		if(describe!=null)
		{
			List<Map<String,Object>> typeList=new ArrayList<>();
			List<String> t=null;
			Map<String,Object> subTypeList=null;
			
			String types[]=describe.split(";");
			for(String type:types)
			{
				subTypeList=new HashMap<>();
				t=new ArrayList<>();
				
				String subTypes[]=type.split(",");
				int n=subTypes.length;
				for(int i=1;i<n;i++)
				{
					t.add(subTypes[i]);
				}
				subTypeList.put("title", subTypes[0]);
				subTypeList.put("subTypes", t);
				typeList.add(subTypeList);
			}
			this.saveAttribute("spec", typeList);  //���
			System.out.println(typeList);
		}
		this.setServices(new Ab03ServiceImpl());
		//��������
		//ins=this.getServices().findById("orderSumLastMouth");
		//this.saveAttribute("lastMouthSum", ins.get("lastMouthSum"));
		//�ۻ�����
		//ins=this.getServices().findById("orderSum");
		//this.saveAttribute("Sum", ins.get("Sum"));
		//�ۼ�����
		this.setServices(new Ab04ServicesImpl());
		ins=this.getServices().findById("comentCountByAab203");
		this.saveAttribute("commentSum", ins.get("commentSum"));
//		this.saveAttribute("aab103", "ĳ��");
//		Map<String,String> shop=new HashMap<>();
//		shop.put("url", "/ego/images/shop/shop_12.jpg");
//		this.saveAttribute("shop", shop);
//		this.saveAttribute("aab109", "5");
//		this.saveAttribute("aab110", "5");
//		this.saveAttribute("aab111", "5");
//		this.saveAttribute("isCollect", true);  //�Ƿ��ղ�
//		this.saveAttribute("old_aab205", "213");  //����ԭ��
//		this.saveAttribute("aab205", "139");
//		this.saveAttribute("sale_price", "110.97");  //�����۸�
//		this.saveAttribute("comment_count", "57");  //������
//		this.saveAttribute("sale_count", "193");    //��������
//		this.saveAttribute("repertory", "33");  //���
//		this.saveAttribute("collect_count", "2081");
		return "shop/shopDetail";
	}
}