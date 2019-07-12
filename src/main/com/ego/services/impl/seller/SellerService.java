package com.ego.services.impl.seller;

import java.util.Map;

import com.ego.services.JdbcServicesSupport;

public class SellerService extends JdbcServicesSupport{
	
	
	
	@Override
	public Map<String, String> findById(String qtype) throws Exception {
		// TODO Auto-generated method stub
		switch (qtype) {
		case "getShopId":
			return this.getShopId();
		default:
			throw new Exception("不支持的类型");
		}
	}
	
	private Map<String, String> getShopId() throws Exception {
		String sql="select aab102 from ab01 where aaa102=?";
		return this.queryForMap(sql, this.get("aaa102"));
	}
}
