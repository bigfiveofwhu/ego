/**
 * @author hug
 * aab102 --店铺id
 * aab202 --商品名称
 * aab203 --商品id
 * aab204 --商品类型
 * aab205 --商品价格
 * aab206 --库存
 * aab207 --商品描述
 * aab208 --展示页面
 * aab209 --商品规格
 * aab210 --上架时间
 * aab211 --售后类型
 * aab212 --商品状态
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
	 * 通过aab102 --店铺id 批量查询商品
	 * @return
	 */
	private List<Map<String,String>> findProductsByAab102()
	{
		return null;
	}
	
	/**
	 * @author hug
	 * 查找商品最新上架的八个
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
