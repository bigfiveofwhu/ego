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
		//查询用户默认地址
		this.setServices(new Aa04ServiceImpl());
		List<Map<String,String>> list = this.getServices().query();
		if(list.size() > 0)
		{
			//System.out.println(list);
		  this.saveAttribute("addrlist", list);
		}
		//根据商品id查询商品详细信息
		this.setServices(new Ab02ServiceImpl());
		Map<String,String> ins=this.getServices().findById("findNameAndPriceByAab203");
		ins.put("count", this.get("count").toString());   //商品数量
		ins.put("args", this.get("args").toString());     //商品规格
		ins.put("fee", this.get("fee").toString());       //快递费用
		this.saveAttribute("product", ins);
		
		//获得店铺信息
		this.setServices(new Ab02ServiceImpl());
		Map<String, String> shopInfo=this.getServices().findById("findByAab203");
		dto.put("aab102", shopInfo.get("aab102"));
		//获得可用优惠券
		this.setServices(new Aa05ServiceImpl());
		double prince= Integer.parseInt(this.get("count").toString())
				*Double.parseDouble(ins.get("aab205").toString());
		dto.put("price", prince);
		List<Map<String, String>> coupons=this.getServices().query("getUsableCoupons");
		saveAttribute("coupons",coupons);
		//修改用户偏好
		this.setServices(new PreferenceService());
		this.getServices().update("purchase");
		return "WEB-INF/views/createOrder";
		
	}
}
