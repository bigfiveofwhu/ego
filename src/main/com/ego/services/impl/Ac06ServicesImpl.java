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
		else if(utype.equalsIgnoreCase("postAimedNeed"))
		{
			return this.postAimedNeed();
		}
		else if(utype.equalsIgnoreCase("prepay"))
		{
			return this.prepay();
		}
		else if(utype.equalsIgnoreCase("del"))
		{
			return this.delNeed();
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
		else if(qtype.equals("service"))
		{
			return queryService();
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
		if(qtype.equalsIgnoreCase("queryRequireByAac102"))
		{
			return queryRequireByAac102();
		}
		if(qtype.equalsIgnoreCase("serviceType"))
		{
			return queryServiceType();
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
	 * ȥ�ύ��������ʱ,��ѯ���������Ϣ
	 * @return
	 * @throws Exception
	 */
	private Map<String,String> queryService()throws Exception
	{
		StringBuilder sql =null;
		sql = new StringBuilder()
				.append("select a.aac204,a.aac205,b.fvalue type,c.fvalue method,a.aac203")
    			.append("  from ac02 a,syscode b,syscode c")
    			.append(" where a.aac204=b.fcode and a.aac205=c.fcode")
    			.append(" and   b.fname='aac106' and c.fname='aac205'")
    			.append(" and   a.aac202=?")
    			;
		System.out.println("***������������ѯ����:��ʾfindById()��SQL��ѯ���****");
		System.out.println(sql.toString()+"������:"+this.get("aac202"));
		
		return this.queryForMap(sql.toString(), this.get("aac202"));
	}
	
	
	
	/**
	 * �����󱨼������ɷ��񶩵�
	 * @return
	 * @throws Exception
	 */
	private boolean prepay()throws Exception
	{
		//��ȡ�������
		String aac402 =Tools.getServiceOrderNumber();
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
	 * ɾ������(ʵ�������޸Ŀɼ�״̬)
	 * @throws Exception
	 */
	private boolean delNeed()throws Exception
	{
		
		StringBuilder sql = new StringBuilder()
				.append("update ac06 a set")
				.append("  a.aac610='02'")
				.append("  where a.aac602=?")
				;
		

		return this.executeUpdate(sql.toString(), this.getIdList("aac602"));

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
				.append("		x.aac605,y.fvalue type,z.fvalue method")
				.append("  from ac06 x,syscode y, syscode z ")
				.append("  where x.aac603=y.fcode and x.aac604=z.fcode ")
				.append("  and   z.fname='aac205' and y.fname='aac106' ")
				.append("  and   x.aac610='01' and x.aaa102=?")
				;
		
		
  		
  		return this.queryForList(sql.toString(),this.get("aaa102"));
	}
	
	/**
	 * ��ѯ���еķ�������
	 * @return
	 * @throws Exception
	 */
	private List<Map<String,String>> queryServiceType()throws Exception
	{
		//����SQL����
		StringBuilder sql = new StringBuilder()
				.append("select x.fcode,x.fvalue")
				.append("  from syscode x ")
				.append("  where x.fname='aac106' ")
				;
		
		
  		
  		return this.queryForList(sql.toString());
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
	 * ���ɷ�������
	 * @return
	 * @throws Exception
	 */
	private boolean postNeed()throws Exception
	{
		//��ȡ����id
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
				"01",


				
		};
		System.out.println("***�����·�������***");
		System.out.println(sql.toString());
		
		return this.executeUpdate(sql.toString(), args);
		
	}
	
	/**
	 * �����·�������
	 * @return
	 * @throws Exception
	 */
	private boolean postAimedNeed()throws Exception
	{
		//��ȡ����id
		int aac602 =Tools.getSequence("aac602");
		this.put("aab302", aac602);
		//1.����SQL���
		StringBuilder sql = new StringBuilder()
				.append("insert into ac06(aaa102,aac602,aac603,aac604,aac605,")
    			.append("                 aac606,aac607,aac608,aac609,aac611,")
    			.append("                 aac202)")
    			.append("          values (?,?,?,?,?,")
    			.append("                  ?,?,current_timestamp,?,?,")
    			.append("                  ?)")
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
				"01",
				"02",
				//10
				this.get("aac202")
				
		};
		System.out.println("***�����¶����������***");
		System.out.println(sql.toString());
		
		return this.executeUpdate(sql.toString(), args);
		
	}
	/**
	 * ���ݷ�����id��ѯ��������Ҫ��(ͬ����,Ͷ����)�����󶩵�
	 * @return
	 * @throws Exception
	 */
	private List<Map<String,String>> queryRequireByAac102() throws Exception
	{
		StringBuilder sql=new StringBuilder()
				.append("select a.aaa103,y.aaa102,y.aac602,b.fvalue aac603,c.fvalue aac604,y.aac605,")
				.append("		CONCAT(y.aac606,' ',y.aac607) as addr,y.aac608,y.aac202")
				.append("  from ac01 x,ac06 y,t_area z,aa01 a,syscode b,syscode c")
				.append(" where c.fcode=y.aac604 and c.fname='aac205'")
				.append("   and c.fcode=y.aac604 and c.fname='aac205'")
				.append("   and b.fcode=y.aac603 and b.fname='aac106'")
				.append("   and a.aaa102=y.aaa102")
				.append("   and y.aac603=x.aac106")                   //ƥ�����������ͬ��������Ϣ
				.append("   and y.aac609='02' and y.aac610='01' and y.aac606 like CONCAT('%',z.areaName,'%')")   // ����״̬  02 --��Ͷ��(δ����)   �ɼ�״̬ 01 --�ɼ�
				.append("   and (x.aac105=z.areaId and x.aac102=?)")
				.append(" limit 15")      //����Ϊ15��
				;
		return this.queryForList(sql.toString(), this.get("aac102"));
	}
}
