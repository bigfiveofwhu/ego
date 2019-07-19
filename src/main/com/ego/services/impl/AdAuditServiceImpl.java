package com.ego.services.impl;

import java.util.List;
import java.util.Map;

import com.ego.services.JdbcServicesSupport;

public class AdAuditServiceImpl extends JdbcServicesSupport{
	
	@Override
	public List<Map<String, String>> query(String qtype) throws Exception {
		// TODO Auto-generated method stub
		switch (qtype) {
		case "getAdAccountAudits"://获得所有广告的审核请求
			return getAdAccountAudits();
		default:
			throw new Exception("不支持的类型");
		}
	}
	
	@Override
	public boolean update(String utype) throws Exception {
		// TODO Auto-generated method stub
		switch (utype){
		case "pass"://获得所有广告的审核请求
			return pass();
		case "reject":
			return reject();
		default:
			throw new Exception("不支持的类型");
		}
	}

	/**
	 * 获得所有未审核的广告，不需要任何参数
	 * @return 用户id，用户名，审核流水号，审核内容
	 * @throws Exception
	 */
	private List<Map<String, String>> getAdAccountAudits() throws Exception{
		StringBuilder sql=new StringBuilder()
				.append(" select aaa103,aad801,aaa102,aad802 from ad08")
				.append(" join aa01 using(aaa102)")
				.append(" where aad803='ad' and aad804='01'");
		return this.queryForList(sql.toString());
	}

	/**
	 * 通过申请
	 * @return
	 * @throws Exception
	 */
	private boolean pass()throws Exception{
		StringBuilder sql=new StringBuilder()
				.append(" update ad08 set")
				.append(" aad102=? ,aad804='02', aad806=current_timestamp()");
		return this.executeUpdate(sql.toString(), this.get("aad102"));
	}

	/**
	 * 拒绝申请
	 * @return
	 * @throws Exception
	 */
	private boolean reject()throws Exception{
		StringBuilder sql=new StringBuilder()
				.append(" update ad08 set")
				.append(" aad102=? ,aad804='03', aad806=current_timestamp()");
		return this.executeUpdate(sql.toString(), this.get("aad102"));
	}

}
