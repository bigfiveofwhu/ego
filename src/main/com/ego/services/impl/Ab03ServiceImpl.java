/**
 * @author hug
 */
package com.ego.services.impl;

import java.lang.reflect.Method;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Map;

import com.ego.services.JdbcServicesSupport;

public class Ab03ServiceImpl extends JdbcServicesSupport
{
	/***********************************************
	 *          ����Ϊ��ѯ����
	 ***********************************************/
	@Override
	public Map<String, String> findById(String qtype) throws Exception 
	{
		Method method=this.getMethod(qtype);
		return (Map<String, String>)method.invoke(this);
	}
	
	/**
	 * @author hug
	 *  ͨ������id�����ϸ��µ�����(������Ʒ������), 01 --������,03--��ȡ��,08--���˿�,09--��������״̬����
	 * @return
	 * @throws Exception
	 */
	private Map<String,String> orderSumLastMouth() throws Exception
	{
		StringBuilder sql=new StringBuilder()
				.append("select sum(x.aab310) as lastmouthsum from ab03 x")
				.append(" where PERIOD_DIFF(date_format(NOW( ),'%Y%m'),date_format(x.aab306,'%Y%m'))=1")   //1�����ϸ��µ�����
				.append(" and x.aab303!='01' and x.aab303!='03' ")
				.append("and x.aab303!='08' and x.aab303!='09' and x.aab203=?")
				;
		return this.queryForMap(sql.toString(), this.get("aab203"));
	}
	/**
	 * �ۻ�����   ����cout��
	 * hug
	 * @return
	 * @throws Exception
	 */
	private Map<String,String> orderSum() throws Exception
	{
		String sql="select sum(x.aab310) as sum from ab03 x where x.aab303!='01' and x.aab303!='03' and x.aab303!='08' and x.aab303!='09' and x.aab203=?";
		return this.queryForMap(sql, this.get("aab203"));
	}
	
}
