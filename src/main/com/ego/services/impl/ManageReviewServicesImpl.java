package com.ego.services.impl;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import com.ego.services.JdbcServicesSupport;

public class ManageReviewServicesImpl extends JdbcServicesSupport
{
	@Override
	public List<Map<String, String>> query(String qtype) throws Exception {
		if(qtype.equalsIgnoreCase("queryForShops"))
			return this.queryForShops();
		if(qtype.equalsIgnoreCase("queryForGoods"))
			return this.queryForGoods();
		if(qtype.equalsIgnoreCase("queryForServiceProvider"))
			return this.queryForServiceProvider();
		if(qtype.equalsIgnoreCase("queryForServices"))
			return this.queryForServices();
		if(qtype.equalsIgnoreCase("queryForJubao"))
			return this.queryForJubao();
		throw new Exception("未支持的qtype: "+qtype);
	}
	
	/**
	 * 商铺信息查询
	 * @return
	 * @throws Exception
	 */
	public List<Map<String,String>> queryForShops() throws Exception
	{
  		Object aab103=this.get("qaab103");
  		Object aab107=this.get("qaab107");

  		StringBuilder sql=new StringBuilder()
  		  		.append("select y.aaa109,x.aab102,x.aab103,y.aaa108,a.fvalue cnaab107")
  		  		.append("  from syscode a, ab01 x, aa01 y")
  		 	    .append(" where x.aab107=a.fcode and a.fname='aab107'")
  		     	.append("   and x.aaa102=y.aaa102")
  				;
  		
  		List<Object> paramList=new ArrayList<>();
  		if(this.isNotNull(aab103))
  		{
  			sql.append(" and x.aab103 like ?");
  			paramList.add("%"+aab103+"%");
  		}
  		if(this.isNotNull(aab107))
  		{
  			sql.append(" and x.aab107=?");
  			paramList.add(aab107);
  		}
  		return this.queryForList(sql.toString(), paramList.toArray());
	}
	
	/**
	 * 商品信息查询
	 * @return
	 * @throws Exception
	 */
	public List<Map<String,String>> queryForGoods() throws Exception
	{
  		Object aab202=this.get("qaab202");
  		Object aab212=this.get("qaab212");

  		StringBuilder sql=new StringBuilder()
  		  		.append("SELECT aab203,aab202,aab205,s1.fvalue aab204_1,s2.fvalue aab204_2,")
  		  		.append("	    s3.fvalue aab204_3,s4.fvalue cnaab212")
  		 	    .append("  FROM ab02 a,syscode s1,syscode s2,syscode s3,syscode s4")
  		     	.append(" WHERE s3.fcode=aab204 AND s3.fname='aab204' AND s3.pfcode=s2.fcode")
  		     	.append("   AND s2.pfcode=s1.fcode AND s4.fcode=aab212 AND s4.fname='aab212'")
  				;
  		
  		List<Object> paramList=new ArrayList<>();
  		if(this.isNotNull(aab202))
  		{
  			sql.append(" AND aab202 LIKE ?");
  			paramList.add("%"+aab202+"%");
  		}
  		if(this.isNotNull(aab212))
  		{
  			sql.append(" AND aab212=?");
  			paramList.add(aab212);
  		}
  		return this.queryForList(sql.toString(), paramList.toArray());
	}
	
	/**
	 * 服务商信息查询
	 * @return
	 * @throws Exception
	 */
	public List<Map<String,String>> queryForServiceProvider() throws Exception
	{
  		Object aac103=this.get("qaac103");
  		Object aac108=this.get("qaac108");

  		StringBuilder sql=new StringBuilder()
  		  		.append("SELECT aac102,aac103,s1.fvalue cnaac106,aaa109,aaa108,")
  		  		.append("	    s2.fvalue cnaac108")
  		 	    .append("  FROM aa01,ac01,syscode s1,syscode s2")
  		     	.append(" WHERE aa01.aaa102=ac01.aaa102 AND s1.fcode=aac106 AND s1.fname='aac106'")
  				.append("   AND s2.fcode=aac108 AND s2.fname='aac108'")
  				;
  		
  		List<Object> paramList=new ArrayList<>();
  		if(this.isNotNull(aac103))
  		{
  			sql.append(" AND aac103 LIKE ?");
  			paramList.add("%"+aac103+"%");
  		}
  		if(this.isNotNull(aac108))
  		{
  			sql.append(" AND aac108=?");
  			paramList.add(aac108);
  		}
  		return this.queryForList(sql.toString(), paramList.toArray());
	}
	
	/**
	 * 服务信息查询
	 * @return
	 * @throws Exception
	 */
	public List<Map<String,String>> queryForServices() throws Exception
	{
  		Object aac203=this.get("qaac203");
  		Object aac208=this.get("qaac208");

  		StringBuilder sql=new StringBuilder()
  		  		.append("SELECT aac202,aac203,s1.fvalue cnaac204,s2.fvalue cnaac205,aac207,")
  		  		.append("	    s3.fvalue cnaac208")
  		 	    .append("  FROM ac02,syscode s1,syscode s2,syscode s3")
  		     	.append(" WHERE s1.fcode=aac204 AND s1.fname='aac204' AND s2.fcode=aac205")
  		     	.append("	AND s2.fname='aac205' AND s3.fcode=aac208 AND s3.fname='aac208'")
  				;
  		
  		List<Object> paramList=new ArrayList<>();
  		if(this.isNotNull(aac203))
  		{
  			sql.append(" AND aac203 LIKE ?");
  			paramList.add("%"+aac203+"%");
  		}
  		if(this.isNotNull(aac208))
  		{
  			sql.append(" AND aac208=?");
  			paramList.add(aac208);
  		}
  		return this.queryForList(sql.toString(), paramList.toArray());
	}
	
	/**
	 * @author zb
	 * 查询举报表
	 * @return
	 * @throws Exception
	 */
	public List<Map<String,String>> queryForJubao() throws Exception
	{
		//还原页面查询条件
				Object aad706=this.get("aad706");       //投诉处理状态
		       
		  		
		  		//定义SQL主体
		  		StringBuilder sql=new StringBuilder()
		  		  		.append("	select y.aaa102,y.aaa103, x.aad705,x.aad704,")
		  		  		.append("   a.fvalue cnaad702,b.fvalue cnaad703,c.fvalue cnaad704,d.fvalue cnaad706 ")
		  		  		.append("  from ad07 x, aa01 y, syscode a,syscode b,syscode c,syscode d ")
		  		 	    .append(" where x.aaa102=y.aaa102 	")
		  		 	    .append("  and a.fname='aad702' and a.fcode=x.aad702 ")
		  		 	    .append("  and b.fname='aad703' and b.fcode=x.aad703 ")
		  		 	    .append("  and c.fname='aad704' and c.fcode=x.aad704 ")
		  		 	    .append("  and d.fname='aad706' and d.fcode=x.aad706 ")
		  		 	    ;
		  				
		  		//参数列表
		  		List<Object> paramList=new ArrayList<>();
		  		//逐一判断查询条件是否录入,拼接AND条件
		  		if(this.isNotNull(aad706))
		  		{
		  			sql.append(" and x.aab706 like ?");
		  			paramList.add("%"+aad706+"%");
		  		}
		  		//sql.append(" order by x.aab101");
		  		return this.queryForList(sql.toString(), paramList.toArray());
	}
}
