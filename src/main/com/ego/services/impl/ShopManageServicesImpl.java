/**��ab01:���̱�  @author zb
Name	    Code	
������ˮ��	aab101	
�û�id	    aaa102	
����id	    aab102	
��������	    aab103	
�������û���	aab104	
���̵�ַ	    aab105	
��֤��Ϣ   	aab106	
����״̬	    aab107	01--δ���;02--���ͨ��;03--���δͨ��;04--�ر�
��֤��	    aab108	
��������   	aab109	
��������   	aab110	
��Ʒ����   	aab111	
**/
package com.ego.services.impl;

import java.lang.reflect.Method;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import com.ego.services.JdbcServicesSupport;

public class ShopManageServicesImpl extends JdbcServicesSupport
{
	public boolean update(String utype) throws Exception 
    {
		//System.out.println("ִ�з���");
		Method method=this.getClass().getDeclaredMethod(utype);
		method.setAccessible(true);
		return (boolean)method.invoke(this);
    }
	
	/**
	 * ����ҳ���ѯ
	 */
	public List<Map<String,String>> query() throws Exception
	{

  		//��ԭҳ���ѯ����
  		Object aab103=this.get("qaab103");     //��������  ģ����ѯ
  		Object aab107=this.get("qaab107");     //����״̬

  		
  		//����SQL����
  		StringBuilder sql=new StringBuilder()
  		  		.append("	select y.aaa109,x.aab102,x.aab103,y.aaa108,a.fvalue cnaab107 	")
  		  		.append("  from syscode a, ab01 x, aa01 y 	")
  		 	    .append(" where x.aab107=a.fcode and a.fname='aab107' 	")
  		     	.append("  and x.aaa102=y.aaa102 	")
  				;
  		
  		//�����б�
  		List<Object> paramList=new ArrayList<>();
  		//��һ�жϲ�ѯ�����Ƿ�¼��,ƴ��AND����
  		if(this.isNotNull(aab103))
  		{
  			sql.append(" and x.aab103 like ?");
  			paramList.add("%"+aab103+"%");
  		}
  		if(this.isNotNull(aab107))
  		{
  			sql.append(" and x.aab107=?");
  			paramList.add(aab107);
  		}
  		//sql.append(" order by x.aab101");
  		return this.queryForList(sql.toString(), paramList.toArray());
	}
	
	/**
	 * ��ȡ������Ʒ���� ������
	 * ���۱�:ab04
	 * @return
	 * @throws Exception
	 */
	public Map<String,String> getProductAvg() throws Exception
	{
		//��ȡ������������Ʒidlist
		String sql1 = "select aab203 from ab02 where aab102 = ?";
		List<Map<String,String>> list = this.queryForList(sql1, this.get("aab102"));
		List<Object> olist = new ArrayList<>(); 
		for(Map<String,String> map : list)
		{
			olist.add(map.get("aab102"));
		}
		
		String sql2 = "select avg(aab410) as productAvg from ab04 where aab203=?";
		return this.queryForMap(sql2,olist.toArray());
	}
	
	/**
	 * �������� ������
	 * @return
	 * @throws Exception
	 */
	public Map<String,String> getServiceAvg() throws Exception
	{
		//��ȡ������������Ʒidlist
		String sql1 = "select aab203 from ab02 where aab102 = ?";
		List<Map<String,String>> list = this.queryForList(sql1, this.get("aab102"));
		List<Object> olist = new ArrayList<>(); 
		for(Map<String,String> map : list)
		{
			olist.add(map.get("aab102"));
		}
		
		String sql2 = "select avg(aab411) as productAvg from ab04 where aab203=?";
		return this.queryForMap(sql2,olist.toArray());
	}
	
	/**
	 * �������� ������
	 * @return
	 * @throws Exception
	 */
	public Map<String,String> getShipAvg() throws Exception
	{
		//��ȡ������������Ʒidlist
		String sql1 = "select aab203 from ab02 where aab102 = ?";
		List<Map<String,String>> list = this.queryForList(sql1, this.get("aab102"));
		List<Object> olist = new ArrayList<>(); 
		for(Map<String,String> map : list)
		{
			olist.add(map.get("aab102"));
		}
		
		String sql2 = "select avg(aab409) as productAvg from ab04 where aab203=?";
		return this.queryForMap(sql2,olist.toArray());
	}
	
	/**
	 * ����������ʸ�
	 * @return
	 * @throws Exception
	 */
	public boolean checkIn() throws Exception
	{
		//�û�id��session���
		Object userId = "1";
		String sql1="select a.aab107 from ab01 a where a.aaa102 = ?";
		List<Map<String,String>> list = this.queryForList(sql1,userId );
		if(list.size() > 0)
		{
			//�û����ͨ��
			if(list.get(0).get("aab107").equals("02"))
					return true;
			else
			//�û����δͨ��
				return false;
		}
		//�û�δ����
		return false;
	}
	
