/**
 * @author hug
 *  商品详情
 */
package com.ego.controller.impl.shop;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.ego.controller.ControllerSupport;
import com.ego.services.impl.Aa07ServiceImpl;
import com.ego.services.impl.Ab02ServiceImpl;
import com.ego.services.impl.Ab03ServiceImpl;
import com.ego.services.impl.Ab03ServicesImpl;
import com.ego.services.impl.Ab04ServicesImpl;

public class ShopDetailController extends ControllerSupport 
{

	@Override
	public String execute() throws Exception 
	{
		//若用户登录了,则记录相应的浏览历史
		this.dto.put("aab203", this.get("productId"));
		if(this.get("aaa102")!=null)
		{
			this.setServices(new Aa07ServiceImpl());
			this.getServices().update("insertAa07");
		}
		this.setServices(new Ab02ServiceImpl());
		//商品的基本信息
		Map<String,String> ins=this.getServices().findById("findByAab203");
		this.saveAttribute("product", ins);
		//在dto中放入店铺id
		this.dto.put("aab102", ins.get("aab102"));
		String describe=(String)ins.get("aab209");
		System.out.println(describe);
		//解析规格描述文本
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
			this.saveAttribute("spec", typeList);  //规格
			System.out.println(typeList);
		}
		this.setServices(new Ab03ServiceImpl());
		//上月销量
		//ins=this.getServices().findById("orderSumLastMouth");
		//this.saveAttribute("lastMouthSum", ins.get("lastMouthSum"));
		//累积销量
		//ins=this.getServices().findById("orderSum");
		//this.saveAttribute("Sum", ins.get("Sum"));
		//累计评价
		this.setServices(new Ab04ServicesImpl());
		ins=this.getServices().findById("comentCountByAab203");
		this.saveAttribute("commentSum", ins.get("commentSum"));
//		this.saveAttribute("aab103", "某宝");
//		Map<String,String> shop=new HashMap<>();
//		shop.put("url", "/ego/images/shop/shop_12.jpg");
//		this.saveAttribute("shop", shop);
//		this.saveAttribute("aab109", "5");
//		this.saveAttribute("aab110", "5");
//		this.saveAttribute("aab111", "5");
//		this.saveAttribute("isCollect", true);  //是否收藏
//		this.saveAttribute("old_aab205", "213");  //售卖原价
//		this.saveAttribute("aab205", "139");
//		this.saveAttribute("sale_price", "110.97");  //售卖价格
//		this.saveAttribute("comment_count", "57");  //评论数
//		this.saveAttribute("sale_count", "193");    //售卖总数
//		this.saveAttribute("repertory", "33");  //库存
//		this.saveAttribute("collect_count", "2081");
		return "shop/shopDetail";
	}
}
