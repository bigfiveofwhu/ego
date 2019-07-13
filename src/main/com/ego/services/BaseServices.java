package com.ego.services;

import java.util.List;
import java.util.Map;

public interface BaseServices
{
	/**
	 * ��һʵ����ѯ(�޲�)
	 */
	default Map<String, String> findById() throws Exception 
	{
		return null;
	}
	/**
	 * ��һʵ����ѯ(�в�)
	 * @param qtype
	 * @return
	 * @throws Exception
	 */
	default Map<String, String> findById(String qtype)throws Exception
	{
		return null;
	}
	/**
	 * ������ѯ(�޲�)
	 * @return
	 * @throws Exception
	 */
	default List<Map<String, String>> query() throws Exception 
	{
		return null;
	}
	/**
	 * ������ѯ(�в�)
	 * @param qtyep
	 * @return
	 * @throws Exception
	 */
	default List<Map<String,String>> query(String qtype)throws Exception
	{
		return null;
	}
	/**
	 * �����޸�/ɾ��/����(�в�)
	 * @param utype
	 * @return
	 * @throws Exception
	 */
	default boolean update(String utype) throws Exception 
	{
		return false;
	}
	
	/**
	 * Service����������
	 */
	void setMapDto(Map<String, Object> dto);
}
