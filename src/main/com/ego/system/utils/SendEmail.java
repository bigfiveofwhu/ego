package com.ego.system.utils;

import org.apache.commons.mail.EmailException;
import org.apache.commons.mail.HtmlEmail;

public class SendEmail
{
	public static boolean send(String to,String title, String content) throws Exception
	{
		//����һ��HtmlEmailʵ������
		HtmlEmail email=new HtmlEmail();
		//�����SMTP��������һ��123�������smtp.123.com,qq����Ϊsmtp.qq.com
        email.setHostName("smtp.163.com");
        //���÷��͵��ַ�����
        email.setCharset("utf-8");
    	//�����ռ���
        email.addTo(to);
        //�����˵�����Ϊ�Լ��ģ��û������������
        email.setFrom("obsession_hg@163.com","eGo�̳ǹٷ�");
        //���÷����˵���������û�������Ȩ��(��Ȩ�����Լ����õ�)
        email.setAuthentication("obsession_hg@163.com","02716900520mail");
        email.setSubject(title);
        email.setMsg(content);
        String a=email.send();
        System.out.println("��"+to+"�����ʼ�, �ʼ�����"+content+"======= "+a);
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
