package com.ego.services.impl;

import java.lang.reflect.Method;
import java.util.Map;

import com.ego.services.JdbcServicesSupport;

public class Ab01ServiceImpl extends JdbcServicesSupport
{

	@Override
	public boolean update(String utype) throws Exception 
	{
		Method method=this.getMethod(utype);
		return (boolean)method.invoke(this);
	}
	
	@Override
	public Map<String, String> findById(String ftype) throws Exception
	{
		StringBuilder sql=new StringBuilder()
				.append("select aab102,aab103,aab104,aab105,aab106,")
				.append("       aab107,aab108,aab109,aab110,aab111")
				.append("  from ab01")
				.append(" where aaa102=?")
				;
		return this.queryForMap(sql.toString(), this.get("aaa102"));
	}
}
