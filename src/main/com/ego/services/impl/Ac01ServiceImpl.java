/**
 * @author hug
 */
package com.ego.services.impl;

import java.lang.reflect.Method;
import java.util.List;
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
				.append("				  aac106,aac107,aac108,aac109,aac110,")
				.append("                 aac111,aac112)")
				.append("          values(?,?,?,?,?,")
				.append("				  ?,?,'01',?,0.00,")
				.append("                 ?,current_timestamp)")
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
				this.get("aac109"),
				this.get("aac111")
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
	
	private Map<String, String> checkService() throws Exception
	{
		String sql="select aac108 from ac01 where aac102=?";
		return this.queryForMap(sql, this.get("aac102"));
	}
	
	/**
	 * �����û�id������Ӧ�ķ�����id
	 * @return
	 */
	private Map<String,String> login() throws Exception
	{
		String sql="select aac102,aac103 from ac01 where aaa102=?";
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
	/********************************************************************
	 *     ����Ϊ������ѯ����
	 *******************************************************************/
	@Override
	public List<Map<String, String>> query(String qtype) throws Exception
	{
		Method method=this.getMethod(qtype);
		return (List<Map<String, String>>)method.invoke(this);
	}
	/**
	 * ���������ķ�����  ǰ8��
	 * @return
	 */
	private List<Map<String, String>> queryByUpToDate() throws Exception
	{
		StringBuilder sql=new StringBuilder()
				.append("  select x.aac102,x.aac103,x.aac104,z.fvalue aac106,x.aac110,x.aac111")
				.append("    from ac01 x,T_Area y,syscode z,t_area a")
				.append("   where x.aac105=a.areaId and a.`level`='3' and a.parentId=y.areaId")
				.append("	  and y.`level`='2' and y.areaName like ? ")
				.append("     and x.aac106=z.fcode and z.fname='aac106' ")
				.append("order by x.aac112 desc limit 8")
				;
		return this.queryForList(sql.toString(), this.get("location"));
	}
}
