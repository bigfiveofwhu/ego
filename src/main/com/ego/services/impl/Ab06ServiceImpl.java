/**
 * @author hug
 * aab203 --商品id
 * aab602 --活动id
 * aab603 --活动url
 * aab604 --活动描述
 * aab605 --活动状态
 * aab606 --活动开始时间
 * aab607 --活动结束时间
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
	 * 基于反射动态调用
	 */
	@Override
	public List<Map<String, String>> query(String qtype) throws Exception 
	{
		Method method=this.getMethod(qtype);
		return (List<Map<String, String>>)method.invoke(this);
	}
	/**
	 * @author hug
	 * 查找最新的四个活动内容;暂时没有考虑活动状态
	 * @return
	 */
	private List<Map<String, String>> findByUpToDate() throws Exception
	{
		String sql="select aab203,aab602,aab603,aab604 from ab06 where current_timestamp>aab606 and current_timestamp<aab607 limit 4";
		return this.queryForList(sql);
	}
}
