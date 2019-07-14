/**
 * @author hug
 */

package com.ego.services.impl;

import java.lang.reflect.Method;
import java.util.Map;

import com.ego.services.JdbcServicesSupport;
import com.ego.system.tools.Tools;

public class Ab01ServiceImpl extends JdbcServicesSupport
{

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
	 * 注册店铺
	 * @return
	 * @throws Exception
	 */
	private boolean insertShop() throws Exception
	{
		int id=Tools.getIncrementId("ab01");
		this.put("aab102", id);
		StringBuilder sql=new StringBuilder()
				.append("insert into ab01(aaa102,aab102,aab103,aab104,aab105,")
				.append("				  aab106,aab107,aab108,aab109,aab110,")
				.append("				  aab111)")
				.append("		   values(?,?,?,'0',?,")
				.append("				  ?,'01',?,'0','0',")    //  01--未审核
				.append("				 '0')")
				;
		Object args[]= {
				this.get("aaa102"),
				id,
				this.get("aab103"),
				this.get("aab105"),
				this.get("aab106"),
				this.get("aab108")
		};
		return this.executeUpdate(sql.toString(), args);
	}
	
	/**
	 * 输入以什么字段名查找店铺
	 * aaa102 --用户id, aab102 --店铺id, aab103 --店铺名称
	 */
	@Override
	public Map<String, String> findById(String ftype) throws Exception
	{
		if(ftype.equals("findByAk"))
		{
			return findByAk(ftype);
		}
		Method method=this.getMethod(ftype);
		return (Map<String, String>)method.invoke(this);
	}
	/**
	 * @author hug
	 * 通过可选主键进行查找
	 * @param ftype
	 * @return
	 * @throws Exception
	 */
	private Map<String, String> findByAk(String ftype) throws Exception
	{
		StringBuilder sql=new StringBuilder()
				.append("select aaa102,aab102,aab103,aab104,aab105,aab106,")
				.append("       aab107,aab108,aab109,aab110,aab111")
				.append("  from ab01")
				.append(" where "+ftype+"=?")
				;
		return this.queryForMap(sql.toString(), this.get(ftype));
	}
	/**
	 * @author hug
	 * 通过用户id登录店铺,即查找店铺id
	 * @return
	 */
	private Map<String, String> loginByAaa102() throws Exception
	{
		String sql="select aab102 from ab01 where aaa102=?";
		return this.queryForMap(sql, this.get("aaa102"));
	}
}
