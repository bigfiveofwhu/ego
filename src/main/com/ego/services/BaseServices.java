package com.ego.services;

import java.util.List;
import java.util.Map;

public interface BaseServices
{
	/**
	 * 单一实例查询(无参)
	 */
	default Map<String, String> findById() throws Exception 
	{
		return null;
	}
	/**
	 * 单一实例查询(有参)
	 * @param qtype
	 * @return
	 * @throws Exception
	 */
	default Map<String, String> findById(String qtype)throws Exception
	{
		return null;
	}
	/**
	 * 批量查询(无参)
	 * @return
	 * @throws Exception
	 */
	default List<Map<String, String>> query() throws Exception 
	{
		return null;
	}
	/**
	 * 批量查询(有参)
	 * @param qtyep
	 * @return
	 * @throws Exception
	 */
	default List<Map<String,String>> query(String qtype)throws Exception
	{
		return null;
	}
	/**
	 * 数据修改/删除/插入(有参)
	 * @param utype
	 * @return
	 * @throws Exception
	 */
	default boolean update(String utype) throws Exception 
	{
		return false;
	}
	
	/**
	 * Service数据输入流
	 */
	void setMapDto(Map<String, Object> dto);
}
