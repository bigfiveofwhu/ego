package com.ego.services.impl;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import com.ego.services.JdbcServicesSupport;
import com.ego.system.tools.Tools;

public class Ab04ServicesImpl extends JdbcServicesSupport 
{
	/**
	 * ���²�����֧���
	 */
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
	 * ��ѯ������֧���
	 */
	@Override
	public List<Map<String, String>> query(String qtype)throws Exception
	{
		if(qtype.equalsIgnoreCase("allComment"))
		{
			return this.allComment();
		}
		else
		{
			throw new Exception("����[ Ab04ServicesImpl ]�н�����δ�����������������,"
					+ "����������  "+qtype);
		}
	}
	/**
	 * ��ѯ��������
	 * @return
	 * @throws Exception
	 */
	private List<Map<String, String>> allComment()throws Exception
	{
		//����SQL����
				StringBuilder sql = new StringBuilder()
						.append("select x.aab302,z.aab202,x.aab402,x.aab403,x.aab406,")
						.append("       x.aab410,x.aab412,y.aab303")
						.append("  from ab04 x,ab03 y,ab02 z  ")
						.append("  where x.aab302=y.aab302 ")
						.append("  and x.aab203=z.aab203 ")
						.append("  and x.aaa102=?")
						
						;
				
				
				
				//���ò����б�
				List<Object> paramList = new ArrayList<>();
				
				paramList.add(this.get("aaa102"));

		  		
		  		System.out.println("***��ʾ����������ѯSQL���***");
		  		System.out.println(sql.toString());
		  		System.out.println("***��ʾ������ѯ�����б�***");
		  		System.out.println(paramList);
		  		
		  		
		  		return this.queryForList(sql.toString(),paramList.toArray());
				
	}
	
	/**
	 * ������Ʒ����
	 * @return
	 * @throws Exception
	 */
	private boolean comment()throws Exception
	{
		String aab402=Tools.getCommentId();
		
		
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
				aab402,
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


	

}
