package com.ego.services.impl;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import com.ego.services.JdbcServicesSupport;

public class Aa07ServicesImpl extends JdbcServicesSupport 
{
	//***********************************************************
	//					业务入口
	//***********************************************************
	
	/**
	 * 批量查询分支入口
	 */
	@Override
	public List<Map<String,String>> query(String qtype) throws Exception
	{
		if(qtype.equalsIgnoreCase("history"))
		{
			return this.queryAllHistory();
		}
		else
		{
			throw new Exception("ab03:未知的批量查询类型:"+qtype);
		}
		
	}
	
	/**
	 * 更新行为分支入口
	 */
	@Override
	public boolean update(String utype) throws Exception
	{
		if(utype.equalsIgnoreCase("delHistory"))
		{
			return this.delHistory();
		}
		else
		{
			throw new Exception("ab03:未知的更新类型:"+utype);
		}
		
	}
	
	
	
	//***********************************************************
	//					具体业务
	//***********************************************************
	
	private boolean delHistory()throws Exception
	{
		String sql = "delete from aa07 where aaa701=?";
		return this.executeUpdate(sql, this.get("aaa701"));
	}
	
	/**
	 * 批量查询历史记录
	 * @return
	 */
	private List<Map<String,String>> queryAllHistory()throws Exception
	{
		//定义SQL主体
		StringBuilder sql = new StringBuilder()
				.append("select a.aaa701,b.aab202,a.aaa702,a.aaa704,b.aab205,")
				.append("       b.aab212,b.aab203,b.aab204")
				.append("  from aa07 a, ab02 b ")
				.append("  where a.aab203=b.aab203 ")
				.append("  and a.aaa704='01' ")
				.append("  and a.aaa102=? ")
				;
		
		//设置参数列表
		List<Object> paramList = new ArrayList<>();
		
		paramList.add(this.get("aaa102"));
  		System.out.println("***显示历史记录条件查询SQL语句***");
  		System.out.println(sql.toString());
  		System.out.println("***显示历史记录查询参数列表***");
  		System.out.println(paramList);
  		
  		return this.queryForList(sql.toString(),this.get("aaa102"));
	}
	
}
