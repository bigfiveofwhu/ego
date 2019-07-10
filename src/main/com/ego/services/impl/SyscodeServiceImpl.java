package com.ego.services.impl;

import java.util.List;
import java.util.Map;

import com.ego.services.JdbcServicesSupport;

public class SyscodeServiceImpl extends JdbcServicesSupport 
{

	@Override
	public List<Map<String, String>> query() throws Exception
	{
		String sql="select fcode,fvalue from syscode where pfcode=? and fname=?";
		Object args[]= {
				this.get("pfcode"),
				this.get("fname")
		};
		return this.queryForList(sql, args);
	}
	
}
