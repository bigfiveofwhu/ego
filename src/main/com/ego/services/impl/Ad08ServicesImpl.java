package com.ego.services.impl;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import com.ego.services.JdbcServicesSupport;

public class Ad08ServicesImpl extends JdbcServicesSupport 
{
	@Override
	public Map<String, String> findById() throws Exception 
	{
		// TODO Auto-generated method stub
		return super.findById();
	}
	
	@Override
	public Map<String, String> findById(String ftype) throws Exception 
	{
		// TODO Auto-generated method stub
		return super.findById(ftype);
	}
	
	@Override
	public List<Map<String, String>> query(String qtyep) throws Exception 
	{
		// TODO Auto-generated method stub
		return super.query(qtyep);
	}
	
	@Override
	public List<Map<String, String>> query() throws Exception 
	{
		//还原页面查询条件
  		Object aab102=this.get("qaab102");     //姓名  模糊查询
  		Object aab103=this.get("qaab103");     //编号
  		Object aab105=this.get("qaab105");     //性别
  		Object aab106=this.get("qaab106");     //民族
  		Object baab104=this.get("baab104");    //生日B
  		Object eaab104=this.get("eaab104");    //生日E
  		
  		//定义SQL主体
  		StringBuilder sql=new StringBuilder()
  				.append("select x.aab101,x.aab102,x.aab103,x.aab104,a.fvalue cnaab105,")
  				.append("       b.fvalue cnaab106,x.aab108,x.aab109")
  				.append("  from syscode a,syscode b, ab01 x")
  				.append(" where x.aab105=a.fcode and a.fname='aab105'")
  				.append("   and x.aab106=b.fcode and b.fname='aab106'") 
  				;
  		
  		//参数列表
  		List<Object> paramList=new ArrayList<>();
  		//逐一判断查询条件是否录入,拼接AND条件
  		if(this.isNotNull(aab102))
  		{
  			sql.append(" and x.aab102 like ?");
  			paramList.add("%"+aab102+"%");
  		}
  		if(this.isNotNull(aab103))
  		{
  			sql.append(" and x.aab103=?");
  			paramList.add(aab103);
  		}
  		if(this.isNotNull(aab105))
  		{
  			sql.append(" and x.aab105=?");
  			paramList.add(aab105);
  		}
  		if(this.isNotNull(aab106))
  		{
  			sql.append(" and x.aab106=?");
  			paramList.add(aab106);
  		}
  		if(this.isNotNull(baab104))
  		{
  			sql.append(" and x.aab104>=?");
  			paramList.add(baab104);
  		}
  		if(this.isNotNull(eaab104))
  		{
  			sql.append(" and x.aab104<=?");
  			paramList.add(eaab104);
  		}
  		
  		sql.append(" order by x.aab102");
  		return this.queryForList(sql.toString(), paramList.toArray());
	}
	
	@Override
	public boolean update(String utype) throws Exception 
	{
		// TODO Auto-generated method stub
		return super.update(utype);
	}
}
