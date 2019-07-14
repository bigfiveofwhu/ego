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

package com.ego.services.impl;

import java.lang.reflect.Method;
import java.util.List;
import java.util.Map;

import com.ego.services.JdbcServicesSupport;

public class UserManageServicesImpl extends JdbcServicesSupport 
{
	public boolean update(String utype) throws Exception 
    {
		//System.out.println("ִ�з���");
		Method method=this.getClass().getDeclaredMethod(utype);
		method.setAccessible(true);
		return (boolean)method.invoke(this);
    }
	/****������Ϣ����*****/
	
	private int user_id = 1;
	//��id��ѯ
	 public Map<String,String> findById()throws Exception
	    {
	    	//1.��дSQL���
	    	StringBuilder sql=new StringBuilder()
	    			.append("select a.aaa102,a.aaa103,a.aaa109,a.aaa110,")
	    			.append("       a.aaa104,a.aaa108,a.aaa113")
	    			.append("  from aa01 a")
	    			.append(" where a.aaa101=?")
	    			;
	    	//ִ�в�ѯ
	    	return this.queryForMap(sql.toString(), 2);
	    }
	    
	//�޸��û���Ϣ
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
	  * �޸��û�������
	 * @return
	 * @throws Exception
	 */
	   @SuppressWarnings("unused")
	     private boolean modifyEmail() throws Exception
	   {
		 //�û�id��session���
		   String sql = "update aa01 a set a.aaa104=? where a.aaa102 = "+ user_id;
		   
		   System.out.println(sql);
		  // this.appendBatch(sql, this.get("aaa104"), new Object[{1}]);
		   //Object stateList[]={this.get("aaa104")};
		   System.out.println(this.get("aaa104"));
		   return true;
		 // return  this.executeUpdate(sql, this.get("aaa104"));
	   }
	   
	   /**
	        * �޸��û����� ��ʱû����md5
	    * @return
	    * @throws Exception
	    */
	   private boolean modifyPwd() throws Exception
	   {
		   String sql = "update aa01 a set a.aaa107=? where a.aaa102 = " + user_id;
		   
		   return this.executeUpdate(sql, this.get("aaa107"));
	   }
}
