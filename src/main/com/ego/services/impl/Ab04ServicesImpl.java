package com.ego.services.impl;

import java.lang.reflect.Method;
import java.util.Map;

import com.ego.services.JdbcServicesSupport;
import com.ego.system.tools.Tools;

public class Ab04ServicesImpl extends JdbcServicesSupport 
{
	@Override
	public boolean update(String utype)throws Exception
	{
		if(utype.equalsIgnoreCase("comment"))
		{
			return this.comment();
		}
		
		else if(utype.equalsIgnoreCase("comment2"))
		{
			return false;
		}
		else
		{
			throw new Exception("����[ Ab04ServicesImpl ]�н�����δ����ĸ��¶�������,"
								+ "����������  "+utype);
		}
	}
	
	/**
	 * ������Ʒ����
	 * @return
	 * @throws Exception
	 */
	private boolean comment()throws Exception
	{
		String commentId=Tools.getCommentId();
		//1.����SQL���
		StringBuilder sql = new StringBuilder()
				.append("insert into ab04(aab302,aaa102,aab203,aab402,aab403,")
    			.append("                 aab406,aab409,aab410,aab411,aab412,")
    			.append("                 aab413)")
    			.append("          values (?,?,?,?,?,")
    			.append("                  current_timestamp,?,?,?,?,")
    			.append("                  0)")
    			;
		//2.��д��������
		Object args[]={
				this.get("aab302"),
				this.get("aaa102"),
				this.get("aab203"),
				commentId,
				this.get("aab403"),
				//5
				this.get("aab409"),
				this.get("aab410"),
				this.get("aab411"),
				this.get("aab412")
				//10
				
		};
		System.out.println("***�����¶���***");
		System.out.println(sql.toString());
		this.commentOnce();
		
		return this.executeUpdate(sql.toString(), args);
		
	}
	
	
	/**
	 * �������޸�����״̬
	 * @return
	 * @throws Exception
	 */
	private void commentOnce()throws Exception
	{
		StringBuilder sql = new StringBuilder()
				.append("update ab03 a set")
				.append("  a.aab303='06'")
				.append("  where a.aab302=?")
				;
		
		Object args[]={
				this.get("aab302")
		};
		
		//System.out.println("***��ʾ�༭����SQL���****");
		//System.out.println(sql.toString());
		this.executeUpdate(sql.toString(), args);
	}	

	/****************************************************
	 *                             ����Ϊ��ѯ����
	 ****************************************************/
	/**
	 * @author hug
	 */
	@Override
	public Map<String, String> findById(String qtype) throws Exception 
	{
		Method method=this.getMethod(qtype);
		return (Map<String, String>)method.invoke(this);
	}
	
	/**
	 * @author hug
	 * ͨ����Ʒid,����ۼ��ж���������
	 * @return
	 * @throws Exception
	 */
	private Map<String,String> comentCountByAab203() throws Exception
	{
		String sql="select count(*) as commentSum from ab04 where aab203=?";
		return this.queryForMap(sql, this.get("aab203"));
	}
}
