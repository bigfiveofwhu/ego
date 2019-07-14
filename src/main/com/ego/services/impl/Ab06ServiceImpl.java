/**
 * @author hug
 * aab203 --��Ʒid
 * aab602 --�id
 * aab603 --�url
 * aab604 --�����
 * aab605 --�״̬
 * aab606 --���ʼʱ��
 * aab607 --�����ʱ��
 */
package com.ego.services.impl;

import java.lang.reflect.Method;
import java.util.List;
import java.util.Map;

import com.ego.services.JdbcServicesSupport;

public class Ab06ServiceImpl extends JdbcServicesSupport 
{

	/**
	 * @author hug
	 * ���ڷ��䶯̬����
	 */
	@Override
	public List<Map<String, String>> query(String qtype) throws Exception 
	{
		Method method=this.getMethod(qtype);
		return (List<Map<String, String>>)method.invoke(this);
	}
	/**
	 * @author hug
	 * �������µ��ĸ������;��ʱû�п��ǻ״̬
	 * @return
	 */
	private List<Map<String, String>> findByUpToDate() throws Exception
	{
		String sql="select aab203,aab602,aab603,aab604 from ab06 where current_timestamp>aab606 and current_timestamp<aab607 limit 4";
		return this.queryForList(sql);
	}
}
