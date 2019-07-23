package com.ego.controller.impl.shop;

import java.util.List;
import java.util.Map;

import com.ego.controller.ControllerSupport;
import com.ego.services.BaseServices;
import com.ego.services.impl.Ab01ServiceImpl;
import com.ego.services.impl.Ab02ServiceImpl;
import com.ego.services.impl.Ab03ServicesImpl;
import com.ego.services.impl.AdStatistic;
import com.ego.services.impl.shop.shopSercvice;
import com.ego.services.impl.T_AreaService;

public class ShopController extends ControllerSupport 
{

	@Override
	public String execute() throws Exception 
	{
		this.dto.put("aab102", this.get("shopId"));
		//���̻�����Ϣֻ��һ��
		this.setServices(new Ab01ServiceImpl());
		Map<String,String> ins=this.getServices().findById("aab102");
		this.saveAttribute("shop", ins);
		//��ȡ���̵�ַ��Ϣ
		String aab105=(String)ins.get("aab105");
		this.dto.put("aab105", aab105.split(" ")[2]);
		this.setServices(new T_AreaService());
		ins=this.getServices().findById("findByAab105");
		this.saveAttribute("position", ins);
		//���ݵ���id������Ʒ��Ϣ
		this.setServices(new Ab02ServiceImpl());
		List<Map<String,String>> rows=this.getServices().query("findProductsByAab102");
		for (Map<String, String> map : rows) {
			String info=map.get("aab208");
			if (info.contains(";")) {
				map.put("path", info.substring(0, info.indexOf(";")));
			}else {
				map.put("path", info);
			}
			
		}
		this.saveAttribute("productList", rows);
		//���¹����Ϣ
		if (this.get("aaa102")!=null&&!this.get("aaa102").equals("")) {
			String aad302=(String)this.get("aId");
			if (aad302!=null&&!aad302.equals("")) {
				dto.put("aad302", this.get("aId"));
				this.setServices(new AdStatistic());
				this.getServices().update("click");
			}
		}
		
		//���������Ʒ��������Ʒ
		dto.put("products", rows);
		this.setServices(new shopSercvice());
		saveAttribute("hotProducts", this.getServices().query());
		this.setServices(new Ab02ServiceImpl());
		List<Map<String, String>> latestProducts=this.getServices().query("findByUpToDate");
		for (Map<String, String> map : latestProducts) {
			String info=map.get("aab208");
			map.put("path", info.substring(0, info.indexOf(";")));
		}
		saveAttribute("latestProducts",latestProducts);
		return "shop/home";
	}

	
}