	/**���۹���**/
/**���۱�:ab04
 Name	       Code	
������ˮ                 aab401	
������(13λ)	   aab302	
��Ʒid	       aab203
�û�id	       aaa102	
����id	       aab402	
��������	       aab403	
׷������                aab404	
�̼һظ�	       aab405	
����ʱ��	       aab406	
׷��ʱ��                aab407	
�ظ�ʱ��	       aab408	
��������	       aab409	
��Ʒ����	       aab410	
��������	       aab411	
�Ƿ���ͼ	       aab412	01--��ͼ 02---��ͼ	
������	       aab413	
	 */
	
	public List<Map<String, String>> query(String qtype) throws Exception 
	{
		if(qtype.equalsIgnoreCase("queryforcomment"))
			return this.queryforComment();
		else if(qtype.equalsIgnoreCase("queryforafterbuy"))
			return this.queryforAfterBuy();
		else
			throw new Exception("δ�����qtype");
	}
	
	/**
	 * ��ѯ����ҳ��
	 * @return
	 * @throws Exception
	 */
	public List<Map<String, String>> queryforComment() throws Exception 
	{
		//��ԭҳ���ѯ����
				Object aab202=this.get("aab202");       //������Ʒ����
		  		Object isreply=this.get("isreply");     //�����Ƿ�ظ�
		  		Object aab412=this.get("aab412");     //�Ƿ��ͼ
		  	

		  		
		  		//����SQL����
		  		StringBuilder sql=new StringBuilder()
		  		  		.append("	select y.aab202,y.aab203,z.aaa103,x.aab403,x.aab410,x.aab405 ")
		  		  		.append("  from ab04 x, ab02 y, aa01 z 	")
		  		 	    .append(" where x.aab203=y.aab203 and x.aaa102=z.aaa102	")
		  				;
		  		
		  		//�����б�
		  		List<Object> paramList=new ArrayList<>();
		  		//��һ�жϲ�ѯ�����Ƿ�¼��,ƴ��AND����
		  		if(this.isNotNull(aab202))
		  		{
		  			sql.append(" and x.aab202 like ?");
		  			paramList.add("%"+aab202+"%");
		  		}
		  		if(this.isNotNull(isreply))
		  		{
		  			if(isreply.equals("01"))
		  			sql.append(" and x.aab405 is null ");
		  			else
		  				sql.append(" and x.aab405 is not null");
		  			//paramList.add(aab107);
		  		}
		  		if(this.isNotNull(aab412))
		  		{
		  			sql.append(" and x.aab412 = ?");
		  			paramList.add(aab412);
		  		}
		  		//sql.append(" order by x.aab101");
		  		return this.queryForList(sql.toString(), paramList.toArray());
	}
	
	/**
	 * �̼һظ�����
	 * @return
	 * @throws Exception
	 */
	public boolean replyComment() throws Exception
	{
		//Object aab405 = this.get("aab405");
		String  sql = "update ab04 a set a.aab405=?";
		
		return this.executeUpdate(sql, this.get("aab405"));
	}

	/*****�ۺ����******/
	
	/**
	 * �鿴�ۺ�
	 * @return
	 * @throws Exception
	 */
	public List<Map<String, String>> queryforAfterBuy() throws Exception 
	{
		//��ԭҳ���ѯ����
		Object aab803=this.get("aab803");       //�ۺ�״̬
  		Object aab202=this.get("aab202");     //�ۺ���Ʒ
  	

  		
  		//����SQL����
  		StringBuilder sql=new StringBuilder()
  		  		.append("	select y.aab202,y.aab203,z.aaa103,x.aaa802,x.aaa804,")
  		  		.append("	x.aaa805,q.aab302	")
  		  		.append("  from aa08 x, ab02 y, aa01 z,ab03 q 	")
  		 	    .append(" where x.aab203=y.aab203 and x.aaa102=z.aaa102	and q.aab302=x.aab302")
  				;
  		
  		//�����б�
  		List<Object> paramList=new ArrayList<>();
  		//��һ�жϲ�ѯ�����Ƿ�¼��,ƴ��AND����
  		if(this.isNotNull(aab803))
  		{
  			sql.append(" and x.aab202 like ?");
  			paramList.add("%"+aab803+"%");
  		}
  		if(this.equals(aab202))
  		{
  			sql.append(" and x.aab412 = ?");
  			paramList.add(aab202);
  		}
  		//sql.append(" order by x.aab101");
  		return this.queryForList(sql.toString(), paramList.toArray());
		
	}
	
}