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
	 * 商铺页面查询:
	 */
	public List<Map<String,String>> query() throws Exception
	{

  		//还原页面查询条件
  		Object aab103=this.get("qaab103");     //店铺名称  模糊查询
  		Object aab107=this.get("qaab107");     //店铺状态
  		Object aab102=this.get("aab102");   //店铺id

  		
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
  		if(this.isNotNull(aab102))
  		{
  			sql.append(" and x.aab102=?");
  			paramList.add(aab102);
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
	@SuppressWarnings("unused")
	private boolean checkIn() throws Exception
	{
		//用户id用session获得
		//Object userId = "1";
		String sql1="select a.aab107 from ab01 a where a.aaa102 = ?";
		List<Map<String,String>> list = this.queryForList(sql1,this.get("aaa102") );
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
		else if(qtype.equalsIgnoreCase("queryfororder"))
			return this.queryforOrder();
		else if(qtype.equalsIgnoreCase("queryforshopinfo"))
			return this.queryforShopInfo();
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
				Object aab202=this.get("qaab202");       //评论商品名称
		  		Object isreply=this.get("isreply");     //评论是否回复
		  		Object aab412=this.get("qaab412");     //是否带图
		  		Object aab102=this.get("aab102");    //店铺id
		  	

		  		
		  		//定义SQL主体
		  		StringBuilder sql=new StringBuilder()
		  		  		.append("	select y.aab202,y.aab203,z.aaa103,x.aab403,x.aab410,x.aab405,x.aab402,x.aab412 ")
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
		  		if(this.isNotNull(aab102))
		  		{
		  			sql.append(" and y.aab102 = ?");
		  			paramList.add(aab102);
		  		}
		  		//sql.append(" order by x.aab101");
		  		return this.queryForList(sql.toString(), paramList.toArray());
	}
	
	/**
	 * 商家回复评论
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("unused")
	private boolean replyComment() throws Exception
	{
		//Object aab405 = this.get("aab405");
		String  sql = "update ab04 a set a.aab405=?,a.aab408 = current_time where a.aab402=?";
		
		//System.out.println("aab405"+(String)this.get("aab405"));
		//String aab402 = (String)this.get("aab402");
	
		return this.batchUpdate(sql, new Object[] { this.get("aab405") },this.get("aab402"));
	}

	/*****售后管理******/
	
	/**
 Name	     Code	
售后流水号	aaa801	
售后id	    aaa802	
订单号(13位)	aab302	
商品id	    aab203	
用户id	    aaa102	
店铺id	    aab102	
售后状态	    aaa803	01--未处理,02--已处理
售后类型	    aaa804	暂时用01-售后类型1,02-售后类型2,03-售后类型3
售后描述	    aaa805	
售后原因	    aaa806	
提交时间	    aaa807	
处理时间	    aaa808	
完成时间	    aaa809	
	 */
	/**
	 * 查看售后 
	 * @return
	 * @throws Exception
	 */
	public List<Map<String, String>> queryforAfterBuy() throws Exception 
	{
		//还原页面查询条件
		Object aaa803=this.get("qaaa803");       //售后状态 01--未处理 02--已处理
  		Object aab202=this.get("qaab202");     //售后商品
  		Object aab102=this.get("aab102");//商品id
  	

  		
  		//定义SQL主体
  		StringBuilder sql=new StringBuilder()
  		  		.append("	select y.aab202,y.aab203,z.aaa103,x.aaa802,x.aaa804,s.fvalue cnaaa803,")
  		  		.append("	w.fvalue cnaaa804,x.aaa805,q.aab302	")
  		  		.append("  from aa08 x, ab02 y, aa01 z,ab03 q,syscode s,syscode w	")
  		 	    .append(" where x.aab203=y.aab203 and x.aaa102=z.aaa102	and q.aab302=x.aab302")
  		 	    .append("   and s.fname= 'aaa803' and s.fcode = x.aaa803 ")
  		 	    .append("  and w.fname ='aaa804' and w.fcode = x.aaa804")
  		 	  //  .append("  and x.aab102=?")
  				;
  		
  		//参数列表
  		List<Object> paramList=new ArrayList<>();
  		//逐一判断查询条件是否录入,拼接AND条件
  		if(this.isNotNull(aaa803))
  		{
  			sql.append(" and x.aaa803 = ?");
  			paramList.add("%"+aaa803+"%");
  		}
  		if(this.isNotNull(aab202))
  		{
  			sql.append(" and x.aab202 like ?");
  			paramList.add(aab202);
  		}
  		if(this.isNotNull(aab102))
  		{
  			sql.append(" and x.aab102 = ?");
  			paramList.add(aab102);
  		}
  		
  		//sql.append(" order by x.aab101");
  		return this.queryForList(sql.toString(), paramList.toArray());
		
	}
	
/**订单管理*****/
/**
 Name	     Code	
订单流水号	aab301	
用户id	    aaa102	
商品id	    aab203	
订单号(13位)	aab302	
订单状态	    aab303	
创建时间   	aab304	
付款时间	    aab305	
发货时间	    aab306	
收货时间	    aab307	
可见状态	    aab308	
物流号	    aab309	
数量  	    aab310	
收货地址	    aab311	
买家留言	    aab312	
运费   	    aab313	
商品价格	    aab314	
商品规格	    aab315	
**/

	/**
	 * 查询该商铺所有订单 
	 * @return
	 * @throws Exception
	 */
	public List<Map<String, String>> queryforOrder() throws Exception
	{
		//
		
		//还原页面查询条件
				Object aab303=this.get("qaab303");       //
                Object aab302=this.get("qaab302");   //订单号
                Object aab102=this.get("aab102");
		  		
		  		//定义SQL主体
		  		StringBuilder sql=new StringBuilder()
		  				.append(" select x.aab302,x.aab304,x.aab312,x.aab306, ")
		  				.append("        x.aab314,x.aab310,s.fvalue cnaab303 ")
		  				.append(" from ab03 x,syscode s,ab02 a")
		  				.append(" where s.fname='aab303' and s.fcode = x.aab303 ")
		  				.append("   and a.aab203 = x.aab203 ")
		  				;
		  		
		  		//参数列表
		  		List<Object> paramList=new ArrayList<>();
		  		//逐一判断查询条件是否录入,拼接AND条件
		  		if(this.isNotNull(aab303))
		  		{
		  			sql.append(" and x.aab303 = ?");
		  			paramList.add(aab303);
		  		}
		  		if(this.isNotNull(aab302))
		  		{
		  			sql.append(" and x.aab302 like ?");
		  			paramList.add("%"+aab302+"%");
		  		}
		  		if(this.isNotNull(aab102))
		  		{
		  			sql.append(" and a.aab102 = ?");
		  			paramList.add(aab102);
		  		}
		  		
		  		//sql.append(" order by x.aab101");
		  		return this.queryForList(sql.toString(), paramList.toArray());
	}
	
	/**
	 * 订单发货
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("unused")
	private boolean deliverGoods() throws Exception
	{
		String sql = "update ab03 set aab303 = ?,aab306 = current_time,aab309 = ? where aab302 = ?";
    	Object args[]={
    			"04", //04--修改状态已发货
    			this.get("aab309")
    	};
		return this.batchUpdate(sql, args, this.get("aab302"));
	}
	
	/******分割线  ********/
	
	/**
	 * 展示商铺信息
	 * @return
	 * @throws Exception
	 */
	public List<Map<String,String>> queryforShopInfo() throws Exception
	{
		StringBuilder sql = new StringBuilder()
				.append("select a.aab103,a.aab104,a.aab105,a.aab106,s.fvalue cnaab107,")
				.append("  a.aab108,a.aab109,a.aab110,a.aab111 ")
				.append(" from ab01 a,syscode s")
				.append(" where s.fname='aab107' and s.fcode=a.aab107")
				.append("  and a.aab102=?")
				;
		return this.queryForList(sql.toString(),this.get("aab102"));
	}
	

	
}