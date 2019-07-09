package com.ego.services.impl;

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
	
}
