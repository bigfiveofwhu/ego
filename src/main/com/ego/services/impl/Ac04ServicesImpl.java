package com.ego.services.impl;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import com.ego.services.JdbcServicesSupport;
import com.ego.system.tools.Tools;

public class Ac04ServicesImpl extends JdbcServicesSupport 
{
	//********************************************************************
	//                             业务入口
	//********************************************************************
	/**
	 * 更新操作分支入口
	 */
	@Override
	public boolean update(String utype)throws Exception
	{
		if(utype.equalsIgnoreCase("postNeed"))
		{
			return false;
		}
		else if(utype.equalsIgnoreCase("checkService"))
		{
			return this.checkService();
		}
		else
		{
			throw new Exception("在类[ Ac04ServicesImpl ]中进行了未定义的动作调用,"
								+ "动作名称是  "+utype);
		}
	}
	
	/**
	 * 单一实例查询分支入口
	 * @return
	 * @throws Exception
	 */
	@Override
	public Map<String,String> findById(String qtype)throws Exception
	{
		if(qtype.equals("serviceOrderDetail"))
		{
			return this.serviceOrderDetail();
		}
		if(qtype.equals("comment"))
		{
			return this.queryForComment();
		}
		else
		{
			throw new Exception("ac04:未知的单一实例查询类型: "+qtype);
			
		}
	}
	
	
	/**
	 * 批量查询操作分支入口
	 * @return
	 * @throws Exception
	 */
	@Override
	public List<Map<String,String>> query(String qtype) throws Exception
	{
		if(qtype.equalsIgnoreCase("allServiceOrder"))
		{
			return this.allServiceOrder();
		}
		else
		{
			throw new Exception("ac04:未知的批量查询类型:"+qtype);
		}
		
	}
	
	
	
	//********************************************************************
	//								具体业务
	//********************************************************************
	
	
	/**
	 * 确认服务完工
	 * @return
	 * @throws Exception
	 */
	private boolean checkService()throws Exception
	{
		StringBuilder sql = new StringBuilder()
				.append("update ac04 a set")
				.append("  a.aac405=current_timestamp, a.aac408='02'")
				.append("  where a.aac402=?")
				;
		
		Object args[]={
				this.get("aac402")
		};
		
		return this.executeUpdate(sql.toString(), args);
	}
	
	/**
	 * 查询服务订单详情
	 * @return
	 * @throws Exception
	 */
	private Map<String,String>serviceOrderDetail() throws Exception
	{
		StringBuilder sql =null;
		sql = new StringBuilder()
				.append("select x.aac402,x.aac403,x.aac404,x.aac405,x.aac406,")
				.append("       x.aac407,x.aac408,x.aac409,x.aac410,x.aac411,")
				.append("       y.aac103")
    			.append("  from ac04 x,ac01 y")
    			.append(" where x.aac102=y.aac102 and x.aac402=?")
    			;
		System.out.println("***服务订单详情单一:显示findById()的SQL查询语句****");
		System.out.println(sql.toString()+"订单号:"+this.get("aac402"));
		
		return this.queryForMap(sql.toString(), this.get("aac402"));
	}
	
	/**
	 * 为评论界面查询订单信息
	 * @return
	 * @throws Exception
	 */
	private Map<String,String>queryForComment() throws Exception
	{
		StringBuilder sql =null;
		sql = new StringBuilder()
				.append("select y.aac103,x.aac402,x.aac407,x.aac410")
    			.append("  from ac04 x,ac01 y")
    			.append(" where x.aac102=y.aac102 and x.aac402=?")
    			;

		
		return this.queryForMap(sql.toString(), this.get("aac402"));
	}
	
	/**
	 * 查询所有服务订单
	 * @return
	 * @throws Exception
	 */
	private List<Map<String,String>> allServiceOrder()throws Exception
	{
		//定义SQL主体
		StringBuilder sql = new StringBuilder()
				.append("select x.aac402,x.aac403,x.aac406,x.aac407,x.aac408,")
				.append("       z.fvalue,x.aac412,x.aac202,x.aac602,y.aac103")
				.append("  from ac04 x, ac01 y,syscode z")
				.append("  where x.aac410=z.fcode and z.fname='aac106' ")
				.append("    and x.aac102=y.aac102 and x.aaa102=? ")
				;
		

		
  		System.out.println("***显示服务订单条件查询SQL语句***");
  		System.out.println(sql.toString());
  		
  		return this.queryForList(sql.toString(),this.get("aaa102"));
	}
}
