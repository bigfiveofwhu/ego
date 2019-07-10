package com.ego.services.impl;


import java.text.SimpleDateFormat;
import java.util.Date;

import com.ego.services.JdbcServicesSupport;
import com.ego.system.tools.Tools;

public class Aa01Service extends JdbcServicesSupport 
{

	@Override
	public boolean update(String utype) throws Exception 
	{
		String username=(String)this.get("username");
		String email=(String)this.get("email");
		String verifyCode=(String)this.get("verifyCode");
		String phone=(String)this.get("phone");
		String pwd=(String)this.get("pwd");
		String realname=(String)this.get("realname");
		String gender=(String)this.get("gender");
		String birthday=(String)this.get("birthday");
		String addr_1=(String)this.get("addr_1");
		String addr_2=(String)this.get("addr_2");
		String addr_3=(String)this.get("addr_3");
		String addr_4=(String)this.get("addr_4");
		String addr=addr_1+addr_2+addr_3+addr_4;
		
		StringBuilder sql=new StringBuilder()
				.append("insert into aa01(aaa102,aaa103,aaa104,aaa105,aaa106,")
				.append("				  aaa107,aaa108,aaa109,aaa110,aaa111,)")
				.append("                 aaa113")
				.append("		   values(?,?,?,?,?,")
				.append("				  ?,?);")
				;
		
		int aaa102=Tools.getIncrementId("aa01");
		String aaa103="ego_uid_1";
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
				addr,
				gender
		};
		return this.executeUpdate(sql.toString(), args);
	}
}
