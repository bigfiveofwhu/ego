/**
 * @author zb
 * �ٱ���:ad07
 Name	      Code	
��ˮ��	     aad701	
�û�id	     aaa102	
�ٱ�ԭ��	     aad702	
�ٱ�����	     aad703	
�ٱ���������	 aad704	    01--��Ʒ,02--����,03--����,04--����,05--������
�ٱ�����ref	 aad705         �����id
�ٱ�״̬	     aad706		01--�Ѵ��� 02--δ����
 */

package com.ego.services.impl;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import com.ego.services.JdbcServicesSupport;

public class Ad07ServicesImpl extends JdbcServicesSupport
{
   /**
        *  �ٱ����ѯ
    */
	@Override
    public List<Map<String, String>> query() throws Exception 
    { 	
		//��ԭҳ���ѯ����
		Object aab202=this.get("aab202");       //������Ʒ����
  		Object isreply=this.get("isreply");     //�����Ƿ�ظ�
  		Object aab412=this.get("aab412");     //�Ƿ��ͼ
  	

  		
  		//����SQL����
  		StringBuilder sql=new StringBuilder()
  		  		.append("	select y.aab202,y.aab203,z.aaa103,x.aab403,x.aab410	")
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
  		if(this.equals(aab412))
  		{
  			sql.append(" and x.aab412 = ?");
  			paramList.add(aab412);
  		}
  		//sql.append(" order by x.aab101");
  		return this.queryForList(sql.toString(), paramList.toArray());
    }
	
	
	
}
