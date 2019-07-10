/*
 * ��aa01:�û���Ϣ��
 Name	    Code	
�û���ˮ��	aaa101	
�û�id	    aaa102	
�û���	    aaa103	
�û�����	    aaa104	
ע������	    aaa105	
�û�����	    aaa106	
����   	    aaa107	
�ֻ�	        aaa108	
��ʵ����	    aaa109	
��������	    aaa110
��ס��	    aaa111	
���֤��	    aaa112
�Ա�                 aaa113
 * */

/*��aa04
 *Name	    Code	
��ַ��ˮ��	aaa401	
�û�id	    aaa102	
�����ַ	    aaa402	
��ϸ��ַ	    aaa403	
��ַ��ע	    aaa404	
�ջ�������	aaa405	
�绰	        aaa406	
�Ƿ�Ĭ��	    aaa407
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
    		throw new Exception("����[ UserManageServices ]�н�����δ����Ķ�������,����������  "+utype);
    	}	
    }
	/****������Ϣ����*****/
	//��id��ѯ
	 public Map<String,String> findById()throws Exception
	    {
	    	//1.��дSQL���
	    	StringBuilder sql=new StringBuilder()
	    			.append("select a.aaa103,a.aaa109,a.aaa110,")
	    			.append("       a.aaa104,a.aaa108,a.aaa113")
	    			.append("  from aa01 a")
	    			.append(" where a.aaa101=?")
	    			;
	    	//ִ�в�ѯ
	    	return this.queryForMap(sql.toString(), 2);
	    }
	    
	//�޸��û���Ϣ
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
	
	/*********��ַ����***********/
	private boolean addAddress()
	{
		
		return false;
	}
	
	    
}
