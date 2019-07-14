package com.ego.services.impl;

import java.lang.reflect.Method;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import com.ego.services.JdbcServicesSupport;
import com.ego.system.tools.Tools;

public class Ab04ServicesImpl extends JdbcServicesSupport 
{

	//********************************************************************
	//                             ҵ�����
	//********************************************************************
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
			return this.comment2();
		}
		else if(utype.equalsIgnoreCase("delComment"))
		{
			return this.delComment();
		}
		else
		{
			throw new Exception("����[ Ab04ServicesImpl ]�н�����δ����ĸ��¶�������,"
								+ "����������  "+utype);
		}
	}
	/**
	 * ������ѯ������֧���
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
			throw new Exception("����[ Ab04ServicesImpl ]�н�����δ�����������ѯ��������,"
					+ "����������  "+qtype);
		}
	}
	
	
	/**
	 * ������ѯ������֧���
	 */
	@Override
	public Map<String,String> findById(String qtype)throws Exception
	{
		
		if(qtype.equalsIgnoreCase("commentDetail"))
		{
			return this.commentDetail();
		}
		else
		{
			/**
			 * @author hug
			 *  ���÷�����÷���
			 */
			Method method=this.getMethod(qtype);
			return (Map<String, String>)method.invoke(this);
//			throw new Exception("����[ Ab04ServicesImpl ]�н�����δ����ĵ�һ��ѯ��������,"
//					+ "����������  "+qtype);
		}
		//ִ�в�ѯ
		
	} 
	
	
	
	
	//********************************************************************
	//                             ����ҵ��
	//********************************************************************
	/**
	 * ��ѯ��һ��������
	 * @return
	 * @throws Exception
	 */
	private Map<String,String> commentDetail()throws Exception
	{
		StringBuilder sql =null;
		sql = new StringBuilder()
				.append("select a.aab402,a.aab302,b.aab202,a.aab403,a.aab404,")
				.append("		a.aab405,a.aab406,a.aab407,a.aab408,a.aab409,")
				.append("       a.aab410,a.aab411,a.aab412,a.aab413,a.aab203")
    			.append("  from ab04 a, ab02 b")
    			.append(" where a.aab203=b.aab203") 
    			.append(" and a.aab302=?")
    			;
		System.out.println("***��ѯ��һ��������:��ʾfindById()��SQL��ѯ���****");
		System.out.println(sql.toString()+"������:"+this.get("aab302"));
		return this.queryForMap(sql.toString(), this.get("aab302"));
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
	 * ����:������Ʒ����
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
	 * ׷��:������Ʒ����
	 * @return
	 * @throws Exception
	 */
	private boolean comment2()throws Exception
	{
		System.out.println("aab404:"+this.get("aab404"));
		System.out.println("aab302:"+this.get("aab302"));
		System.out.println("aab203:"+this.get("aab203"));
		StringBuilder sql = new StringBuilder()
				.append("update ab04 a set")
				.append("  a.aab404=?,a.aab407=current_timestamp")
				.append("  where a.aab302=? and a.aab203=?")
				;
		
		Object args[]={
				this.get("aab404"),
				this.get("aab302"),
				this.get("aab203")
		};
		
		this.commentTwice();
		return this.executeUpdate(sql.toString(), args);
	}
	
	
	private boolean delComment()throws Exception
	{
		String sql = "delete from ab04 where aab302=? and aab203=? ";
		Object args[]={
				this.get("aab302"),
				this.get("aab203")
		};
		return this.executeUpdate(sql,args);
		
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
	
	/**
	 * ׷�����޸Ķ���״̬
	 * @throws Exception
	 */
	private void commentTwice()throws Exception
	{
		StringBuilder sql = new StringBuilder()
				.append("update ab03 a set")
				.append("  a.aab303='07'")
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
