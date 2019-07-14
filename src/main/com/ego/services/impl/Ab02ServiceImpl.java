/**
 * @author hug
 * aab102 --����id
 * aab202 --��Ʒ����
 * aab203 --��Ʒid
 * aab204 --��Ʒ����
 * aab205 --��Ʒ�۸�
 * aab206 --���
 * aab207 --��Ʒ����
 * aab208 --չʾҳ��
 * aab209 --��Ʒ���
 * aab210 --�ϼ�ʱ��
 * aab211 --�ۺ�����
 * aab212 --��Ʒ״̬
 */

package com.ego.services.impl;

import java.lang.reflect.Method;
import java.util.List;
import java.util.Map;

import com.ego.services.JdbcServicesSupport;

public class Ab02ServiceImpl extends JdbcServicesSupport
{

	/**
	 * @author hug
	 */
	@Override
	public Map<String, String> findById(String qtype) throws Exception
	{
		Method method=this.getMethod(qtype);
		return (Map<String, String>)method.invoke(this);
	}
	/**
	 * @author hug
	 */
	@Override
	public List<Map<String, String>> query(String qtype) throws Exception
	{
		Method method=this.getMethod(qtype);
		return (List<Map<String, String>>)method.invoke(this);
	}
	/**
	 * @author hug
	 * ͨ��aab102 --����id ������ѯ��Ʒ
	 * @return
	 */
	private List<Map<String,String>> findProductsByAab102()
	{
		return null;
	}
	
	/**
	 * @author hug
	 * ������Ʒ�����ϼܵİ˸�
	 * @return
	 */
	private List<Map<String,String>> findByUpToDate() throws Exception
	{
		String sql="select aab202,aab203,aab205 from ab02 order by aab210 desc limit 8";
		return this.queryForList(sql);
	}
	/**
	 * @author hug
	 * @return
	 * @throws Exception
	 */
	private Map<String, String> findByAab203() throws Exception
	{
		String sql="select aab102,aab202,aab203,aab205,aab206,aab207,aab208 from ab02 where aab203=? order by aab210 desc";
		return this.queryForMap(sql,this.get("aab203"));
	}
}
