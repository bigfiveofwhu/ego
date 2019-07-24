package com.ego.services.impl;

import java.util.List;
import java.util.Map;

import com.ego.services.JdbcServicesSupport;
import com.ego.system.tools.Tools;

public class Ac05ServicesImpl extends JdbcServicesSupport 
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
		if(utype.equalsIgnoreCase("commentService"))
		{
			return this.commentService();
		}
		
		else
		{
			throw new Exception("在类[ Ac05ServicesImpl ]中进行了未定义的动作调用,"
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
		if(qtype.equals("serviceCommentDetail"))
		{
			return null;
		}
		else if(qtype.equalsIgnoreCase("compute5Comment"))
		{
			return compute5Comment();
		}
		else
		{
			throw new Exception("ac05:未知的单一实例查询类型: "+qtype);
			
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
		if(qtype.equalsIgnoreCase("allComment"))
		{
			return this.allServiceComment();
		}
		else if(qtype.equalsIgnoreCase("queryCommentForAac202"))
		{
			return queryCommentForAac202();
		}
		else
		{
			throw new Exception("ac05:未知的批量查询类型:"+qtype);
		}
		
	}
	
	
	//********************************************************************
	//								具体业务
	//********************************************************************
	
	/**
	 * 计算好评率
	 * hug
	 * @return
	 */
	private Map<String,String> compute5Comment() throws Exception
	{
		StringBuilder sql=new StringBuilder()
				.append("select count(y.aac507) as A,count(z.aac507)/count(y.aac507) as grade")
				.append("  from ac04 x,ac05 y,ac05 z")
				.append(" where (z.aac507>=4 and z.aac402=y.aac402)")
				.append("   and (x.aac402=y.aac402)")
				.append("   and (x.aac408='03' and x.aac202='1')")
				;
		return this.queryForMap(sql.toString());
	}
	
	/**
	 * 生成评价
	 * @return
	 * @throws Exception
	 */
	private boolean commentService()throws Exception
	{
		//获取评价id
		int aac502 =Tools.getSequence("aac502");
		this.put("aac502", aac502);
		//1.创建SQL语句
		StringBuilder sql = new StringBuilder()
				.append("insert into ac05(aaa102,aac402,aac502,aac503,aac505,aac507)")
    			.append("          values (?,?,?,?,current_timestamp,?)")
    			;
		//2.编写参数数组
		Object args[]={
				this.get("aaa102"),
				this.get("aac402"),
				aac502,
				this.get("aac503"),
				this.get("aac507")
				//5
				
		};
		System.out.println("***生成新服务评价***");
		System.out.println(sql.toString());
		
		this.changeOrderMode((String)this.get("aac402"));
		
		return this.executeUpdate(sql.toString(), args);
		
	}
	
	/**
	 * 生成评价修改订单状态
	 * @param aac402
	 * @throws Exception
	 */
	private void changeOrderMode(String aac402)throws Exception
	{
		StringBuilder sql1 = new StringBuilder()
				.append("update ac04 a set")
				.append("  a.aac408='03'")
				.append("  where a.aac402=?")
				;
		
		Object args1[]={
				aac402
		};
		this.executeUpdate(sql1.toString(), args1);
	}
	
	
	
	/**
	 * 查询所有评价
	 * @return
	 * @throws Exception
	 */
	private List<Map<String,String>> allServiceComment()throws Exception
	{
		//定义SQL主体
		StringBuilder sql = new StringBuilder()
				.append("select x.aac402,x.aac502,x.aac503,x.aac505,x.aac507,")
				.append("       y.aac410,y.aac411,z.aac103,s.fvalue type")
				.append("  from ac05 x, ac04 y, ac01 z,syscode s")
				.append("  where x.aac402=y.aac402 and  y.aac102=z.aac102 and s.fcode= y.aac410 ")
				.append("  and s.fname='aac106' and x.aaa102=? ")
				;
		

		
  		System.out.println("***显示服务订单条件查询SQL语句***");
  		System.out.println(sql.toString());
  		
  		return this.queryForList(sql.toString(),this.get("aaa102"));
	}
	/**
	 * 查询服务对应的所有评论信息
	 * hug
	 * @return
	 */
	private List<Map<String,String>> queryCommentForAac202() throws Exception
	{
		StringBuilder sql=new StringBuilder()
				.append("select y.aac502,y.aac503,y.aac504,y.aac505,y.aac506,")
				.append("		y.aac507,y.aaa102,z.aaa103")
				.append("  from ac04 x,ac05 y,aa01 z")
				.append(" where z.aaa102=y.aaa102")
				.append("   and x.aac402=y.aac402 and x.aac408='03' and x.aac202=?")
				.append(" limit 12")
				;
		return this.queryForList(sql.toString(), this.get("aac202"));
	}
}
