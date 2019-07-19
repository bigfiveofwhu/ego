/*********���˵�ַ����*********************
	
	/*��aa04
	 *Name	    Code	
	��ַ��ˮ��	aaa401	
	�û�id	    aaa102	
	������ַ	    aaa402	
	��ϸ��ַ	    aaa403	
	��ַ��ע	    aaa404	
	�ջ�������	aaa405	
	�绰	        aaa406	
	�Ƿ�Ĭ��	    aaa407
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
		//System.out.println("ִ�з���");
		Method method=this.getClass().getDeclaredMethod(utype);
		method.setAccessible(true);
		return (boolean)method.invoke(this);
    }
	/**
	 * ��ʾ������ַ��Ϣ
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
	 * ���ӵ�ַ
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("unused")
	private boolean addAddress() throws Exception
	{
		//��ȡ��ǰ�û�id
		
		//��ȡ������ַ
	    String aaa402 = (String)this.get("addr_1") +" "+ (String)this.get("addr_2") + " "+(String)this.get("addr_3");
		
    	
    	//1.��дSQL���
    	StringBuilder sql=new StringBuilder()
    			.append("insert into aa04(aaa102,aaa402,aaa403,aaa404,aaa405,")
    			.append("                 aaa406,aaa407)")
    			.append("          values(?,?,?,?,?,")
    			.append("                 ?,?)")
    			;
	 
    	//2.��д��������
    	Object args[]={
    			this.get("aaa102"),
    			//this.get("aaa102"),   //�û�id
    			aaa402,
    			this.get("aaa403"),   
    			this.get("aaa404"),
    			this.get("aaa405"),
    			this.get("aaa406"),
    			false
    			//this.get("aaa407")//�Ƿ�Ĭ��
    	};
        return this.executeUpdate(sql.toString(), args);	
	}

	/***
	 * ��ʾ��ַ
	 */
	public List<Map<String,String>> query() throws Exception
	{
		StringBuilder sql = new StringBuilder()
				.append("select x.aaa401,x.aaa402,x.aaa403,x.aaa405,x.aaa406,x.aaa407 ")
				.append("      from aa04 x  ")
				.append("     where x.aaa102=? ");
		//�û�idͨ��session��ȡ
		return this.queryForList(sql.toString(), this.get("aaa102"));
		
	}
	/**
	 * ����Ĭ�ϵ�ַ
	 * @return
	 * @throws Exception
	 */
	public boolean setDefaultAddress()throws Exception
	{
	  String sql1= "update aa04 a set a.aaa407 = '0' where a.aaa102 = ? ";
	  //?=�û�id
	 if(this.executeUpdate(sql1, this.get("aaa102")))
	 {
	    String sql2 = "update aa04 a set a.aaa407 = '1' where a.aaa401 = ? ";
	    return  this.executeUpdate(sql2, this.get("aaa401"));
	 }
	 else
		 return false;
	}
	
	/**
	 * �༭���µ�ַ
	 * @return
	 * @throws Exception
	 */
	private boolean editAddress() throws Exception
	{
		//��ȡ������ַ
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

