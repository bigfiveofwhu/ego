package com.ego.services.impl;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import com.ego.services.JdbcServicesSupport;
import com.ego.system.tools.Tools;

public class Aa08ServicesImpl extends JdbcServicesSupport 
{
	//************************************************
	//					ҵ�����
	//************************************************
	/**
	 * ���²�����֧���
	 */
	@Override
	public boolean update(String utype)throws Exception
	{
		if(utype.equalsIgnoreCase("addRefund"))
		{
			return this.addRefund();
		}
		
		else
		{
			throw new Exception("����[ Aa08ServicesImpl ]�н�����δ����Ķ�������,"
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
		if(qtype.equals("refundDetail"))
		{
			return this.refundDetail();
		}
		else
		{
			throw new Exception("aa08:δ֪�ĵ�һʵ����ѯ����: "+qtype);
			
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
		if(qtype.equalsIgnoreCase("allRefund"))
		{
			return this.queryAllRefund();
		}
		else
		{
			throw new Exception("ab03:δ֪��������ѯ����:"+qtype);
		}
		
	}
	
	
	//************************************************
	//					����ҵ��
	//************************************************
	
	/**
	 * ��һʵ����ѯ�˿�����
	 * @return
	 * @throws Exception
	 */
	private Map<String,String>refundDetail() throws Exception
	{
		StringBuilder sql =null;
		sql = new StringBuilder()
				.append("select c.aab202,b.aab302,a.aaa802,a.aaa807,a.aaa808,")
				.append("       a.aaa809,b.aab310,b.aab314,a.aaa803,a.aaa804,")
				.append("       a.aaa806,a.aaa805,c.aab203")
    			.append("  from aa08 a, ab03 b, ab02 c")
    			.append(" where a.aab302=b.aab302 and a.aab203=c.aab203")
    			.append(" and a.aaa802=?")
    			;
		System.out.println("***��ѯ��һ�ۺ�����:��ʾfindById()��SQL��ѯ���****");
		System.out.println(sql.toString()+"������:"+this.get("aaa802"));
		
		return this.queryForMap(sql.toString(), this.get("aaa802"));
	}
	
	/**
	 * �ύ�ۺ�����,�����ۺ�
	 * @return
	 * @throws Exception
	 */
	private boolean addRefund()throws Exception
	{
		//�޸Ķ���״̬
		this.updateOrder();
		//��ȡ�������
		int aaa802 =Tools.getSequence("aaa802");
		this.put("aaa802", aaa802);
		//1.����SQL���
		StringBuilder sql = new StringBuilder()
				.append("insert into aa08(aaa802,aab302,aab203,aaa102,aab102,")
    			.append("                 aaa803,aaa804,aaa805,aaa806,aaa807)")
    			.append("          values (?,?,?,?,?,")
    			.append("                  ?,?,?,?,current_timestamp)")
    			;
		//2.��д��������
		Object args[]={
				aaa802,
				this.get("aab302"),
				this.get("aab203"),
				this.get("aaa102"),
				this.get("aab102"),
				//5
				"01",
				this.get("aaa804"),
				this.get("aaa805"),
				this.get("aaa806")
				//9
		};
		System.out.println("***�ύ���ۺ�����***");
		System.out.println(sql.toString());
		
		return this.executeUpdate(sql.toString(), args);
		
		
	}
	
	/**
	 * �ύ�ۺ�֮���޸Ķ���״̬
	 * @throws Exception
	 */
	private void updateOrder()throws Exception
	{
		StringBuilder sql = new StringBuilder()
				.append("update ab03 a set")
				.append("  a.aab303='08'")
				.append("  where a.aab302=?")
				;
		
		Object args[]={
				this.get("aab302")
		};

		this.executeUpdate(sql.toString(), args);
	}
	
	/**
	 * ��ѯ��Ա�����ۺ������¼
	 * @return
	 * @throws Exception
	 */
	private List<Map<String,String>> queryAllRefund() throws Exception
	{
		//����SQL����
		StringBuilder sql = new StringBuilder()
				.append("select z.aaa802,z.aaa807,x.aab203,z.aaa803,z.aaa804,")
				.append("       x.aab302,x.aab310,x.aab313,x.aab314,y.aab202")
				.append("  from ab03 x,ab02 y, aa08 z ")
				.append("  where z.aab302=x.aab302 and z.aab203=y.aab203 ")
				.append("  and z.aaa102=? ")
				;
		
		//���ò����б�
		List<Object> paramList = new ArrayList<>();
		paramList.add(this.get("aaa102"));
		
  		System.out.println("***��ʾ�ۺ�������ѯSQL���***");
  		System.out.println(sql.toString());
  		System.out.println("***��ʾ�ۺ��ѯ�����б�***");
  		System.out.println(paramList);
  		
  		return this.queryForList(sql.toString(),paramList.toArray());
	}
}
