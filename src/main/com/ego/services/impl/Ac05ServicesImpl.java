package com.ego.services.impl;

import java.util.List;
import java.util.Map;

import com.ego.services.JdbcServicesSupport;
import com.ego.system.tools.Tools;

public class Ac05ServicesImpl extends JdbcServicesSupport 
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
		if(utype.equalsIgnoreCase("commentService"))
		{
			return this.commentService();
		}
		
		else
		{
			throw new Exception("����[ Ac05ServicesImpl ]�н�����δ����Ķ�������,"
								+ "����������  "+utype);
		}
	}
	
	/**
	 * ��һʵ����ѯ��֧���
	 * @return
	 * @throws Exception
	 */
	@Override
	public Map<String,String> findById(String qtype)throws Exception
	{
		if(qtype.equals("serviceCommentDetail"))
		{
			return null;
		}
		else
		{
			throw new Exception("ac05:δ֪�ĵ�һʵ����ѯ����: "+qtype);
			
		}
	}
	
	
	/**
	 * ������ѯ������֧���
	 * @return
	 * @throws Exception
	 */
	@Override
	public List<Map<String,String>> query(String qtype) throws Exception
	{
		if(qtype.equalsIgnoreCase("allComment"))
		{
			return this.allServiceComment();
		}
		else
		{
			throw new Exception("ac05:δ֪��������ѯ����:"+qtype);
		}
		
	}
	
	
	//********************************************************************
	//								����ҵ��
	//********************************************************************
	
	/**
	 * ��������
	 * @return
	 * @throws Exception
	 */
	private boolean commentService()throws Exception
	{
		//��ȡ����id
		int aac502 =Tools.getSequence("aac502");
		this.put("aac502", aac502);
		//1.����SQL���
		StringBuilder sql = new StringBuilder()
				.append("insert into ac05(aaa102,aac402,aac502,aac503,aac505,aac507)")
    			.append("          values (?,?,?,current_timestamp,?)")
    			;
		//2.��д��������
		Object args[]={
				this.get("aaa102"),
				this.get("aac402"),
				aac502,
				this.get("aac503"),
				this.get("aac507")
				//5
				
		};
		System.out.println("***�����·�������***");
		System.out.println(sql.toString());
		
		this.changeOrderMode((String)this.get("aac402"));
		
		return this.executeUpdate(sql.toString(), args);
		
	}
	
	/**
	 * ���������޸Ķ���״̬
	 * @param aac402
	 * @throws Exception
	 */
	private void changeOrderMode(String aac402)throws Exception
	{
		StringBuilder sql1 = new StringBuilder()
				.append("update ac04 a set")
				.append("  a.aac408='03'")
				.append("  where a.aac402=?")
				;
		
		Object args1[]={
				aac402
		};
		this.executeUpdate(sql1.toString(), args1);
	}
	
	
	
	/**
	 * ��ѯ��������
	 * @return
	 * @throws Exception
	 */
	private List<Map<String,String>> allServiceComment()throws Exception
	{
		//����SQL����
		StringBuilder sql = new StringBuilder()
				.append("select x.aac402,x.aac502,x.aac503,x.aac505,x.aac507,")
				.append("       y.aac410,y.aac411,z.aac103")
				.append("  from ac05 x, ac04 y, ac01 z")
				.append("  where x.aac402=y.aac402 ")
				.append("  and  y.aac102=z.aac102 and x.aaa102=? ")
				;
		

		
  		System.out.println("***��ʾ���񶩵�������ѯSQL���***");
  		System.out.println(sql.toString());
  		
  		return this.queryForList(sql.toString(),this.get("aaa102"));
	}
}