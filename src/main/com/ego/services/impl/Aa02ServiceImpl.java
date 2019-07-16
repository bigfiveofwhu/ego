/**
 * @author hug
 * aaa102 --�û�id
 * aaa202 --����
 * aaa203 --��Ʒid
 */
package com.ego.services.impl;

import java.lang.reflect.Method;
import java.util.List;
import java.util.Map;

import com.ego.services.JdbcServicesSupport;

public class Aa02ServiceImpl extends JdbcServicesSupport 
{
	/***************************************************
	 *   �����ǲ�ѯ����
	 ***************************************************/

	@Override
	public List<Map<String, String>> query(String qtype) throws Exception 
	{
		Method method=this.getMethod(qtype);
		return (List<Map<String, String>>)method.invoke(this);
	}

	/**
	 * ͨ��aaa102�û�id������ѯ�ɼ����ﳵ��Ʒ,��Ʒ��ϸ��Ϣ
	 * @return
	 */
	private List<Map<String, String>> queryByAaa102() throws Exception
	{
		StringBuilder sql=new StringBuilder()
				.append("select x.aab203,x.aaa202,x.aaa203,x.aaa205,y.aab202,y.aab205,")
				.append("		y.aab208")
				.append("  from aa02 x,ab02 y ")
				.append(" where y.aab203=x.aab203 and x.aaa204='01' and x.aaa102=?")
				;
		return this.queryForList(sql.toString(), this.get("aaa102"));
	}
	
	/***************************************************
	 *       �����Ǹ��·���
	 ***************************************************/
	
	@Override
	public boolean update(String utype) throws Exception 
	{
		Method method=this.getMethod(utype);
		return (boolean)method.invoke(this);
	}
	
	/**
	 * �Ȳ�����, ������,�������Ӧ���� aaa202, ��������, �����
	 * hug
	 * @return
	 * @throws Exception
	 */
	private boolean insertAa02() throws Exception
	{
		String sql="select aaa202 from aa02 where aaa102=? and aab203=?";
		Object args[]= {
				this.get("aaa102"),
				this.get("aab203")
		};
		Map<String,String> ins=this.queryForMap(sql, args);
		int aaa202=Integer.parseInt((String)this.get("aaa202"));   //��dto�л�ȡ
		if(ins!=null) 
		{
			aaa202=Integer.parseInt((String)ins.get("aaa202"))+aaa202;
			args=new Object[] {
					aaa202,
					this.get("aaa102"),
					this.get("aab203")
			};
			sql="update aa02 set aaa202=?,aaa203=current_timestamp where aaa102=? and aab203=?";
			return this.executeUpdate(sql, args);
		}
		sql="insert into aa02(aaa102,aab203,aaa202,aaa203,aaa204) values(?,?,?,current_timestamp,'01')";  //01 --�ɼ�
		args=new Object[] {
				this.get("aaa102"),
				this.get("aab203"),
				aaa202
		};
		return this.executeUpdate(sql, args);
	}
	
}
