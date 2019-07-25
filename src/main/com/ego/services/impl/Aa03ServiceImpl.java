/**
 * @author zb
 * �ղؼ�:aa03
Name                 Code	
�ղؼ���ˮ��	         aaa301
�û�id	             aaa102	
����	                 aaa302	 01---��Ʒ;02---����
ref(��Ʒ���̼�id)   	 aaa303	
 */

package com.ego.services.impl;

import java.lang.reflect.Method;
import java.util.List;
import java.util.Map;

import com.ego.services.JdbcServicesSupport;

public class Aa03ServiceImpl extends JdbcServicesSupport
{
	//
	public boolean update(String utype) throws Exception 
    {
		Method method=this.getClass().getDeclaredMethod(utype);
		method.setAccessible(true);
		return (boolean)method.invoke(this);
    }
	
	/**
	 * ��ѯĳ�û��ղؼ�
	 */
	@Override
	public List<Map<String, String>> query(String qtype) throws Exception 
	{
		if(qtype.equals("product"))//���ղص���Ʒ
		{
			StringBuilder sql  = new StringBuilder()
					   .append(" select  a.aaa301,a.aaa303,b.aab202,b.aab203,b.aab205,b.aab206,b.aab212,b.aab208,b.aab102 ")   
					   .append(" from aa03 a,ab02 b ")
					   .append(" where a.aaa303 = b.aab203 and a.aaa302 = ? ")
					   .append("  and a.aaa102 = '")
					   .append(this.get("aaa102"))
					   .append("'")
					   ;
			return this.queryForList(sql.toString(), "01");
		}
		else if(qtype.equals("shop"))//���ղصĵ���
		{
			StringBuilder sql  = new StringBuilder()
					   .append(" select  a.aaa301,a.aaa303,b.aab103,b.aab107,b.aab102,b.aab104,b.aab111,b.aaa102 ")   
					   .append(" from aa03 a,ab01 b ")
					   .append(" where a.aaa303 = b.aab102 and a.aaa302 = ? ")
					   .append("  and a.aaa102 = '")
					   .append(this.get("aaa102"))
					   .append("'")
					   ;
             return this.queryForList(sql.toString(), "02");		
		}
		else 
		{
			throw new Exception("����[query]�н�����δ����Ĳ�����ֵ,����������  "+qtype);
		}
		//return super.query(qtype);
	}
	
	/**
	  * ����ɾ���ղ�
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("unused")
	private boolean delCollectionById() throws Exception
	{
		String sql ="delete from aa03 where aaa301 = ?";
		return this.executeUpdate(sql, this.get("aaa301"));
	}
	
	/**
	 * ����ղ�Ʒ
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("unused")
	private boolean addCollection() throws Exception
	{ 
		Object args[]=
			{
			  this.get("aaa102"),
			  this.get("aaa302"),
			  this.get("aaa303")
			};
		String sql1 = "select aaa301 from aa03 where aaa102 = ? and aaa302 = ? and aaa303 =?";
		
		if(this.queryForMap(sql1, args) != null)//�ѱ��ղ�
			return false;
		//��дSQL
		StringBuilder sql=new StringBuilder()
    			.append("insert into aa03(aaa102,aaa302,aaa303) ")
    			.append("          values(?,?,?)")
    			;
		
		return this.executeUpdate(sql.toString(), args);
	}
	
	
	
}
