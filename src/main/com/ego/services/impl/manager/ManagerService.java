package com.ego.services.impl.manager;

import java.util.Map;

import com.ego.services.JdbcServicesSupport;

public class ManagerService extends JdbcServicesSupport{
	
	@Override
	public Map<String, String> findById(String qtype) throws Exception {
		// TODO Auto-generated method stub
		switch (qtype) {
		case "getPassword":
			return getPassword();
		default:
			throw new Exception("��֧�ֵ����ͣ�in ManagerService");
		}
	}
	/**
	 * ͨ������Աid�������
	 * @return ����(aad103)
	 * @throws Exception
	 */
	private Map<String, String> getPassword() throws Exception {
		String sql="select aad103 from ad01 where aad102=?";
		return this.queryForMap(sql, this.get("aad102"));
	}
}
