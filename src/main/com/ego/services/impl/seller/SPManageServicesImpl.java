/**
 * @author zb
 * ��������Ϣ����
 */
package com.ego.services.impl.seller;

import java.lang.reflect.Method;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import com.ego.services.JdbcServicesSupport;
import com.ego.system.tools.Tools;

public class SPManageServicesImpl extends JdbcServicesSupport 
{
	public boolean update(String utype) throws Exception 
    {
		Method method=this.getClass().getDeclaredMethod(utype);
		method.setAccessible(true);
		return (boolean)method.invoke(this);
    }
	
	/**
	 * ��ѯ
	 */
	@Override
	public List<Map<String,String>> query(String qtype) throws Exception
	{
		if(qtype.equalsIgnoreCase("queryforservice"))
			return this.queryforService();
		if(qtype.equalsIgnoreCase("queryforcomment"))
			return this.queryforComment();
		if(qtype.equalsIgnoreCase("queryfororder"))
			return this.queryforOrder();
        throw new Exception("[SPManageServicesImpl] ��δ�����qtype");		
	}
	
	/**
	 * ��ѯ�÷�������Ϣ:һ���û�ӵ��һ��������
	 */
	@Override
	public Map<String, String> findById() throws Exception 
	{
        StringBuilder sql = new StringBuilder()
        		.append("select a.aac103,a.aac104,t.areaName cnaac105,b.fvalue cnaac106, ")
        		.append(" a.aac107,c.fvalue cnaac108,a.aac109,a.aac110" )
        		.append(" from ac01 a,syscode b,syscode c,T_Area t")
        		.append(" where b.fname = 'aac106' and b.fcode = a.aac106 ")
        		.append(" and   c.fname = 'aac108' and c.fcode = a.aac108 ")
        		.append(" and t.areaId = a.aac105")
        		.append(" and   a.aaa102 = ?")
        		;
		return this.queryForMap(sql.toString(), this.get("aaa102"));
	}
	
	/**�������***/
/**�����:ac02
 Name    	Code	
������ˮ��	aac201	
������id	    aac102	
����id	    aac202	
��������	    aac203	
��������	    aac204	
����ʽ	    aac205	
��������	    aac206	
��������	    aac207	
״̬   	    aac208	01--δ���,02--���ͨ��,03--���δͨ��,04--�¼�
	 */
	
	/**
	 * ��ѯ�÷����̷�����Ϣ
	 * @return
	 * @throws Exception
	 */
	private List<Map<String,String>> queryforService() throws Exception
	{
		//��ԭҳ���ѯ����
  		Object aac203=this.get("qaac203");     //��������  ģ����ѯ
  		Object aac208=this.get("qaac208");     //����״̬
  		Object aac102=this.get("aac102");   //������id

  		
  		//����SQL����
  		StringBuilder sql=new StringBuilder()
  				.append(" select a.aac202,a.aac203,b.fvalue cnaac204, ")
  				.append("       c.fvalue cnaac205,a.aac206,a.aac207, ")
  				.append("       d.fvalue cnaac208 ")
  				.append(" from ac02 a,syscode b,syscode c,syscode d ")
  				.append(" where b.fname='aac204' and b.fcode = a.aac204 ")
  				.append(" and   c.fname='aac205' and c.fcode = a.aac205 ")
  				.append(" and   d.fname='aac208' and d.fcode = a.aac208 ")
  				;
  		
  		//�����б�
  		List<Object> paramList=new ArrayList<>();
  		//��һ�жϲ�ѯ�����Ƿ�¼��,ƴ��AND����
  		if(this.isNotNull(aac203))
  		{
  			sql.append(" and a.aac203 like ?");
  			paramList.add("%"+aac203+"%");
  		}
  		if(this.isNotNull(aac208))
  		{
  			sql.append(" and a.aac208=?");
  			paramList.add(aac208);
  		}
  		if(this.isNotNull(aac102))
  		{
  			sql.append(" and a.aac102=?");
  			paramList.add(aac102);
  		}
  		//sql.append(" order by x.aab101");
  		return this.queryForList(sql.toString(), paramList.toArray());
	}
	
	
	
	
	/**�������۹���**/
/**
 *�������۱�:ac05 
Name	Code	
������ˮ	aac501	
������	aac402	
����id	aac502	
��������	aac503	
�̼һظ�	aac504	
����ʱ��	aac505	
�ظ�ʱ��	aac506
��������	aac507	
	 */
	
	
	/**
	  * ��ѯ�÷�������������
	 * @return
	 * @throws Exception
	 */
	private List<Map<String,String>> queryforComment() throws Exception
	{
		//��ԭҳ���ѯ����
		Object aac203=this.get("qaac203");       //���۷�������
  		Object isreply=this.get("isreply");     //�����Ƿ�ظ�
  		Object aac102=this.get("aac102");    //������id,session��ȡ
  	

  		
  		//����SQL����
  		StringBuilder sql=new StringBuilder()
  		  		.append("	select x.aac502,x.aac503,x.aac504,x.aac505,x.aac506,x.aac507,z.aac203")
  		  		.append("  from ac05 x,ac04 y,ac02 z 	")
  		 	    .append(" where x.aac402=y.aac402 	")
  		 	    .append(" and y.aac202 = z.aac202")
  				;
  		
  		//�����б�
  		List<Object> paramList=new ArrayList<>();
  		//��һ�жϲ�ѯ�����Ƿ�¼��,ƴ��AND����
  		if(this.isNotNull(aac203))
  		{
  			sql.append(" and z.aac203 like ?");
  			paramList.add("%"+aac203+"%");
  		}
  		if(this.isNotNull(isreply))
  		{
  			if(isreply.equals("01"))
  			sql.append(" and x.aac504 is null ");
  			else
  				sql.append(" and x.aac504 is not null");
  			//paramList.add(aab107);
  		}
  		if(this.isNotNull(aac102))
  		{
  			sql.append(" and y.aac102 = ?");
  			paramList.add(aac102);
  		}
  		//sql.append(" order by x.aab101");
  		return this.queryForList(sql.toString(), paramList.toArray());
	}
	
