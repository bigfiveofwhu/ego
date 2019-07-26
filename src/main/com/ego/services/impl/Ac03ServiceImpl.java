/**
 * @author hug
 */
package com.ego.services.impl;

import java.lang.reflect.Method;
import java.util.Map;

import com.ego.services.JdbcServicesSupport;
import com.ego.system.tools.Tools;

public class Ac03ServiceImpl extends JdbcServicesSupport
{

	/******************************************************************
	 *       以下为单一实例查询
	 ******************************************************************/
	@Override
	public Map<String, String> findById(String qtype) throws Exception 
	{
		Method method=this.getMethod(qtype);
		return (Map<String, String>)method.invoke(this);
	}
	/**
	 * 根据需求id查询竞标状态  若有数据返回竞标状态  否则返回null
	 * hug
	 * @return
	 * @throws Exception
	 */
	private Map<String, String> findAac302ByAac602() throws Exception
	{
		String sql="select aac302 from ac03 where aac602=?";
		return this.queryForMap(sql, this.getIdList("aac602"));
	}
	
	private Map<String,String> findByAac302() throws Exception
	{
		String sql="select aac302,aac303,aac304,aac305 from ac03 where aac302=?";
		return this.queryForMap(sql, this.get("aac302"));
	}
	
	/***************************************************
	 *      以下为更新方法
	 **************************************************/
	@Override
	public boolean update(String utype) throws Exception 
	{
		Method method=this.getMethod(utype);
		return (boolean)method.invoke(this);
	}
	
	/**
	 * 插入竞标数据表
	 * hug
	 * @return
	 * @throws Exception
	 */
	private boolean insertAc03() throws Exception
	{
		
		String sql="insert into ac03(aac102,aac602,aac302,aac303,aac304,aac305) values(?,?,?,?,?,'01')";   //01 --正在参与 竞标
		Object args[]= {
				this.get("aac102"),
				this.get("aac602"),
				Tools.getIncrementId("aac302"),
				this.get("aac303"),
				this.get("aac304")
		};
		this.apppendSql(sql, args);
		sql="update ac06 set aac609='02' where aac602=?";
		this.apppendSql(sql, this.get("aac602"));
		return this.executeTransaction();
	}
}
