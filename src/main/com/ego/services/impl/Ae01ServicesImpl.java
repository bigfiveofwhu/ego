package com.ego.services.impl;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import com.ego.services.JdbcServicesSupport;
import com.ego.system.tools.Tools;

/**
 * 为websocket后端提供dao层，绕过BaseServlet拦截器，所以dto是通过websocket后端解析传来
 * 
 * 处理1对多通知公告
 * ae01:通知公告表
 * ae03:状态表
 * 
 * aae101:流水号
 * aae102:消息内容
 * aae103:发布人
 * aae104:发布时间
 * 
 * aae302:接收人
 * aae303:状态  0-未读 1-已读
 */
public class Ae01ServicesImpl extends JdbcServicesSupport
{
	/**
	 * 获取消息接收人
	 * @param dto
	 * @return
	 * @throws Exception
	 */
	public ArrayList<String> getUsersToSend(Map<String, Object> dto) throws Exception
	{
		ArrayList<String> users=new ArrayList<>();
		String to=String.valueOf(dto.get("to"));
		StringBuilder sql=new StringBuilder();
		List<Object> paramList=new ArrayList<>();
		if(to.equals("fans")) 
		{
			sql.append("      SELECT aaa102")
				.append("		FROM aa03")
				.append("	   WHERE aaa302=? AND aaa303=?")
				;
			paramList.add(1);
			paramList.add(dto.get("from"));
		}
		else if(to.equals("all"))
		{
			sql.append("      SELECT aaa102")
				.append("		FROM aa01")
				;
		}
		else if(to.startsWith("s"))
		{
			users.add(to);
			return users;
		}
		else
		{
			System.out.println("to erro");
		}
		
		List<Map<String, String>> list=this.queryForList(sql.toString(), paramList.toArray());
		for(int i=0;i<list.size();i++)
		{
			users.add(list.get(i).get("aaa102"));
		}
		return users;
	}
	
	/**
	 * 一对多消息，批处理添加已读未读消息
	 * @param dto
	 * @return
	 * @throws Exception
	 */
	public boolean addAe01(Map<String, Object> dto) throws Exception
	{
		String aae101=String.valueOf(Tools.getIncrementId("ae01"));
		StringBuilder sql1 = new StringBuilder()
				.append("INSERT INTO ae01 (aae101,aae102,aae103,aae104)")
				.append("     VALUES (?,?,?,?)")
				;
		Object[] args1 = { 
				aae101, 
				dto.get("content"),
				dto.get("from"),
				dto.get("date"),
				};
		
		StringBuilder sql2=new StringBuilder()
				.append("INSERT INTO ae03 (aae101,aae303,aae302)")
				.append("     VALUES (?,?,?)")
				;

		this.executeUpdate(sql1.toString(), args1);
		//已读消息
		this.appendBatch(sql2.toString(), new Object[] {aae101,"1"},(Object[])dto.get("received"));
		//未读消息
		this.appendBatch(sql2.toString(), new Object[] {aae101,"0"},(Object[])dto.get("unreceived"));
		return this.executeTransaction();
	}
	
	/**
	 * 查看当前用户未读通知
	 * @param dto
	 * @return
	 * @throws Exception
	 */
	public List<Map<String, String>> queryAe01(Map<String, Object> dto) throws Exception
	{
		StringBuilder sql=new StringBuilder()
				.append("SELECT aae301,aae103,aae302,aae102,aae104")
				.append("  FROM ae01,ae03") 
				.append(" WHERE ae01.aae101=ae03.aae101 AND aae302=? AND aae303=0");
		List<Object> paramList=new ArrayList<>();
		paramList.add(dto.get("to"));
		if(isNotNull(dto.get("from"))) 
		{
			sql.append(" AND aae103=?");
			paramList.add(dto.get("from"));
		}
		return this.queryForList(sql.toString(), paramList.toArray());
	}
	
	/**
	 * 修改未读通知为已读
	 * @param aae301
	 * @return
	 * @throws Exception
	 */
	public boolean modifyAe01(String aae301) throws Exception 
	{
		StringBuilder sql=new StringBuilder()
    			.append("UPDATE ae03")
    			.append("   SET aae303=1")
    			.append(" WHERE aae301=?")
    			;
    	return this.executeUpdate(sql.toString(), aae301);
	}
}
