/**
 * @author hug
 */
package com.ego.services.impl;

import java.lang.reflect.Method;
import java.util.Map;

import com.ego.services.JdbcServicesSupport;
import com.ego.system.tools.Tools;

public class Ac01ServiceImpl extends JdbcServicesSupport
{

	/**************************************************
	 *     ����Ϊ���·���
	 **************************************************/
	@Override
	public boolean update(String utype) throws Exception
	{
		Method method=this.getMethod(utype);
		return (boolean)method.invoke(this);
	}
	/**
	 * ע�������,�������������,Ĭ��Ϊ 01 --δ���
	 * @return
	 */
	private boolean insertAc01() throws Exception
	{
		StringBuilder sql=new StringBuilder()
				.append("insert into ac01(aaa102,aac102,aac103,aac104,aac105,")
				.append("				  aac106,aac107,aac108,aac109,aac110)")
				.append("          values(?,?,?,?,?,")
				.append("				  ?,?,'01',?,0.00)")
				;
		int id=Tools.getIncrementId("aac102");
		this.dto.put("aac102", id+"");
		Object args[]= {
				this.get("aaa102"),
				id,
				this.get("aac103"),
				this.get("aac104"),
				this.get("aac105"),
				this.get("aac106"),
				this.get("aac107"),
				this.get("aac109")
		};
		return this.executeUpdate(sql.toString(), args);
	}
	
	/***************************************************************
	 *         ����Ϊ��һʵ����ѯ
	 ***************************************************************/
	@Override
	public Map<String, String> findById(String qtype) throws Exception
	{
		Method method=this.getMethod(qtype);
		return (Map<String,String>)method.invoke(this);
	}
	/**
	 * �����û�id������Ӧ�ķ�����id
	 * @return
	 */
	private Map<String,String> login() throws Exception
	{
		String sql="select aac102 from ac01 where aaa102=?";
		return this.queryForMap(sql, this.getIdList("aaa102"));
	}
	/**
	 * ���ݷ�����id��ѯ�����̵���ϸ��Ϣ
	 * @return
	 */
	private Map<String,String> findByAac102() throws Exception
	{
		StringBuilder sql=new StringBuilder()
				.append("select x.aac102,x.aac103,x.aac104,y.fvalue aac106,x.aac110,x.aac111,x.aac112")
				.append("  from ac01 x,syscode y")
				.append(" where aac102=? and y.fname='aac106' and y.fcode=x.aac106")
				;
		return this.queryForMap(sql.toString(), this.get("aac102"));
	}
}
