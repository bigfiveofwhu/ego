/*********个人地址管理*********************
	
	/*表aa04
	 *Name	    Code	
	地址流水号	aaa401	
	用户id	    aaa102	
	三级地址	    aaa402	
	详细地址	    aaa403	
	地址备注	    aaa404	
	收货人姓名	aaa405	
	电话	        aaa406	
	是否默认	    aaa407
	 * */
	
package com.ego.services.impl;

import java.lang.reflect.Method;
import java.util.List;
import java.util.Map;
import com.ego.services.JdbcServicesSupport;

public class Aa04ServiceImpl extends JdbcServicesSupport
{
	  
	
	public boolean update(String utype) throws Exception 
    {
		//System.out.println("执行反射");
		Method method=this.getClass().getDeclaredMethod(utype);
		method.setAccessible(true);
		return (boolean)method.invoke(this);
    }
	/**
	 * 显示单例地址信息
	 */
	@Override
	public Map<String,String> findById() throws Exception
	{
		StringBuilder sql = new StringBuilder()
				.append("select x.aaa401,x.aaa402,x.aaa403,x.aaa404,x.aaa405,x.aaa406,x.aaa407 ")
				.append("      from aa04 x  ")
				.append("     where x.aaa401=? ");
	
    	return this.queryForMap(sql.toString(), this.get("aaa401"));
	}
	
	/**
	 * 增加地址
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("unused")
	private boolean addAddress() throws Exception
	{
		//获取当前用户id
		
		//获取三级地址
	    String aaa402 = (String)this.get("addr_1") +" "+ (String)this.get("addr_2") + " "+(String)this.get("addr_3");
		
    	
    	//1.编写SQL语句
    	StringBuilder sql=new StringBuilder()
    			.append("insert into aa04(aaa102,aaa402,aaa403,aaa404,aaa405,")
    			.append("                 aaa406,aaa407)")
    			.append("          values(?,?,?,?,?,")
    			.append("                 ?,?)")
    			;
	 
    	//2.编写参数数组
    	Object args[]={
    			this.get("aaa102"),
    			//this.get("aaa102"),   //用户id
    			aaa402,
    			this.get("aaa403"),   
    			this.get("aaa404"),
    			this.get("aaa405"),
    			this.get("aaa406"),
    			false
    			//this.get("aaa407")//是否默认
    	};
        return this.executeUpdate(sql.toString(), args);	
	}

	/***
	 * 显示地址
	 */
	public List<Map<String,String>> query() throws Exception
	{
		StringBuilder sql = new StringBuilder()
				.append("select x.aaa401,x.aaa402,x.aaa403,x.aaa405,x.aaa406,x.aaa407 ")
				.append("      from aa04 x  ")
				.append("     where x.aaa102=? ");
		//用户id通过session获取
		return this.queryForList(sql.toString(), this.get("aaa102"));
		
	}
	/**
	 * 设置默认地址
	 * @return
	 * @throws Exception
	 */
	public boolean setDefaultAddress()throws Exception
	{
	  String sql1= "update aa04 a set a.aaa407 = '0' where a.aaa102 = ? ";
	  //?=用户id
	 if(this.executeUpdate(sql1, this.get("aaa102")))
	 {
	    String sql2 = "update aa04 a set a.aaa407 = '1' where a.aaa401 = ? ";
	    return  this.executeUpdate(sql2, this.get("aaa401"));
	 }
	 else
		 return false;
	}
	
	/**
	 * 编辑更新地址
	 * @return
	 * @throws Exception
	 */
	private boolean editAddress() throws Exception
	{
		//获取三级地址
		String aaa402 = (String)this.get("addr_1") +" "+ (String)this.get("addr_2") + " "+(String)this.get("addr_3");
		
		StringBuilder sql=new StringBuilder()
    			.append("update aa04 a")
    			.append("   set a.aaa402=?,a.aaa403=?,a.aaa404=?,")
    			.append("       a.aaa405=?,a.aaa406=?")
    			.append(" where a.aaa401=?")
    			;

 
    	Object args[]={
    			aaa402,
    			this.get("aaa403"),
    			this.get("aaa404"),
    			this.get("aaa405"),
    			this.get("aaa406"),
    			this.get("aaa401")
    	};
    //System.out.println(sql.toString());
    	System.out.println("aaa401"+this.get("aaa401"));
    	//System.out.println(this.dto);
    	//this.put("aaa101", 1);
    	return this.executeUpdate(sql.toString(), args);
	  	
	}
	
	@SuppressWarnings("unused")
	private boolean deleteById() throws Exception
	{
		String sql="delete from aa04 where aaa401=?";
		
		return this.executeUpdate(sql, this.get("aaa401"));
	}
	
}

