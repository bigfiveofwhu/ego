package com.ego.services.impl.advertise;

import java.util.List;
import java.util.Map;

import com.ego.services.JdbcServicesSupport;

/**
 * 获取平台的广告统计数据
 * @author why
 *
 */
public class PlatformAdStatisticService extends JdbcServicesSupport{
	
	@Override
	public List<Map<String, String>> query(String qtype) throws Exception {
		// TODO Auto-generated method stub
		switch (qtype) {
		case "getFounds":
			return this.getFounds();
		case "getClickInfo":
			return getClickInfo();
		default:
			throw new Exception("不支持的类型，in PlatformAdStatisticService");
		}
	}
	
	
	/**
	 * 获取每种类型广告的投放总额，以aad305广告类型为键，aad304投放金额为值,如果没有则不包含相应的key
	 * @return
	 * @throws Exception 
	 */
	private List<Map<String, String>> getFounds() throws Exception {
		StringBuilder sql=new StringBuilder()
				.append(" select aad305,sum(aad304)as total from ad03 ")
				.append(" group by aad305");
		return this.queryForList(sql.toString());
	}
	/**
	 * 获取每种类型广告的点击总量，以aad305广告类型为键，aad503点击次数为值,如果没有则不包含相应的key
	 * @return
	 * @throws Exception
	 */
	private List<Map<String, String>> getClickInfo()throws Exception {
		StringBuilder sql=new StringBuilder()
				.append(" select aad305,sum(aad503)as total")
				.append(" from ad05 join ad03 using(aad302)")
				.append(" group by aad305");
		return this.queryForList(sql.toString());
	}
}
