package com.ego.services;

import java.util.List;
import java.util.Map;

public interface BaseServices
{
	
	default Map<String, String> findById() throws Exception 
	{
		return null;
	}

	default List<Map<String, String>> query() throws Exception 
	{
		return null;
	}

	default boolean update(String utype) throws Exception 
	{
		return false;
	}

	void setMapDto(Map<String, Object> dto);
}
