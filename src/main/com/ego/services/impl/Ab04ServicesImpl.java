package com.ego.services.impl;

import com.ego.services.JdbcServicesSupport;
import com.ego.system.tools.Tools;

public class Ab04ServicesImpl extends JdbcServicesSupport 
{
	@Override
	public boolean update(String utype)throws Exception
	{
		if(utype.equalsIgnoreCase("comment"))
		{
			return this.comment();
		}
		
		else if(utype.equalsIgnoreCase("comment2"))
		{
			return false;
		}
		else
		{
			throw new Exception("在类[ Ab04ServicesImpl ]中进行了未定义的更新动作调用,"
								+ "动作名称是  "+utype);
		}
	}
	
	/**
	 * 新增商品评价
	 * @return
	 * @throws Exception
	 */
	private boolean comment()throws Exception
	{
		String commentId=Tools.getCommentId();
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
				commentId,
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


	

}
