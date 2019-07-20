/*
 * @author zb
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

import javax.servlet.http.HttpSession;

import com.ego.services.JdbcServicesSupport;
import com.ego.system.tools.Tools;

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

	//��id��ѯ
	 public Map<String,String> findById()throws Exception
	    {
	    	//1.��дSQL���
	    	StringBuilder sql=new StringBuilder()
	    			.append("select a.aaa102,a.aaa103,a.aaa109,a.aaa110,")
	    			.append("       a.aaa104,a.aaa108,a.aaa113")
	    			.append("  from aa01 a")
	    			.append(" where a.aaa102=?")
	    			;
	    	String id =(String) this.get("aaa102");
	    	//ִ�в�ѯ
	    	return this.queryForMap(sql.toString(), this.get("aaa102"));
	    }
	    
	//�޸��û���Ϣ
	@SuppressWarnings("unused")
	private boolean modifyUserInfo()throws Exception
	    {
	    	StringBuilder sql=new StringBuilder()
	    			.append("update aa01 a")
	    			.append("   set a.aaa103=?,a.aaa104=?,a.aaa108=?,")
	    			.append("       a.aaa109=?,a.aaa110=?,a.aaa113=?")
	    			.append(" where a.aaa102=?")
	    			;

	 
	    	Object args[]={
	    			this.get("aaa103"),
	    			this.get("aaa104"),
	    			this.get("aaa108"),
	    			this.get("aaa109"),
	    			this.get("aaa110"),
	    			this.get("aaa113"),
	    			this.get("aaa102")
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
		   String sql = "update aa01 a set a.aaa104=? where a.aaa102 = "+ this.get("aaa102");
		   
		   System.out.println(sql);
		  // this.appendBatch(sql, this.get("aaa104"), new Object[{1}]);
		   //Object stateList[]={this.get("aaa104")};
		   System.out.println(this.get("aaa104"));
		   return true;
		 // return  this.executeUpdate(sql, this.get("aaa104"));
	   }
	   
	   /**
	        * �޸��û����� 
	    * @return
	    * @throws Exception
	    */
	   @SuppressWarnings("unused")
	 private boolean modifyPwd() throws Exception
	   {
		   String sql1 = "select aaa107 from aa01 where a.aaa102= ?";
		   
		   Map<String,String> map = this.queryForMap(sql1, this.get("aaa102"));
		   
		   
		   String pwdMd5 = Tools.getMd5(this.get("aaa107"));
		   
		   if(map.get("aaa107").equals(pwdMd5))
		   {
		   
		      String sql = "update aa01 a set a.aaa107=? where a.aaa102 = " + this.get("aaa102");
		   
		      return this.executeUpdate(sql, pwdMd5);
		   }
		   return false;
	   }
}
