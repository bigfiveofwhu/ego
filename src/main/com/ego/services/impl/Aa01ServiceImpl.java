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
	 *      以下为更新方法                                                                                    *
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
	 * aa01表的单一实例插入
	 * @return
	 * @throws Exception
	 */
	private boolean insertAa01() throws Exception
	{
		String username=(String)this.get("username");
		String email=(String)this.get("email");
		String phone=(String)this.get("phone");
		String pwd=Tools.getMd5(this.get("pwd"));   //加密
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
	 *               以下为单一实例查询方法                                                 *
	 *****************************************************/
	/**
	 * @author hug
	 * 通过aa01表中的Ak字段登录,查询数据,读出数据
	 * aaa102 --uid ,aaa103 --用户名 ,aaa104 --邮箱地址 ,aaa106 --积分 ,aaa108 --电话号码,
	 * aaa109 --姓名   ,aaa110 --生日    ,aaa111 --地址        ,aaa112 --身份证,aaa113 --性别
	 * @param ftype   --字段名
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
		return (Map<String, String>)method.invoke(this);    //可以尝试将参数传过去,将两个方法统一起来
	}
	/**
	 * @author hug
	 * 通过email进行登录
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
	 * 通过可选主键进行查找
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
