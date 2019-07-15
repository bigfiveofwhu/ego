package com.ego.services.impl;

import java.lang.reflect.Method;
import java.util.Map;

import com.ego.services.JdbcServicesSupport;

public class Aa07ServiceImpl extends JdbcServicesSupport 
{

	/**************************************************
	 *          以下为更新方法
	 *************************************************/
	@Override
	public boolean update(String utype) throws Exception 
	{
		Method method=this.getMethod(utype);
		return (boolean)method.invoke(this);
	}
	/**
	 * 根据用户id和商品id插入数据
	 * hug
	 * @return
	 */
	private boolean insertAa07() throws Exception
	{
		String sql="select aaa703 from aa07 where aaa102=? and aab203=?";
		Object args[]= {
				this.get("aaa102"),
				this.get("aab203")
			};
		Map<String,String> ins=this.queryForMap(sql, args);
		//若存在,执行更新操作
		if(ins!=null)
		{
			int aaa703=Integer.parseInt(ins.get("aaa703"))+1;
			sql="update aa07 set aaa703=?,aaa702=current_timestamp where aaa102=? and aab203=?";
			args=new Object[]{
					aaa703,
					this.get("aaa102"),
					this.get("aab203")
				};
			return this.executeUpdate(sql, args);
		}
		//若不存在,执行插入操作
		sql="insert into aa07(aaa102,aab203,aaa702,aaa703,aaa704) values(?,?,current_timestamp,1,1)";
		return this.executeUpdate(sql, args);
	}
	
}
