package com.ego.services.impl;

import java.util.Map;

import com.ego.services.JdbcServicesSupport;

public class TestService extends JdbcServicesSupport{
	@Override
	public Map<String, String> findById() throws Exception {
		// TODO Auto-generated method stub
		return this.queryForMap("select * from sequence");
	}
}
