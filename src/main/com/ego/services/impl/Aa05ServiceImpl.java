package com.ego.services.impl;

import java.util.List;
import java.util.Map;

import com.ego.services.JdbcServicesSupport;

//个人用户卡券包
public class Aa05ServiceImpl extends JdbcServicesSupport{
	
	@Override
	public List<Map<String, String>> query() throws Exception {
		StringBuilder sql=new StringBuilder()
				.append("select aab102,aaa502,aaa503,aaa504,aaa505,aaa506")
				.append(" from aa05 where aaa102=?");
		return this.queryForList(sql.toString(),this.get("aaa102"));
	}
	private boolean consume() {  
		return false;
	}
	
}
