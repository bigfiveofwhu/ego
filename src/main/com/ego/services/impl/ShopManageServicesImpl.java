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
}
