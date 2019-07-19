package com.ego.services.impl;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import com.ego.services.JdbcServicesSupport;
import com.ego.system.tools.Tools;

public class Ac06ServicesImpl extends JdbcServicesSupport 
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
		if(utype.equalsIgnoreCase("postNeed"))
		{
			return this.postNeed();
		}
		else if(utype.equalsIgnoreCase("prepay"))
		{
			return this.prepay();
		}
		else
		{
			throw new Exception("����[ Ac04ServicesImpl ]�н�����δ����Ķ�������,"
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
		if(qtype.equals("selectTarget"))
		{
			return selectTarget();
		}
		else if(qtype.equals("detail"))
		{
			return null;
		}
		else
		{
			throw new Exception("ac04:δ֪�ĵ�һʵ����ѯ����: "+qtype);
			
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
		if(qtype.equalsIgnoreCase("allNeed"))
		{
			return this.allNeed();
		}
		if(qtype.equalsIgnoreCase("allTarget"))
		{
			return this.allTarget();
		}
		else
		{
			throw new Exception("ac04:δ֪��������ѯ����:"+qtype);
		}
		
	}
	
	
	
	//********************************************************************
	//								����ҵ��
	//********************************************************************
	
	/**
	 * ȥԤ��ʱ��ѯ�����Ϣ
	 * @return
	 * @throws Exception
	 */
	private Map<String,String> selectTarget()throws Exception
	{
		StringBuilder sql =null;
		sql = new StringBuilder()
				.append("select a.aac602,a.aac603,a.aac604,a.aac605,a.aac606,")
				.append("       a.aac607,b.aac303,b.aac304,c.aac103,c.aac102,b.aac302")
    			.append("  from ac06 a,ac03 b,ac01 c")
    			.append(" where a.aac602=b.aac602 and b.aac102=c.aac102")
    			.append(" and   b.aac302=?")
    			;
		System.out.println("***Ϊ����Ԥ����ѯ��һ����:��ʾfindById()��SQL��ѯ���****");
		System.out.println(sql.toString()+"������:"+this.get("aac302"));
		
		return this.queryForMap(sql.toString(), this.get("aac302"));
	}
	
	
	
	/**
	 * �����󱨼������ɷ��񶩵�
	 * @return
	 * @throws Exception
	 */
	private boolean prepay()throws Exception
	{
		//��ȡ�������
		int aac402 =Tools.getSequence("aac402");
		this.put("aac402", aac402);
		//1.����SQL���
		StringBuilder sql = new StringBuilder()
				.append("insert into ac04(aac402,aac403,aac404,aac406,aac408,")
    			.append("                 aac409,aac410,aac411,aac412,aac602,")
    			.append("                 aaa102,aac102,aac407)")
    			.append("          values (?,current_timestamp,current_timestamp,?,?,")
    			.append("                  ?,?,?,?,?,")
    			.append("                  ?,?,?)")
    			;
		//2.��д��������
		Object args[]={
				aac402,
				this.get("aac406"),
				"01",
				//5
				this.get("aac409"),
				this.get("aac410"),
				this.get("aac411"),
				"01",
				this.get("aac602"),
				//10
				this.get("aaa102"),
				this.get("aac102"),
				this.get("aac407")
		};
		System.out.println("***�����·��񶩵�***");
		System.out.println(sql.toString());
		this.changeTargetMode((String)this.get("aac602"), (String)this.get("aac302"));
		
		return this.executeUpdate(sql.toString(), args);
		
	}
	
	/**
	 * ѡ�񱨼����ɶ���֮��,�޸�ϵ�б��۵�״̬
	 * @param aac602
	 * @param aac302
	 * @throws Exception
	 */
	private void changeTargetMode(String aac602,String aac302)throws Exception
	{
		//���õ�ǰ�����Ӧ�����б���״̬Ϊ03(�ѷ��)
		StringBuilder sql1 = new StringBuilder()
				.append("update ac03 a set")
				.append("  a.aac305='03'")
				.append("  where a.aac602=?")
				;
		
		Object args1[]={
				aac602
		};
		this.executeUpdate(sql1.toString(), args1);
		//���õ�ǰ���۷�����״̬Ϊ02(��ѡ��)
		StringBuilder sql2 = new StringBuilder()
				.append("update ac03 a set")
				.append("  a.aac305='02'")
				.append("  where a.aac602=? and a.aac302=?")
				;
		
		Object args2[]={
				aac602,
				aac302
		};
		this.executeUpdate(sql2.toString(), args2);
	}
	
	
	/**
	 * ��ѯ��������
	 * @return
	 * @throws Exception
	 */
	private List<Map<String,String>> allNeed()throws Exception
	{
		//����SQL����
		StringBuilder sql = new StringBuilder()
				.append("select x.aac602,x.aac603,x.aac604,x.aac608,x.aac609,")
				.append("		x.aac605")
				.append("  from ac06 x ")
				.append("  where x.aaa102=?")
				;
		
		
  		
  		return this.queryForList(sql.toString(),this.get("aaa102"));
	}
	
	/**
	 * ��ѯ���б���
	 * @return
	 * @throws Exception
	 */
	private List<Map<String,String>> allTarget()throws Exception
	{
		//����SQL����
		StringBuilder sql = new StringBuilder()
				.append("select y.aac103,x.aac102,x.aac302,x.aac303,x.aac304,")
				.append(" 		x.aac305")
				.append("  from ac03 x, ac01 y ")
				.append("  where x.aac102=y.aac102")
				.append("  and   x.aac602=?")
				;
		
		
  		
  		return this.queryForList(sql.toString(),this.get("aac602"));
	}
	
	
	/**
	 * �����·�������
	 * @return
	 * @throws Exception
	 */
	private boolean postNeed()throws Exception
	{
		//��ȡ�������
		int aac602 =Tools.getSequence("aac602");
		this.put("aab302", aac602);
		//1.����SQL���
		StringBuilder sql = new StringBuilder()
				.append("insert into ac06(aaa102,aac602,aac603,aac604,aac605,")
    			.append("                 aac606,aac607,aac608,aac609)")
    			.append("          values (?,?,?,?,?,")
    			.append("                  ?,?,current_timestamp,?)")
    			;
		//2.��д��������
		Object args[]={
				this.get("aaa102"),
				aac602,
				this.get("aac603"),
				this.get("aac604"),
				this.get("aac605"),
				//5
				this.get("provinceTmp").toString()+" "+this.get("cityTmp")+" "+this.get("areaTmp"),
				this.get("aac607"),
				"01"
				
		};
		System.out.println("***�����·�������***");
		System.out.println(sql.toString());
		
		return this.executeUpdate(sql.toString(), args);
		
	}
}