/**
 * @author hug
 */
package com.ego.services.impl;

import java.lang.reflect.Method;

import com.ego.services.JdbcServicesSupport;
import com.ego.system.tools.Tools;

public class Ac01ServiceImpl extends JdbcServicesSupport
{

	@Override
	public boolean update(String utype) throws Exception
	{
		Method method=this.getMethod(utype);
		return (boolean)method.invoke(this);
	}
	/**
	 * 注册服务商,插入服务商数据,默认为 01 --未审核
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
}
