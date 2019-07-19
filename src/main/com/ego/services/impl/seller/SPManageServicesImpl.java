/**
 * @author zb
 * 服务商信息管理
 */
package com.ego.services.impl.seller;

import java.lang.reflect.Method;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import com.ego.services.JdbcServicesSupport;
import com.ego.system.tools.Tools;

public class SPManageServicesImpl extends JdbcServicesSupport 
{
	public boolean update(String utype) throws Exception 
    {
		Method method=this.getClass().getDeclaredMethod(utype);
		method.setAccessible(true);
		return (boolean)method.invoke(this);
    }
	
	/**
	 * 查询
	 */
	@Override
	public List<Map<String,String>> query(String qtype) throws Exception
	{
		if(qtype.equalsIgnoreCase("queryforservice"))
			return this.queryforService();
		if(qtype.equalsIgnoreCase("queryforcomment"))
			return this.queryforComment();
		if(qtype.equalsIgnoreCase("queryfororder"))
			return this.queryforOrder();
        throw new Exception("[SPManageServicesImpl] 中未定义的qtype");		
	}
	
	/**
	 * 查询该服务商信息:一个用户拥有一个服务商
	 */
	@Override
	public Map<String, String> findById() throws Exception 
	{
        StringBuilder sql = new StringBuilder()
        		.append("select a.aac103,a.aac104,t.areaName cnaac105,b.fvalue cnaac106, ")
        		.append(" a.aac107,c.fvalue cnaac108,a.aac109,a.aac110" )
        		.append(" from ac01 a,syscode b,syscode c,T_Area t")
        		.append(" where b.fname = 'aac106' and b.fcode = a.aac106 ")
        		.append(" and   c.fname = 'aac108' and c.fcode = a.aac108 ")
        		.append(" and t.areaId = a.aac105")
        		.append(" and   a.aaa102 = ?")
        		;
		return this.queryForMap(sql.toString(), this.get("aaa102"));
	}
	
	/**服务管理***/
/**服务表:ac02
 Name    	Code	
服务流水号	aac201	
服务商id	    aac102	
服务id	    aac202	
服务名称	    aac203	
服务类型	    aac204	
服务方式	    aac205	
服务区间	    aac206	
服务描述	    aac207	
状态   	    aac208	01--未审核,02--审核通过,03--审核未通过,04--下架
	 */
	
	/**
	 * 查询该服务商服务信息
	 * @return
	 * @throws Exception
	 */
	private List<Map<String,String>> queryforService() throws Exception
	{
		//还原页面查询条件
  		Object aac203=this.get("qaac203");     //服务名称  模糊查询
  		Object aac208=this.get("qaac208");     //服务状态
  		Object aac102=this.get("aac102");   //服务商id

  		
  		//定义SQL主体
  		StringBuilder sql=new StringBuilder()
  				.append(" select a.aac202,a.aac203,b.fvalue cnaac204, ")
  				.append("       c.fvalue cnaac205,a.aac206,a.aac207, ")
  				.append("       d.fvalue cnaac208 ")
  				.append(" from ac02 a,syscode b,syscode c,syscode d ")
  				.append(" where b.fname='aac204' and b.fcode = a.aac204 ")
  				.append(" and   c.fname='aac205' and c.fcode = a.aac205 ")
  				.append(" and   d.fname='aac208' and d.fcode = a.aac208 ")
  				;
  		
  		//参数列表
  		List<Object> paramList=new ArrayList<>();
  		//逐一判断查询条件是否录入,拼接AND条件
  		if(this.isNotNull(aac203))
  		{
  			sql.append(" and a.aac203 like ?");
  			paramList.add("%"+aac203+"%");
  		}
  		if(this.isNotNull(aac208))
  		{
  			sql.append(" and a.aac208=?");
  			paramList.add(aac208);
  		}
  		if(this.isNotNull(aac102))
  		{
  			sql.append(" and a.aac102=?");
  			paramList.add(aac102);
  		}
  		//sql.append(" order by x.aab101");
  		return this.queryForList(sql.toString(), paramList.toArray());
	}
	
	
	
	
	/**服务评价管理**/
/**
 *服务评价表:ac05 
Name	Code	
评价流水	aac501	
订单号	aac402	
评价id	aac502	
评价内容	aac503	
商家回复	aac504	
评价时间	aac505	
回复时间	aac506
服务评级	aac507	
	 */
	
	
	/**
	  * 查询该服务商所有评价
	 * @return
	 * @throws Exception
	 */
	private List<Map<String,String>> queryforComment() throws Exception
	{
		//还原页面查询条件
		Object aac203=this.get("qaac203");       //评论服务名称
  		Object isreply=this.get("isreply");     //评论是否回复
  		Object aac102=this.get("aac102");    //服务商id,session获取
  	

  		
  		//定义SQL主体
  		StringBuilder sql=new StringBuilder()
  		  		.append("	select x.aac502,x.aac503,x.aac504,x.aac505,x.aac506,x.aac507,z.aac203")
  		  		.append("  from ac05 x,ac04 y,ac02 z 	")
  		 	    .append(" where x.aac402=y.aac402 	")
  		 	    .append(" and y.aac202 = z.aac202")
  				;
  		
  		//参数列表
  		List<Object> paramList=new ArrayList<>();
  		//逐一判断查询条件是否录入,拼接AND条件
  		if(this.isNotNull(aac203))
  		{
  			sql.append(" and z.aac203 like ?");
  			paramList.add("%"+aac203+"%");
  		}
  		if(this.isNotNull(isreply))
  		{
  			if(isreply.equals("01"))
  			sql.append(" and x.aac504 is null ");
  			else
  				sql.append(" and x.aac504 is not null");
  			//paramList.add(aab107);
  		}
  		if(this.isNotNull(aac102))
  		{
  			sql.append(" and y.aac102 = ?");
  			paramList.add(aac102);
  		}
  		//sql.append(" order by x.aab101");
  		return this.queryForList(sql.toString(), paramList.toArray());
	}
	
