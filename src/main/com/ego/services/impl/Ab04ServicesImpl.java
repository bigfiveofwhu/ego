package com.ego.services.impl;

import java.lang.reflect.Method;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import com.ego.services.JdbcServicesSupport;
import com.ego.system.tools.Tools;

public class Ab04ServicesImpl extends JdbcServicesSupport 
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
		if(utype.equalsIgnoreCase("comment"))
		{
			return this.comment();
		}
		
		else if(utype.equalsIgnoreCase("comment2"))
		{
			return this.comment2();
		}
		else if(utype.equalsIgnoreCase("delComment"))
		{
			return this.delComment();
		}
		else
		{
			throw new Exception("在类[ Ab04ServicesImpl ]中进行了未定义的更新动作调用,"
								+ "动作名称是  "+utype);
		}
	}
	/**
	 * 批量查询操作分支入口
	 */
	@Override
	public List<Map<String, String>> query(String qtype)throws Exception
	{
		if(qtype.equalsIgnoreCase("allComment"))
		{
			return this.allComment();
		}
		else
		{
			throw new Exception("在类[ Ab04ServicesImpl ]中进行了未定义的批量查询动作调用,"
					+ "动作名称是  "+qtype);
		}
	}
	
	
	/**
	 * 单例查询操作分支入口
	 */
	@Override
	public Map<String,String> findById(String qtype)throws Exception
	{
		
		if(qtype.equalsIgnoreCase("commentDetail"))
		{
			return this.commentDetail();
		}
		else
		{
			/**
			 * @author hug
			 *  利用反射调用方法
			 */
			Method method=this.getMethod(qtype);
			return (Map<String, String>)method.invoke(this);
//			throw new Exception("在类[ Ab04ServicesImpl ]中进行了未定义的单一查询动作调用,"
//					+ "动作名称是  "+qtype);
		}
		//执行查询
		
	} 
	
	
	
	
	//********************************************************************
	//                             具体业务
	//********************************************************************
	/**
	 * 查询单一评价详情
	 * @return
	 * @throws Exception
	 */
	private Map<String,String> commentDetail()throws Exception
	{
		StringBuilder sql =null;
		sql = new StringBuilder()
				.append("select a.aab402,a.aab302,b.aab202,a.aab403,a.aab404,")
				.append("		a.aab405,a.aab406,a.aab407,a.aab408,a.aab409,")
				.append("       a.aab410,a.aab411,a.aab412,a.aab413,a.aab203")
    			.append("  from ab04 a, ab02 b")
    			.append(" where a.aab203=b.aab203") 
    			.append(" and a.aab302=?")
    			;
		System.out.println("***查询单一评价详情:显示findById()的SQL查询语句****");
		System.out.println(sql.toString()+"订单号:"+this.get("aab302"));
		return this.queryForMap(sql.toString(), this.get("aab302"));
	}
	
	
	/**
	 * 查询所有评价
	 * @return
	 * @throws Exception
	 */
	private List<Map<String, String>> allComment()throws Exception
	{
		//定义SQL主体
				StringBuilder sql = new StringBuilder()
						.append("select x.aab302,z.aab202,x.aab402,x.aab403,x.aab406,")
						.append("       x.aab410,x.aab412,y.aab303")
						.append("  from ab04 x,ab03 y,ab02 z  ")
						.append("  where x.aab302=y.aab302 ")
						.append("  and x.aab203=z.aab203 ")
						.append("  and x.aaa102=?")
						
						;
				
				
				
				//设置参数列表
				List<Object> paramList = new ArrayList<>();
				
				paramList.add(this.get("aaa102"));

		  		
		  		System.out.println("***显示订单条件查询SQL语句***");
		  		System.out.println(sql.toString());
		  		System.out.println("***显示订单查询参数列表***");
		  		System.out.println(paramList);
		  		
		  		
		  		return this.queryForList(sql.toString(),paramList.toArray());
				
	}
	
	/**
	 * 初评:新增商品评价
	 * @return
	 * @throws Exception
	 */
	private boolean comment()throws Exception
	{
		String aab402=Tools.getCommentId();
		
		
		//1.创建SQL语句
		StringBuilder sql = new StringBuilder()
				.append("insert into ab04(aab302,aaa102,aab203,aab402,aab403,")
    			.append("                 aab406,aab409,aab410,aab411,aab412,")
    			.append("                 aab413)")
    			.append("          values (?,?,?,?,?,")
    			.append("                  current_timestamp,?,?,?,?,")
    			.append("                  0)")
    			;
		//2.编写参数数组
		Object args[]={
				this.get("aab302"),
				this.get("aaa102"),
				this.get("aab203"),
				aab402,
				this.get("aab403"),
				//5
				this.get("aab409"),
				this.get("aab410"),
				this.get("aab411"),
				this.get("aab412")
				//10
				
		};
		System.out.println("***生成新订单***");
		System.out.println(sql.toString());
		this.commentOnce();
		return this.executeUpdate(sql.toString(), args);
		
	}
	/**
	 * 追评:更新商品评价
	 * @return
	 * @throws Exception
	 */
	private boolean comment2()throws Exception
	{
		System.out.println("aab404:"+this.get("aab404"));
		System.out.println("aab302:"+this.get("aab302"));
		System.out.println("aab203:"+this.get("aab203"));
		StringBuilder sql = new StringBuilder()
				.append("update ab04 a set")
				.append("  a.aab404=?,a.aab407=current_timestamp")
				.append("  where a.aab302=? and a.aab203=?")
				;
		
		Object args[]={
				this.get("aab404"),
				this.get("aab302"),
				this.get("aab203")
		};
		
		this.commentTwice();
		return this.executeUpdate(sql.toString(), args);
	}
	
	
	private boolean delComment()throws Exception
	{
		String sql = "delete from ab04 where aab302=? and aab203=? ";
		Object args[]={
				this.get("aab302"),
				this.get("aab203")
		};
		return this.executeUpdate(sql,args);
		
	}

	/**
	 * 初评完修改评价状态
	 * @return
	 * @throws Exception
	 */
	private void commentOnce()throws Exception
	{
		StringBuilder sql = new StringBuilder()
				.append("update ab03 a set")
				.append("  a.aab303='06'")
				.append("  where a.aab302=?")
				;
		
		Object args[]={
				this.get("aab302")
		};
		
		//System.out.println("***显示编辑更新SQL语句****");
		//System.out.println(sql.toString());
		this.executeUpdate(sql.toString(), args);
	}
	
	/**
	 * 追评后修改订单状态
	 * @throws Exception
	 */
	private void commentTwice()throws Exception
	{
		StringBuilder sql = new StringBuilder()
				.append("update ab03 a set")
				.append("  a.aab303='07'")
				.append("  where a.aab302=?")
				;
		
		Object args[]={
				this.get("aab302")
		};
		
		//System.out.println("***显示编辑更新SQL语句****");
		//System.out.println(sql.toString());
		this.executeUpdate(sql.toString(), args);
	}

	/****************************************************
	 *                             以下为查询方法
	 ****************************************************/
	/**
	 * @author hug
	 * 通过商品id,查出累计有多少条评论
	 * @return
	 * @throws Exception
	 */
	private Map<String,String> comentCountByAab203() throws Exception
	{
		String sql="select count(*) as commentSum from ab04 where aab203=?";
		return this.queryForMap(sql, this.get("aab203"));
	}
}
