/*
 * 表aa01:用户信息表
 Name	    Code	
用户流水号	aaa101	
用户id	    aaa102	
用户名	    aaa103	
用户邮箱	    aaa104	
注册日期	    aaa105	
用户积分	    aaa106	
密码   	    aaa107	
手机	        aaa108	
真实姓名	    aaa109	
出生日期	    aaa110
居住地	    aaa111	
身份证号	    aaa112
性别                 aaa113
 * */

package com.ego.services.impl;

import java.lang.reflect.Method;
import java.util.List;
import java.util.Map;

import com.ego.services.JdbcServicesSupport;

public class UserManageServicesImpl extends JdbcServicesSupport 
{
	public boolean update(String utype) throws Exception 
    {
		//System.out.println("执行反射");
		Method method=this.getClass().getDeclaredMethod(utype);
		method.setAccessible(true);
		return (boolean)method.invoke(this);
    }
	/****个人信息管理*****/
	
	private int user_id = 1;
	//按id查询
	 public Map<String,String> findById()throws Exception
	    {
	    	//1.编写SQL语句
	    	StringBuilder sql=new StringBuilder()
	    			.append("select a.aaa102,a.aaa103,a.aaa109,a.aaa110,")
	    			.append("       a.aaa104,a.aaa108,a.aaa113")
	    			.append("  from aa01 a")
	    			.append(" where a.aaa101=?")
	    			;
	    	//执行查询
	    	return this.queryForMap(sql.toString(), 2);
	    }
	    
	//修改用户信息
	@SuppressWarnings("unused")
	private boolean modifyUserInfo()throws Exception
	    {
	    	StringBuilder sql=new StringBuilder()
	    			.append("update aa01 a")
	    			.append("   set a.aaa103=?,a.aaa104=?,a.aaa108=?,")
	    			.append("       a.aaa109=?,a.aaa110=?,a.aaa113=?")
	    			.append(" where a.aaa101=?")
	    			;

	 
	    	Object args[]={
	    			this.get("aaa103"),
	    			this.get("aaa104"),
	    			this.get("aaa108"),
	    			this.get("aaa109"),
	    			this.get("aaa110"),
	    			this.get("aaa113"),
	    			"2"
	    	};
	    //System.out.println(sql.toString());
	    	//System.out.println(this.dto);
	    	//this.put("aaa101", 1);
	    	return this.executeUpdate(sql.toString(), args);	    	
	    }
	
	/**
	  * 修改用户绑定邮箱
	 * @return
	 * @throws Exception
	 */
	   @SuppressWarnings("unused")
	     private boolean modifyEmail() throws Exception
	   {
		 //用户id用session获得
		   String sql = "update aa01 a set a.aaa104=? where a.aaa102 = "+ user_id;
		   
		   System.out.println(sql);
		  // this.appendBatch(sql, this.get("aaa104"), new Object[{1}]);
		   //Object stateList[]={this.get("aaa104")};
		   System.out.println(this.get("aaa104"));
		   return true;
		 // return  this.executeUpdate(sql, this.get("aaa104"));
	   }
	   
	   /**
	        * 修改用户密码 暂时没加入md5
	    * @return
	    * @throws Exception
	    */
	   private boolean modifyPwd() throws Exception
	   {
		   String sql = "update aa01 a set a.aaa107=? where a.aaa102 = " + user_id;
		   
		   return this.executeUpdate(sql, this.get("aaa107"));
	   }
}
