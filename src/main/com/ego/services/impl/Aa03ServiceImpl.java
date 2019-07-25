/**
 * @author zb
 * 收藏夹:aa03
Name                 Code	
收藏夹流水号	         aaa301
用户id	             aaa102	
类型	                 aaa302	 01---商品;02---商铺
ref(商品或商家id)   	 aaa303	
 */

package com.ego.services.impl;

import java.lang.reflect.Method;
import java.util.List;
import java.util.Map;

import com.ego.services.JdbcServicesSupport;

public class Aa03ServiceImpl extends JdbcServicesSupport
{
	//
	public boolean update(String utype) throws Exception 
    {
		Method method=this.getClass().getDeclaredMethod(utype);
		method.setAccessible(true);
		return (boolean)method.invoke(this);
    }
	
	/**
	 * 查询某用户收藏夹
	 */
	@Override
	public List<Map<String, String>> query(String qtype) throws Exception 
	{
		if(qtype.equals("product"))//查收藏的商品
		{
			StringBuilder sql  = new StringBuilder()
					   .append(" select  a.aaa301,a.aaa303,b.aab202,b.aab203,b.aab205,b.aab206,b.aab212,b.aab208,b.aab102 ")   
					   .append(" from aa03 a,ab02 b ")
					   .append(" where a.aaa303 = b.aab203 and a.aaa302 = ? ")
					   .append("  and a.aaa102 = '")
					   .append(this.get("aaa102"))
					   .append("'")
					   ;
			return this.queryForList(sql.toString(), "01");
		}
		else if(qtype.equals("shop"))//查收藏的店铺
		{
			StringBuilder sql  = new StringBuilder()
					   .append(" select  a.aaa301,a.aaa303,b.aab103,b.aab107,b.aab102,b.aab104,b.aab111,b.aaa102 ")   
					   .append(" from aa03 a,ab01 b ")
					   .append(" where a.aaa303 = b.aab102 and a.aaa302 = ? ")
					   .append("  and a.aaa102 = '")
					   .append(this.get("aaa102"))
					   .append("'")
					   ;
             return this.queryForList(sql.toString(), "02");		
		}
		else 
		{
			throw new Exception("方法[query]中进行了未定义的参数赋值,参数名称是  "+qtype);
		}
		//return super.query(qtype);
	}
	
	/**
	  * 单例删除收藏
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("unused")
	private boolean delCollectionById() throws Exception
	{
		String sql ="delete from aa03 where aaa301 = ?";
		return this.executeUpdate(sql, this.get("aaa301"));
	}
	
	/**
	 * 添加收藏品
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("unused")
	private boolean addCollection() throws Exception
	{ 
		Object args[]=
			{
			  this.get("aaa102"),
			  this.get("aaa302"),
			  this.get("aaa303")
			};
		String sql1 = "select aaa301 from aa03 where aaa102 = ? and aaa302 = ? and aaa303 =?";
		
		if(this.queryForMap(sql1, args) != null)//已被收藏
			return false;
		//编写SQL
		StringBuilder sql=new StringBuilder()
    			.append("insert into aa03(aaa102,aaa302,aaa303) ")
    			.append("          values(?,?,?)")
    			;
		
		return this.executeUpdate(sql.toString(), args);
	}
	
	
	
}
