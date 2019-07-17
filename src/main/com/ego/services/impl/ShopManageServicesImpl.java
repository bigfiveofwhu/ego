/**表ab01:店铺表  @author zb
Name	    Code	
店铺流水号	aab101	
用户id	    aaa102	
店铺id	    aab102	
店铺名称	    aab103	
店铺信用积分	aab104	
店铺地址	    aab105	
认证信息   	aab106	
店铺状态	    aab107	01--未审核;02--审核通过;03--审核未通过;04--关闭
保证金	    aab108	
物流评分   	aab109	
服务评分   	aab110	
商品评分   	aab111	
**/
package com.ego.services.impl;

import java.lang.reflect.Method;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import com.ego.services.JdbcServicesSupport;

public class ShopManageServicesImpl extends JdbcServicesSupport
{
	public boolean update(String utype) throws Exception 
    {
		//System.out.println("执行反射");
		Method method=this.getClass().getDeclaredMethod(utype);
		method.setAccessible(true);
		return (boolean)method.invoke(this);
    }
	
	/**
	 * 商铺页面查询
	 */
	public List<Map<String,String>> query() throws Exception
	{

  		//还原页面查询条件
  		Object aab103=this.get("qaab103");     //店铺名称  模糊查询
  		Object aab107=this.get("qaab107");     //店铺状态

  		
  		//定义SQL主体
  		StringBuilder sql=new StringBuilder()
  		  		.append("	select y.aaa109,x.aab102,x.aab103,y.aaa108,a.fvalue cnaab107 	")
  		  		.append("  from syscode a, ab01 x, aa01 y 	")
  		 	    .append(" where x.aab107=a.fcode and a.fname='aab107' 	")
  		     	.append("  and x.aaa102=y.aaa102 	")
  				;
  		
  		//参数列表
  		List<Object> paramList=new ArrayList<>();
  		//逐一判断查询条件是否录入,拼接AND条件
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
  		//sql.append(" order by x.aab101");
  		return this.queryForList(sql.toString(), paramList.toArray());
	}
	
	/**
	 * 获取本店商品评级 待调试
	 * 评价表:ab04
	 * @return
	 * @throws Exception
	 */
	public Map<String,String> getProductAvg() throws Exception
	{
		//获取该商铺所有商品idlist
		String sql1 = "select aab203 from ab02 where aab102 = ?";
		List<Map<String,String>> list = this.queryForList(sql1, this.get("aab102"));
		List<Object> olist = new ArrayList<>(); 
		for(Map<String,String> map : list)
		{
			olist.add(map.get("aab102"));
		}
		
		String sql2 = "select avg(aab410) as productAvg from ab04 where aab203=?";
		return this.queryForMap(sql2,olist.toArray());
	}
	
	/**
	 * 服务评级 待调试
	 * @return
	 * @throws Exception
	 */
	public Map<String,String> getServiceAvg() throws Exception
	{
		//获取该商铺所有商品idlist
		String sql1 = "select aab203 from ab02 where aab102 = ?";
		List<Map<String,String>> list = this.queryForList(sql1, this.get("aab102"));
		List<Object> olist = new ArrayList<>(); 
		for(Map<String,String> map : list)
		{
			olist.add(map.get("aab102"));
		}
		
		String sql2 = "select avg(aab411) as productAvg from ab04 where aab203=?";
		return this.queryForMap(sql2,olist.toArray());
	}
	
	/**
	 * 物流评级 待调试
	 * @return
	 * @throws Exception
	 */
	public Map<String,String> getShipAvg() throws Exception
	{
		//获取该商铺所有商品idlist
		String sql1 = "select aab203 from ab02 where aab102 = ?";
		List<Map<String,String>> list = this.queryForList(sql1, this.get("aab102"));
		List<Object> olist = new ArrayList<>(); 
		for(Map<String,String> map : list)
		{
			olist.add(map.get("aab102"));
		}
		
		String sql2 = "select avg(aab409) as productAvg from ab04 where aab203=?";
		return this.queryForMap(sql2,olist.toArray());
	}
	
	/**
	 * 检查进入店铺资格
	 * @return
	 * @throws Exception
	 */
	public boolean checkIn() throws Exception
	{
		//用户id用session获得
		Object userId = "1";
		String sql1="select a.aab107 from ab01 a where a.aaa102 = ?";
		List<Map<String,String>> list = this.queryForList(sql1,userId );
		if(list.size() > 0)
		{
			//用户审核通过
			if(list.get(0).get("aab107").equals("02"))
					return true;
			else
			//用户审核未通过
				return false;
		}
		//用户未开店
		return false;
	}
	