	/**
	 * �ظ�����
	 * @return
	 * @throws Exception
	 */
	public boolean replyComment() throws Exception
	{
		String sql = "update ac05  set aac504 = ? ,aac506 = current_time where aac502 = ?";
	    Object args[]= {
				this.get("aac504"),
		};
		return this.batchUpdate(sql, args, this.get("aac502"));
	}
	
	/**��������***/
	/**
	 * Name	Code	
������ˮ	aac401	
�û�id	aaa102	
������id	aac102	
����id	aac602	
����id	aac202	
������	aac402		
����ʱ��	aac403	
Ԥ��ʱ��	aac404	
�ɽ�ʱ��	aac405
�ɽ��ܶ�	aac407	
Ԥ�����	aac406	
����״̬	aac408	
�����ַ	aac409	
��������	aac410	
��������	aac411	
������Դ	aac412	
	 */
	/**
	  * ���񶩵���ѯ
	 * @return
	 * @throws Exception
	 */
	private List<Map<String,String>> queryforOrder() throws Exception
	{
		//��ԭҳ���ѯ����
		Object aac408=this.get("qaac408");       //01--��Ԥ��,02--�����
        Object aac402=this.get("qaac402");   //������
  		
  		//����SQL����
  		StringBuilder sql=new StringBuilder()
  				.append(" select x.aac402,x.aac404,x.aac405,x.aac407, ")
  				.append("        x.aac406")
  				.append(" from ac04 x ")
  				.append(" where 1")
  				;
  		
  		//�����б�
  		List<Object> paramList=new ArrayList<>();
  		//��һ�жϲ�ѯ�����Ƿ�¼��,ƴ��AND����
  		if(this.isNotNull(aac402))
  		{
  			sql.append(" and x.aac402 like ?");
  			paramList.add("%"+aac402+"%");
  		}
  		if(this.isNotNull(aac408))
  		{
  			sql.append(" and x.aac408 = ?");
  			paramList.add(aac408);
  		}
  		//sql.append(" order by x.aab101");
  		return this.queryForList(sql.toString(), paramList.toArray());
	}
	
	/**
	  * �ɽ�����
	 * @return
	 */
	public boolean okOrder() throws Exception
	{
		String sql ="update ac04 set aac405 = current_time,aac407 = aac406,aac408 = ? where aac402 = ?";
		
		
		return this.batchUpdate(sql, new Object[] {"02"},this.get("aac402"));
    }
	
	/**����***/
	/**
	 * ���ӷ���
	 * @return
	 * @throws Exception
	 */
	public boolean addService() throws Exception
	{
		Object aac102 = 1;
				//this.get("aac102");//������id session��ȡ
		//��ȡ��ǰ��Ʒ���
    	int aac202=Tools.getIncrementId("ac02");
    
    	//��DTO�����Ʒ���
    	this.put("aac202", aac202);
    	
    	
    	//1.��дSQL���
    	StringBuilder sql=new StringBuilder()
    			.append("insert into ac02(aac102,aac202,aac203,aac204,aac205,")
    			.append("                 aac206,aac207,aac208,aac209,aac210)")
    			.append("          values(?,?,?,?,?,")
    			.append("                 ?,?,?,?,?)")
    			;
	 
    	//2.��д��������
    	Object args[]={
    			aac102,   //������id
    			this.get("aac202"),
    			this.get("aac203"),
    			this.get("aac204"),
    			this.get("aac205"),
    			this.get("aac206"),
    			this.get("aac207"),
    			"01",
    			this.get("aac209"),
    			"/images/service/071803.jpg;/images/service/071801.jpg;/images/service/071802.jpg"
    	};
        return this.executeUpdate(sql.toString(), args);	
	}
	
}
