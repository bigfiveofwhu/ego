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

/*表aa04
 *Name	    Code	
地址流水号	aaa401	
用户id	    aaa102	
编码地址	    aaa402	
详细地址	    aaa403	
地址备注	    aaa404	
收货人姓名	aaa405	
电话	        aaa406	
是否默认	    aaa407
 * */
package com.ego.services.impl;

import java.util.Map;

import com.ego.services.JdbcServicesSupport;
import com.ego.system.tools.Tools;

public class UserManageServicesImpl extends JdbcServicesSupport 
{
	public boolean update(String utype) throws Exception 
    {
    	if(utype.equalsIgnoreCase("modifyUserInfo"))
    	{
    		return this.modifyUserInfo();
    	}
    	{
    		throw new Exception("在类[ UserManageServices ]中进行了未定义的动作调用,动作名称是  "+utype);
    	}	
    }
	/****个人信息管理*****/
	//按id查询
	 public Map<String,String> findById()throws Exception
	    {
	    	//1.编写SQL语句
	    	StringBuilder sql=new StringBuilder()
	    			.append("select a.aaa103,a.aaa109,a.aaa110,")
	    			.append("       a.aaa104,a.aaa108,a.aaa113")
	    			.append("  from aa01 a")
	    			.append(" where a.aaa101=?")
	    			;
	    	//执行查询
	    	return this.queryForMap(sql.toString(), 2);
	    }
	    
	//修改用户信息
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
	
	/*********地址管理***********/
	private boolean addAddress()
	{
		
		return false;
	}
	
	    
}