	/**
	 * 回复评论
	 * @return
	 * @throws Exception
	 */
	public boolean replyComment() throws Exception
	{
		String sql = "update ac05  set aac504 = ? ,aac506 = current_time where aac502 = ?";
	    Object args[]= {
				this.get("aac504"),
		};
		return this.batchUpdate(sql, args, this.get("aac502"));
	}
	
	/**订单管理***/
	/**
	 * Name	Code	
订单流水	aac401	
用户id	aaa102	
服务商id	aac102	
需求id	aac602	
服务id	aac202	
订单号	aac402		
创建时间	aac403	
预付时间	aac404	
成交时间	aac405
成交总额	aac407	
预付金额	aac406	
订单状态	aac408	
服务地址	aac409	
服务类型	aac410	
工作描述	aac411	
订单来源	aac412	
	 */
	/**
	  * 服务订单查询
	 * @return
	 * @throws Exception
	 */
	private List<Map<String,String>> queryforOrder() throws Exception
	{
		//还原页面查询条件
		Object aac408=this.get("qaac408");       //01--已预付,02--已完成
        Object aac402=this.get("qaac402");   //订单号
  		
  		//定义SQL主体
  		StringBuilder sql=new StringBuilder()
  				.append(" select x.aac402,x.aac404,x.aac405,x.aac407, ")
  				.append("        x.aac406")
  				.append(" from ac04 x ")
  				.append(" where 1")
  				;
  		
  		//参数列表
  		List<Object> paramList=new ArrayList<>();
  		//逐一判断查询条件是否录入,拼接AND条件
  		if(this.isNotNull(aac402))
  		{
  			sql.append(" and x.aac402 like ?");
  			paramList.add("%"+aac402+"%");
  		}
  		if(this.isNotNull(aac408))
  		{
  			sql.append(" and x.aac408 = ?");
  			paramList.add(aac408);
  		}
  		//sql.append(" order by x.aab101");
  		return this.queryForList(sql.toString(), paramList.toArray());
	}
	
	/**
	  * 成交订单
	 * @return
	 */
	public boolean okOrder() throws Exception
	{
		String sql ="update ac04 set aac405 = current_time,aac407 = aac406,aac408 = ? where aac402 = ?";
		
		
		return this.batchUpdate(sql, new Object[] {"02"},this.get("aac402"));
    }
	
	/**服务***/
	/**
	 * 增加服务
	 * @return
	 * @throws Exception
	 */
	public boolean addService() throws Exception
	{
		Object aac102 = 1;
				//this.get("aac102");//服务商id session获取
		//获取当前商品编号
    	int aac202=Tools.getIncrementId("ac02");
    
    	//向DTO添加商品编号
    	this.put("aac202", aac202);
    	
    	
    	//1.编写SQL语句
    	StringBuilder sql=new StringBuilder()
    			.append("insert into ac02(aac102,aac202,aac203,aac204,aac205,")
    			.append("                 aac206,aac207,aac208,aac209,aac210)")
    			.append("          values(?,?,?,?,?,")
    			.append("                 ?,?,?,?,?)")
    			;
	 
    	//2.编写参数数组
    	Object args[]={
    			aac102,   //服务商id
    			this.get("aac202"),
    			this.get("aac203"),
    			this.get("aac204"),
    			this.get("aac205"),
    			this.get("aac206"),
    			this.get("aac207"),
    			"01",
    			this.get("aac209"),
    			"/images/service/071803.jpg;/images/service/071801.jpg;/images/service/071802.jpg"
    	};
        return this.executeUpdate(sql.toString(), args);	
	}
	
}
