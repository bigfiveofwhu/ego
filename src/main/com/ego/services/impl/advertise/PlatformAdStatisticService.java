package com.ego.services.impl.advertise;

import java.util.List;
import java.util.Map;

import com.ego.services.JdbcServicesSupport;

/**
 * ��ȡƽ̨�Ĺ��ͳ������
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
			throw new Exception("��֧�ֵ����ͣ�in PlatformAdStatisticService");
		}
	}
	
	
	/**
	 * ��ȡÿ�����͹���Ͷ���ܶ��aad305�������Ϊ����aad304Ͷ�Ž��Ϊֵ,���û���򲻰�����Ӧ��key
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
	 * ��ȡÿ�����͹��ĵ����������aad305�������Ϊ����aad503�������Ϊֵ,���û���򲻰�����Ӧ��key
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
