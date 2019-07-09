package com.ego.services.impl;


import java.text.SimpleDateFormat;
import java.util.Date;

import com.ego.services.JdbcServicesSupport;

public class Aa01Service extends JdbcServicesSupport 
{

	@Override
	public boolean update(String utype) throws Exception 
	{
		String username=(String)this.get("username");
		String verifyCode=(String)this.get("verifyCode");
		String pwd=(String)this.get("pwd");
		
		StringBuilder sql=new StringBuilder()
				.append("insert into aa01(aaa102,aaa103,aaa104,aaa105,aaa106,")
				.append("				  aaa107,aaa108)")
				.append("		   values(?,?,?,?,?,")
				.append("				  ?,?);")
				;
		String aaa102="1";
		String aaa103="ego_uid_1";
		String aaa105=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date());
		Object args[]= {
				aaa102,
				aaa103,
				username,
				aaa105,
				"0",
				pwd,
				""
		};
		return this.executeUpdate(sql.toString(), args)>0;
	}
}
