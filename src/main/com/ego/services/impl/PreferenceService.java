package com.ego.services.impl;

import java.util.List;
import java.util.Map;

import com.ego.services.JdbcServicesSupport;

public class PreferenceService extends JdbcServicesSupport{
	//搜索商品，添加购物车，收藏，购买，点击
	//点击加2，购买加3，收藏加5，添加购物车加5，搜索加1
	static final int clickWeight=2;
	static final int purchaseWeight=3;
	static final int addToCartWeight=5;
	static final int likeWeight=5;
	static final int searchWeight=1;
	
	public static final String click="click";
	public static final String purchase="purchase";
	public static final String addToCart="addToCart";
	public static final String like="like";
	public static final String search="search";
	
	@Override
	public boolean update(String utype) throws Exception {
		// TODO Auto-generated method stub
		switch (utype) {
		case click:
			return this.updatePreference(clickWeight);
		case purchase:
			return this.updatePreference(purchaseWeight);
		case addToCart:
			return this.updatePreference(addToCartWeight);
		case like:
			return this.updatePreference(likeWeight);
		case search:
			return this.updateRows();
		default:
			throw new Exception("不支持的类型");
		}
	}
	/**
	 * 要求在dto中传递rows参数，即搜索列表
	 * @return
	 * @throws Exception
	 */
	private boolean updateRows()throws Exception {
		List<Map<String, String>> list=(List<Map<String,String>>)this.get("rows");
		boolean flag=true;
		for (Map<String, String> map : list) {
			flag&=add(searchWeight,map.get("aab204"));
		}
		return flag;
	}
	
	private boolean updatePreference(int weight) throws Exception {
		String type=getType();
		if (ifExist(type)) {
			return add(weight, type);
		}else {
			insertPreference(type);
			return add(weight,type);
		}
	}
	
	private boolean reducePreference()throws Exception {
		String sql="update set aa09=aa09*0.9";
		return this.executeUpdate(sql);
	}
	
	private boolean add(int weight,String type) throws Exception {
		String sql="update aa09 set aaa903=aaa903+? where aaa102=? and aaa902=?";
		Object[] parameter=new Object[] {
			weight,
			this.get("aaa102"),
			type
		};
		
		return this.executeUpdate(sql, parameter);
	}
	
	//获取相应条目是否存在
	private boolean ifExist(String type) throws Exception {
		String sql="select * from aa09 where aaa102=? and aaa902=?";
		Map<String ,String> result=this.queryForMap(sql, this.get("aaa102"),type);
		return result==null?false:true;
	}
	
	//获取通过商品id获得商品类型
	private  String getType() throws Exception {
		String sql="select aab204 from ab02 where aab203=?";
		return this.queryForMap(sql, this.get("aab203")).get("aab204");
	}
	
	public boolean insertPreference(String type)throws Exception {
		//dto中有用户id aaa102 和商品id aab203
		//fname为 aab204
		StringBuilder sql=new StringBuilder()
				.append(" insert into aa09(aaa102,aaa902,aaa903,aaa904)")
				.append(" select ?,?,0,pfcode  from syscode")
				.append(" where fcode=?");
		Object[] parameter=new Object[] {
				this.get("aaa102"),
				type,
				type
		};
		return this.executeUpdate(sql.toString(),parameter);
	}
	
}