	/**评论管理**/
/**评价表:ab04
 Name	       Code	
评价流水                 aab401	
订单号(13位)	   aab302	
商品id	       aab203
用户id	       aaa102	
评价id	       aab402	
评论内容	       aab403	
追加评价                aab404	
商家回复	       aab405	
评价时间	       aab406	
追评时间                aab407	
回复时间	       aab408	
物流评级	       aab409	
商品评级	       aab410	
服务评级	       aab411	
是否有图	       aab412	01--有图 02---无图	
点赞数	       aab413	
	 */
	
	public List<Map<String, String>> query(String qtype) throws Exception 
	{
		if(qtype.equalsIgnoreCase("queryforcomment"))
			return this.queryforComment();
		else if(qtype.equalsIgnoreCase("queryforafterbuy"))
			return this.queryforAfterBuy();
		else
			throw new Exception("未定义的qtype");
	}
	
	/**
	 * 查询评论页面
	 * @return
	 * @throws Exception
	 */
	public List<Map<String, String>> queryforComment() throws Exception 
	{
		//还原页面查询条件
				Object aab202=this.get("aab202");       //评论商品名称
		  		Object isreply=this.get("isreply");     //评论是否回复
		  		Object aab412=this.get("aab412");     //是否带图
		  	

		  		
		  		//定义SQL主体
		  		StringBuilder sql=new StringBuilder()
		  		  		.append("	select y.aab202,y.aab203,z.aaa103,x.aab403,x.aab410,x.aab405 ")
		  		  		.append("  from ab04 x, ab02 y, aa01 z 	")
		  		 	    .append(" where x.aab203=y.aab203 and x.aaa102=z.aaa102	")
		  				;
		  		
		  		//参数列表
		  		List<Object> paramList=new ArrayList<>();
		  		//逐一判断查询条件是否录入,拼接AND条件
		  		if(this.isNotNull(aab202))
		  		{
		  			sql.append(" and x.aab202 like ?");
		  			paramList.add("%"+aab202+"%");
		  		}
		  		if(this.isNotNull(isreply))
		  		{
		  			if(isreply.equals("01"))
		  			sql.append(" and x.aab405 is null ");
		  			else
		  				sql.append(" and x.aab405 is not null");
		  			//paramList.add(aab107);
		  		}
		  		if(this.isNotNull(aab412))
		  		{
		  			sql.append(" and x.aab412 = ?");
		  			paramList.add(aab412);
		  		}
		  		//sql.append(" order by x.aab101");
		  		return this.queryForList(sql.toString(), paramList.toArray());
	}
	
	/**
	 * 商家回复评论
	 * @return
	 * @throws Exception
	 */
	public boolean replyComment() throws Exception
	{
		//Object aab405 = this.get("aab405");
		String  sql = "update ab04 a set a.aab405=?";
		
		return this.executeUpdate(sql, this.get("aab405"));
	}

	/*****售后管理******/
	
	/**
	 * 查看售后
	 * @return
	 * @throws Exception
	 */
	public List<Map<String, String>> queryforAfterBuy() throws Exception 
	{
		//还原页面查询条件
		Object aab803=this.get("aab803");       //售后状态
  		Object aab202=this.get("aab202");     //售后商品
  	

  		
  		//定义SQL主体
  		StringBuilder sql=new StringBuilder()
  		  		.append("	select y.aab202,y.aab203,z.aaa103,x.aaa802,x.aaa804,")
  		  		.append("	x.aaa805,q.aab302	")
  		  		.append("  from aa08 x, ab02 y, aa01 z,ab03 q 	")
  		 	    .append(" where x.aab203=y.aab203 and x.aaa102=z.aaa102	and q.aab302=x.aab302")
  				;
  		
  		//参数列表
  		List<Object> paramList=new ArrayList<>();
  		//逐一判断查询条件是否录入,拼接AND条件
  		if(this.isNotNull(aab803))
  		{
  			sql.append(" and x.aab202 like ?");
  			paramList.add("%"+aab803+"%");
  		}
  		if(this.equals(aab202))
  		{
  			sql.append(" and x.aab412 = ?");
  			paramList.add(aab202);
  		}
  		//sql.append(" order by x.aab101");
  		return this.queryForList(sql.toString(), paramList.toArray());
		
	}
	
}