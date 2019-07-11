package com.ego.services.impl;

import java.util.Map;

import com.ego.services.JdbcServicesSupport;

public class PreferenceService extends JdbcServicesSupport{
	//搜索商品，添加购物车，收藏，购买，点击
	//点击加2，购买加5，收藏加5，添加购物车加5，搜索加1
	private boolean	click()throws Exception {
		return false;
	}
	public boolean insertPreference()throws Exception {
		//dto中有用户id和商品id
		//fname为 aab204
		
		StringBuilder sql=new StringBuilder()
				.append(" insert into aa09(aaa102,aaa902,aaa903,aaa904)")
				.append("select ?,aab204,0,pcode  from ab02 join syscode on fcode=aab204")
				.append("where aab203=?");
		return this.executeUpdate(sql.toString(),this.get("aaa102"),this.get("aab203"));
		
	}
}
