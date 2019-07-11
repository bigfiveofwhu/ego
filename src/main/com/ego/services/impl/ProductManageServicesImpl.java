/**
 * ��ab02:��Ʒ��Ϣ��
 *  Name	    Code	
	��Ʒ��ˮ��	aab201
	����id	    aab102	
	��Ʒ����	    aab202	
	��Ʒid	    aab203	=���+����
	��Ʒ����	    aab204	ѡ����Ʒ����:
	��Ʒ�۸�	    aab205	
	���	        aab206	
	��Ʒ����	    aab207	
	չʾҳ��    	aab208	
	��Ʒ���	    aab209	
	�ϼ�ʱ��	    aab210	 
	�ۺ�����	    aab211	 
	��Ʒ״̬	    aab212	 01--δ�ύ���;02---������;03--����ͨ��;04---����δͨ��;05---���¼�
 */

package com.ego.services.impl;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import com.ego.services.JdbcServicesSupport;
import com.ego.system.tools.Tools;

public class ProductManageServicesImpl extends JdbcServicesSupport
{
	public boolean update(String utype) throws Exception 
    {
    	if(utype.equalsIgnoreCase("queryAll"))
    	{
    		//return this.modifyUserInfo();
    	}
    	{
    		throw new Exception("����[ProductManageServicesImpl]�н�����δ����Ķ�������,����������  "+utype);
    	}	
    }
	
	/**
	 * ��Ʒҳ���ѯ
	 */
	public List<Map<String,String>> query() throws Exception
	{

  		//��ԭҳ���ѯ����
  		Object aab202=this.get("qaab202");     //��Ʒ����  ģ����ѯ
  		Object aab212=this.get("qaab212");     //��Ʒ״̬

  		
  		//����SQL����
  		StringBuilder sql=new StringBuilder()
  		  		.append("	select x.aab202,x.aab203,x.aab205,x.aab206,a.fvalue cnaab212 	")
  		  		.append("  from syscode a, ab02 x	")
  		 	    .append(" where x.aab212=a.fcode and a.fname='aab212' 	")
  				;
  		
  		//�����б�
  		List<Object> paramList=new ArrayList<>();
  		//��һ�жϲ�ѯ�����Ƿ�¼��,ƴ��AND����
  		if(this.isNotNull(aab202))
  		{
  			sql.append(" and x.aab202 like ?");
  			paramList.add("%"+aab202+"%");
  		}
  		if(this.isNotNull(aab212))
  		{
  			sql.append(" and x.aab212=?");
  			paramList.add(aab212);
  		}
  		//sql.append(" order by x.aab101");
  		return this.queryForList(sql.toString(), paramList.toArray());
	}
	
	/**
	 * ��Ʒ����ɾ��
	 * @throws Exception 
	 */
	public boolean deleteById() throws Exception
	{
		Object id = this.get("aab203");
		String sql = "delete from ab02 where aab203=? ";
		return this.executeUpdate(sql,id);
	}
	
	/**
	 * ��Ʒ����ɾ��
	 * @return
	 * @throws Exception
	 */
	public boolean batchDelete() throws Exception
	{
		//1.����SQL���
    	String sql="delete from ab02 where aab203=?";
    	//2.��ȡҳ��idlist����
    	String idlist[]=this.getIdList("proidList");
    	//3.ִ��
    	return this.batchUpdate(sql, idlist);
	}
     
	/**
	 * �����Ʒ
	 * @return
	 * @throws Exception
	 */
	public boolean addProduct() throws Exception
	{
		//��ȡ��ǰ��Ʒ���
    	int aab203=Tools.getIncrementId("aab201");
    
    	//��DTO�����Ʒ���
    	this.put("aab203", aab203);
    	
    	//1.��дSQL���
    	StringBuilder sql=new StringBuilder()
    			.append("insert into ab02(aab102,aab202,aab203,aab204,aab205,")
    			.append("                 aab206,aab207,aab208,aab209,aab210,")
    			.append("                 aab211,aab212)")
    			.append("          values(?,?,?,?,?,")
    			.append("                 ?,?,?,?,?,")
    			.append("                 ?,?)")
    			;
	 
    	//2.��д��������
    	Object args[]={
    			this.get("aab102"),   //����id
    			this.get("aab202"),
    			aab203,               //��Ʒid
    			this.get("aab203"),   
    			this.get("aab204"),
    			this.get("aab205"),
    			this.get("aab206"),
    			this.get("aab207"),
    			this.get("aab208"),
    			this.get("aab209"),
    			this.get("aab210"),
    			this.get("aab211"),
    			this.get("aab212")
    	};
        return this.executeUpdate(sql.toString(), args);	
	}
	
}
