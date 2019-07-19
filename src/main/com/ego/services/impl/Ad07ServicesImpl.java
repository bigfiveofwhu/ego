/**
 * @author zb
 * �ٱ���:ad07
 Name	      Code	
��ˮ��	     aad701	
�û�id	     aaa102	
�ٱ�ԭ��	     aad702	
�ٱ�����	     aad703	
�ٱ���������	 aad704	   01--����,02--��Ʒ,03--����,04--����,05--������
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
		Object aad706=this.get("aad706");       //Ͷ�ߴ���״̬
       
  		
  		//����SQL����
  		StringBuilder sql=new StringBuilder()
  		  		.append("	select y.aaa102,y.aaa103, x.aad705,x.aad704	")
  		  		.append("   a.fvalue cnaad702,b.fvalue cnaad703,c.fvalue cnaad704,d.fvalue cnaad706 ")
  		  		.append("  from ad07 x, aa01 y, syscode a,syscode b,syscode c,syscode d ")
  		 	    .append(" where x.aaa102=y.aaa102 	")
  		 	    .append("  and a.fname='aad702' and a.fcode=x.aad702 ")
  		 	    .append("  and b.fname='aad703' and b.fcode=x.aad703 ")
  		 	    .append("  and c.fname='aad704' and c.fcode=c.aad704 ")
  		 	    .append("  and d.fname='aad706' and d.fcode=x.aad706 ")
  		 	    ;
  				
  		//�����б�
  		List<Object> paramList=new ArrayList<>();
  		//��һ�жϲ�ѯ�����Ƿ�¼��,ƴ��AND����
  		if(this.isNotNull(aad706))
  		{
  			sql.append(" and x.aab202 like ?");
  			paramList.add("%"+aad706+"%");
  		}
  		//sql.append(" order by x.aab101");
  		return this.queryForList(sql.toString(), paramList.toArray());
    }
	
	/**
	 * �жϾٱ���������,��ѯ��ϸ��Ϣ
	 */
	@Override
	public List<Map<String, String>> query(String qtype) throws Exception 
	{
		//String type = (String)this.get("aad704");
		String sql;
		switch (qtype) {
		case "01":
			break;
		case "02":
			break;
		default:
			break;
		}
			// TODO Auto-generated method stub
			return super.query(qtype);
	}
	
	
	
	
	
	
}
