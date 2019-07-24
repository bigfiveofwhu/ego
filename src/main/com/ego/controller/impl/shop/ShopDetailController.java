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
import com.ego.services.impl.Ab03ServicesImpl;
import com.ego.services.impl.Ab04ServicesImpl;
import com.ego.services.impl.Ab05ServiceImpl;
import com.ego.services.impl.AdStatistic;
import com.ego.services.impl.AdvertiseService;
import com.ego.services.impl.PreferenceService;

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
		this.saveAttribute("shopId", ins.get("aab102"));   //在页面存入店铺id
		this.saveAttribute("from_id", ins.get("aaa102"));  //在页面存入发送者id
		this.saveAttribute("from_name", ins.get("aab103"));  //在页面存入店铺名称
		//解析规格描述文本
		String describe=(String)ins.get("aab209");
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
		//解析产品参数/图片描述文本
		describe=ins.get("aab207");
		if(describe!=null)
		{
			List<String> productInfos=new ArrayList<>();   //参数详情
			String infos[]=describe.split("&");
			String a[]=infos[0].split(";");
			for(String b:a)
			{
				productInfos.add(b);
			}
			this.saveAttribute("productInfos", productInfos);
			productInfos=new ArrayList<>();     //商品图片详情url
			a=infos[1].split(";");
			for(String b:a)
			{
				productInfos.add(b);
			}
			this.saveAttribute("productImgs", productInfos);
		}
		//解析图片路径文本
		describe=ins.get("aab208");
		if(describe!=null)
		{
			List<String> productImgs=new ArrayList<>();
			String a[]=describe.split(";");
			for(String b:a)
			{
				productImgs.add(b);
			}
			this.saveAttribute("headImgs", productImgs);
		}
		
		//////////////////////////////////添加优惠券功能
		this.setServices(new Ab05ServiceImpl());
		List<Map<String, String>>coupons= this.getServices().query();
		saveAttribute("coupons", coupons);
		///////////////修改用户偏好
		if (this.get("aaa102")!=null&&!this.get("aaa102").equals("")) {
			this.setServices(new PreferenceService());
			this.getServices().update("click");
		}
		
		//////////////更新广告点击信息
		if (this.get("aaa102")!=null&&!this.get("aaa102").equals("")) {
			String aad302=(String)this.get("aId");
			if (aad302!=null&&!aad302.equals("")) {
				dto.put("aad302", this.get("aId"));
				this.setServices(new AdStatistic());
				this.getServices().update("click");
			}
		}
		//获取猜你喜欢的广告
		this.setServices(new AdvertiseService());
		dto.put("productType",ins.get("aab204"));
		List<Map<String, String>> products=this.getServices().query("getSameProducts");
		for (Map<String, String> map : products) {
			map.put("path_info", map.get("aab208").split(";")[0] );
		}
		saveAttribute("sameProducts",products);
		
		
		this.setServices(new Ab03ServicesImpl());
		//上月销量
		ins=this.getServices().findById("orderSumLastMouth");
		this.saveAttribute("lastMouthSum", ins.get("lastmouthsum"));
		//累积销量
		ins=this.getServices().findById("orderSum");
		this.saveAttribute("Sum", ins.get("sum"));
		
		this.setServices(new Ab04ServicesImpl());
		//好评
		ins=this.getServices().findById("commentBestByAab203");
		this.saveAttribute("bestSum", Integer.parseInt(ins.get("commentsum").toString()));
		//中评
		ins=this.getServices().findById("commentMidByAab203");
		this.saveAttribute("midSum", ins.get("commentsum"));
		//差评
		ins=this.getServices().findById("commentBadByAab203");
		this.saveAttribute("badSum", ins.get("commentsum"));
		//累计评价
		ins=this.getServices().findById("comentCountByAab203");
		this.saveAttribute("commentSum", Integer.parseInt(ins.get("commentsum").toString()));
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
