/**��ab01:���̱�
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

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import com.ego.services.JdbcServicesSupport;

public class ShopManageServicesImpl extends JdbcServicesSupport
{
	public boolean update(String utype) throws Exception 
    {
    	if(utype.equalsIgnoreCase("queryAll"))
    	{
    		//return this.modifyUserInfo();
    	}
    	{
    		throw new Exception("����[ShopManageServicesImpl]�н�����δ����Ķ�������,����������  "+utype);
    	}	
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
}
