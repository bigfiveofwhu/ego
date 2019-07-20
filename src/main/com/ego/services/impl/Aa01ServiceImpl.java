/**
 * @author hug
 */

package com.ego.services.impl;


import java.lang.reflect.Method;
import java.text.SimpleDateFormat;
import java.util.Arrays;
import java.util.Date;
import java.util.Map;

import com.ego.services.JdbcServicesSupport;
import com.ego.system.tools.Tools;

public class Aa01ServiceImpl extends JdbcServicesSupport 
{

	/*****************************************************
	 *      ����Ϊ���·���                                                                                    *
	 *****************************************************/
	/**
	 * @author hug
	 */
	@Override
	public boolean update(String utype) throws Exception
	{
		Method method=this.getMethod(utype);
		return (boolean)method.invoke(this);
	}
	/**
	 * @author hug
	 * aa01��ĵ�һʵ������
	 * @return
	 * @throws Exception
	 */
	private boolean insertAa01() throws Exception
	{
		String username=(String)this.get("username");
		String email=(String)this.get("email");
		String phone=(String)this.get("phone");
		String pwd=Tools.getMd5(this.get("pwd"));   //����
		String realname=(String)this.get("realname");
		String gender=(String)this.get("gender");
		String birthday=(String)this.get("birthday");
		String addr_1=(String)this.get("addr_1");
		String addr_2=(String)this.get("addr_2");
		String addr_3=(String)this.get("addr_3");
		String addr_4=(String)this.get("addr_4");
		StringBuilder addr=new StringBuilder()
				.append(addr_1).append(" ")
				.append(addr_2).append(" ")
				.append(addr_3).append(" ")
				.append(addr_4).append(" ")
				;
		
		StringBuilder sql=new StringBuilder()
				.append("insert into aa01(aaa102,aaa103,aaa104,aaa105,aaa106,")
				.append("				  aaa107,aaa108,aaa109,aaa110,aaa111,")
				.append("                 aaa113)")
				.append("		   values(?,?,?,?,?,")
				.append("				  ?,?,?,?,?,")
				.append("                 ?)")
				;
		
		int aaa102=Tools.getIncrementId("aa01");
		this.put("aaa102", aaa102);
		this.put("aaa106", "0");
		String aaa105=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date());
		Object args[]= {
				aaa102,
				username,
				email,
				aaa105,
				"0",
				pwd,
				phone,
				realname,
				birthday,
				addr.toString(),
				gender
		};
		return this.executeUpdate(sql.toString(), args);
	}
	
	/*****************************************************
	 *               ����Ϊ��һʵ����ѯ����                                                 *
	 *****************************************************/
	/**
	 * @author hug
	 * ͨ��aa01���е�Ak�ֶε�¼,��ѯ����,��������
	 * aaa102 --uid ,aaa103 --�û��� ,aaa104 --�����ַ ,aaa106 --���� ,aaa108 --�绰����,
	 * aaa109 --����   ,aaa110 --����    ,aaa111 --��ַ        ,aaa112 --���֤,aaa113 --�Ա�
	 * @param ftype   --�ֶ���
	 * @return
	 * @throws Exception
	 */
	@Override
	public Map<String, String> findById(String ftype) throws Exception
	{
		if(ftype.equals("findByAk"))
		{
			return findByAk(ftype);
		}
		Method method=this.getMethod(ftype);
		return (Map<String, String>)method.invoke(this);    //���Գ��Խ���������ȥ,����������ͳһ����
	}
	/**
	 * @author hug
	 * ͨ��email���е�¼
	 * @return
	 * @throws Exception
	 */
	private Map<String, String> loginByEmail() throws Exception
	{
		StringBuilder sql=new StringBuilder()
				.append("select aaa102,aaa103,aaa104,aaa106,aaa108,")
				.append("		aaa111")
				.append("  from aa01")
				.append(" where aaa107=? and aaa104=?")
				;
		Object args[]= {
				this.get("aaa107"),
				this.get("aaa104")
		};
		return this.queryForMap(sql.toString(),args);
	}
	
	/**
	 * @author hug
	 * ͨ����ѡ�������в���
	 * @return
	 */
	private Map<String, String> findByAk(String ftype) throws Exception
	{
		StringBuilder sql=new StringBuilder()
				.append("select aaa102,aaa103,aaa104,aaa105,aaa106,aaa107,")
				.append("		aaa108,aaa109,aaa110,aaa111,aaa112,aaa113")
				.append("  from aa01")
				.append(" where ").append(" "+ftype+"=?")
				;
		return this.queryForMap(sql.toString(), this.get(ftype));
	}
}
