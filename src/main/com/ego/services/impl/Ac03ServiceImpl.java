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
	 *       ����Ϊ��һʵ����ѯ
	 ******************************************************************/
	@Override
	public Map<String, String> findById(String qtype) throws Exception 
	{
		Method method=this.getMethod(qtype);
		return (Map<String, String>)method.invoke(this);
	}
	/**
	 * ��������id��ѯ����״̬  �������ݷ��ؾ���״̬  ���򷵻�null
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
	 *      ����Ϊ���·���
	 **************************************************/
	@Override
	public boolean update(String utype) throws Exception 
	{
		Method method=this.getMethod(utype);
		return (boolean)method.invoke(this);
	}
	
	/**
	 * ���뾺�����ݱ�
	 * hug
	 * @return
	 * @throws Exception
	 */
	private boolean insertAc03() throws Exception
	{
		
		String sql="insert into ac03(aac102,aac602,aac302,aac303,aac304,aac305) values(?,?,?,?,?,'01')";   //01 --���ڲ��� ����
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
