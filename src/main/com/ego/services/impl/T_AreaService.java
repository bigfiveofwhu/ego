/**
 * @author hug
 */
package com.ego.services.impl;

import java.lang.reflect.Method;
import java.util.List;
import java.util.Map;

import com.ego.services.JdbcServicesSupport;

public class T_AreaService extends JdbcServicesSupport 
{

	@Override
	public List<Map<String, String>> query() throws Exception
	{
		String type=(String)this.get("type");
		String sql="select areaId,areaName from T_Area where `parentId`=?";
		return this.queryForList(sql, type);
	}

	@Override
	public Map<String, String> findById(String qtype) throws Exception
	{
		Method method=this.getMethod(qtype);
		return (Map<String,String>)method.invoke(this);
	}
	/**
	 * 通过三级城市名称精确查找第三级城市编码
	 * @return
	 */
	private Map<String,String> findBy3Level() throws Exception
	{
		StringBuilder sql=new StringBuilder()
				.append("select x.areaId code  from T_Area x, T_Area y, T_Area z")
				.append(" where x.parentId=y.areaId and x.areaName=?")
				.append("   and y.parentId=z.areaId and y.areaName=?")
				.append("   and z.areaName=? and z.`level`='1'")
				;
		Object args[]= {
				this.get("addr_3"),
				this.get("addr_2"),
				this.get("addr_1")
		};
		return this.queryForMap(sql.toString(), args);
	}
	/**
	 * 通过地址信息查找经纬度
	 * hug
	 * @return
	 */
	private Map<String,String> findByAab105() throws Exception
	{
		String sql="select center from t_area where areaName=?";
		return this.queryForMap(sql, this.get("aab105"));
	}
}
