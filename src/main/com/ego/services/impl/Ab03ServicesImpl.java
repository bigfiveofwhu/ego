package com.ego.services.impl;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import com.ego.services.JdbcServicesSupport;
import com.ego.system.tools.Tools;

public class Ab03ServicesImpl extends JdbcServicesSupport 
{
	@Override
	public boolean update(String utype)throws Exception
	{
		if(utype.equalsIgnoreCase("addOrder"))
		{
			return this.addOrder();
		}
		else if(utype.equalsIgnoreCase("delById"))
		{
			return this.deleteById();
		}
		else if(utype.equalsIgnoreCase("payOrder"))
		{
			return this.payOrder();
		}
		else if(utype.equalsIgnoreCase("batchDelete"))
		{
			return this.batchDelete();
		}
		else if(utype.equalsIgnoreCase("recieveOrder"))
		{
			return this.recieveOrder();
		}
		else
		{
			throw new Exception("����[ Ab03ServicesImpl ]�н�����δ����Ķ�������,"
								+ "����������  "+utype);
		}
		
	}
	
	/**
	 * ���ݶ�����ɾ��ĳ����
	 * @return
	 * @throws Exception
	 */
	private boolean deleteById()throws Exception
	{
		String sql = "delete from ab03 where aab302=?";
		return this.executeUpdate(sql, this.get("aab302"));
	}

	
	/**
	 * ȷ���ջ�
	 * @return
	 * @throws Exception
	 */
	private boolean recieveOrder()throws Exception
	{
		StringBuilder sql = new StringBuilder()
				.append("update ab03 a set")
				.append("  a.aab303='05', a.aab307=current_timestamp")
				.append("  where a.aab302=?")
				;
		
		Object args[]={
				this.get("aab302")
		};
		
		//System.out.println("***��ʾ�༭����SQL���****");
		//System.out.println(sql.toString());
		return this.executeUpdate(sql.toString(), args);
	}
	
	/**
	 * ֧���༭����
	 * @return
	 * @throws Exception
	 */
	private boolean payOrder()throws Exception
	{
		StringBuilder sql = new StringBuilder()
				.append("update ab03 a set")
				.append("  a.aab303='02', a.aab305=current_timestamp,a.aab311=?,a.aab312=?")
				.append("  where a.aab302=?")
				;
		
		Object args[]={
				this.get("aab311"),
				this.get("aab312"),
				this.get("aab302")
		};
		
		//System.out.println("***��ʾ�༭����SQL���****");
		//System.out.println(sql.toString());
		return this.executeUpdate(sql.toString(), args);
	}
	
	
	/**
	 * ����ɾ����ѡ��Ա����Ϣ
	 * @return
	 * @throws Exception
	 */
	private boolean batchDelete() throws Exception
	{
		//����SQL���
		String sql="delete from ab01 where aab101=?";
		//��ȡҳ��idList����
		String idList[] = this.getIdList("idlist");
		//ִ��
		return this.batchUpdate(sql,idList);
	}
	/**
	 * ���Ӷ���
	 * @return
	 * @throws Exception
	 */
	private boolean addOrder()throws Exception
	{
		//��ȡ�������
		String aab302 =Tools.getOrderNumber();
		this.put("aab302", aab302);
		//1.����SQL���
		StringBuilder sql = new StringBuilder()
				.append("insert into ab03(aaa102,aab203,aab302,aab303,aab304,")
    			.append("                 aab308,aab310,aab311,aab313,aab314)")
    			.append("          values (?,?,?,?,current_timestamp,")
    			.append("                  ?,?,?,?,?)")
    			;
		//2.��д��������
		Object args[]={
				this.get("aaa102"),
				this.get("aab203"),
				aab302,
				"01",
				//5
				"01",
				this.get("aab310"),
				"�ջ���ַ:����",
				"0",
				this.get("aab314")//10
		};
		System.out.println("***�����¶���***");
		System.out.println(sql.toString());
		
		return this.executeUpdate(sql.toString(), args);
		
	}
	
	
	
	
	//*******************************************
	//��ѯ����
	//********************************************

	/**
	 * ����id���ҵ�������
	 * @return
	 * @throws Exception
	 */
	@Override
	public Map<String,String> findById(String fType)throws Exception
	{
		//1.�������дSQL
		StringBuilder sql =null;
		if(fType.equals("pay"))
		{
			sql = new StringBuilder()
					.append("select a.aab302,a.aab304,a.aab310,a.aab313,a.aab314")
	    			.append("  from ab03 a")
	    			.append(" where a.aab302=?")
	    			;
			System.out.println("***Ϊ֧����ѯ��һ����:��ʾfindById()��SQL��ѯ���****");
			System.out.println(sql.toString()+"������:"+this.get("aab302"));
		}
		else if(fType.equals("detail"))
		{
			sql = new StringBuilder()
					.append("select x.aab203,x.aab302,x.aab303,x.aab304,x.aab305,")
					.append("       x.aab306,x.aab307,x.aab309,x.aab310,x.aab311,")
					.append("       x.aab313,x.aab314")
	    			.append("  from ab03 x")
	    			.append(" where x.aab302=?")
	    			;
			System.out.println("***Ϊ�����ѯ��һ����:��ʾfindById()��SQL��ѯ���****");
			System.out.println(sql.toString()+"������:"+this.get("aab302"));
		}
		else
		{
			System.out.println("***��ʾ:δ֪�ĵ�һʵ����ѯ����: "+fType+" ****");
			
		}
		
		//ִ�в�ѯ
		return this.queryForMap(sql.toString(), this.get("aab302"));
	}
	
	
	/**
	 * ������ѯ����
	 * ʵ�ְ��û�id��ѯ
	 * @return
	 * @throws Exception
	 */
	public List<Map<String,String>> query(String qtype) throws Exception
	{
		
		//����SQL����
		StringBuilder sql = new StringBuilder()
				.append("select x.aab203,x.aab302,x.aab303,x.aab304,x.aab305,")
				.append("       x.aab306,x.aab307,x.aab309,x.aab310,x.aab313,")
				.append("       x.aab314")
				.append("  from ab03 x ")
				.append("  where x.aaa102=? and x.aab308='01' ")
				//.append("  and x.aab107=b.fcode and b.fname='aab107'")
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
}
