package com.ego.system.utils;

import org.apache.commons.mail.EmailException;
import org.apache.commons.mail.HtmlEmail;

public class SendEmail
{
	public static boolean send(String to,String title, String content) throws Exception
	{
		//创建一个HtmlEmail实例对象
		HtmlEmail email=new HtmlEmail();
		//邮箱的SMTP服务器，一般123邮箱的是smtp.123.com,qq邮箱为smtp.qq.com
        email.setHostName("smtp.163.com");
        //设置发送的字符类型
        email.setCharset("utf-8");
    	//设置收件人
        email.addTo(to);
        //发送人的邮箱为自己的，用户名可以随便填
        email.setFrom("obsession_hg@163.com","eGo商城官方");
        //设置发送人到的邮箱和用户名和授权码(授权码是自己设置的)
        email.setAuthentication("obsession_hg@163.com","02716900520mail");
        email.setSubject(title);
        email.setMsg(content);
        String a=email.send();
        System.out.println("向"+to+"发送邮件, 邮件内容"+content+"======= "+a);
        return a!=null;
	}
	
	public static String random_6_Code()
	{
		StringBuilder code=new StringBuilder("");
		int a=0;
		for(int i=0;i<6;i++)
		{
			int type=(int)(Math.random()*3);
			switch(type)
			{
			case 0:
				a=(int)(Math.random()*10);
				code.append(String.valueOf(a));
				break;
			case 1:
				a=(int)(Math.random()*26)+'a';
				code.append(String.valueOf((char)(a)));
				break;
			case 2:
				a=(int)(Math.random()*26)+'A';
				code.append(String.valueOf((char)(a)));
				break;
			}
		}
		return code.toString();
	}
}
