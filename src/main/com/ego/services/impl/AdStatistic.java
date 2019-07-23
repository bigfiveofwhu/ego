package com.ego.services.impl;

import java.sql.Date;
import java.util.List;
import java.util.Map;
import java.util.concurrent.ExecutionException;

import com.ego.services.JdbcServicesSupport;

public class AdStatistic extends JdbcServicesSupport{
	
	
	@Override
	public Map<String, String> findById(String qtype) throws Exception {
		// TODO Auto-generated method stub
		switch (qtype) {
		case "getTotal":
			return getTotal();
		default:
			throw new Exception("��֧�ֵ�����");
		}
	}
	
	@Override
	public boolean update(String utype) throws Exception {
		// TODO Auto-generated method stub
		switch (utype) {
		case "click"://�����
			return click();
		default:
			throw new Exception("��֧�ֵ�����");
		}
	}
	
	@Override
	public List<Map<String, String>> query(String qtype) throws Exception {
		// TODO Auto-generated method stub
		switch (qtype) {
		case "getRecentInfo"://��ȡ���30��Ĺ���¼
			return getRecentInfo();
		case "getUserInfo":
			return getUserInfo();//��õ���û�����Ϣ
		default:
			throw new Exception("��֧�ֵ�����");
		}
	}
	
	/**��Ҫaad302
	 * ͨ�����id��ý������30��ÿ��Ĺ��ĵ����
	 * @return aad502Ϊ���ڣ�sumΪ�����
	 * @throws Exception
	 */
	private List<Map<String, String>> getRecentInfo()throws Exception {
		StringBuilder sql=new StringBuilder()
				.append(" select aad502,sum(aad503)as sum from ad05 ")
				.append(" where aad302=? and datediff(now(),aad502)<30")
				.append(" group by aad502")
				.append(" order by aad502 ASC");
		return this.queryForList(sql.toString(), this.get("aad302"));
	}
	
	/**
	 * ���ݹ��id��ʱ���ȡ��������е�����û���Ϣ
	 * @return aaa102Ϊuserid��aad503Ϊ����
	 * @throws Exception
	 */
	private List<Map<String, String>> getUserInfo()throws Exception{
		StringBuilder sql=new StringBuilder()
				.append(" select aaa103,aad503 from ad05 join aa01 using(aaa102)")
				.append(" where aad302=? and aad502=?");
		return this.queryForList(sql.toString(), this.get("aad302"),this.get("aad502"));
	}
	
	
	/**
	 *  ͨ�����id����ܵ����
	 * @return totalΪ����
	 * @throws Exception 
	 */
	public Map<String, String> getTotal() throws Exception {
		String sql="select sum(aad503) as total from ad05 where aad302=?";
		return this.queryForMap(sql, this.get("aad302"));
	}
	
	
	private boolean click()throws Exception{
		Map<String, String> map=getRecord();
		if (map==null) {
			insert();
			addOne();
		}else {
			addOne();
		}
		return false;
	}
	
	/**
	 * �����û�id�����id�͵�ǰʱ���ѯһ����¼
	 * @throws Exception 
	 */
	private Map<String, String> getRecord() throws Exception {
		String sql="select * from ad05 where aaa102=? and aad302=? and aad502=?";
		Object[] param=new Object[] {
				this.get("aaa102"),
				this.get("aad302"),
				new Date(System.currentTimeMillis())
		};
		return this.queryForMap(sql, param);
	}
	
	private boolean insert()throws Exception {
		StringBuilder sql=new StringBuilder()
				.append(" insert into ad05(aaa102,aad302,aad502) value")
				.append(" (?,?,?)");
		Object[] param=new Object[] {
				this.get("aaa102"),
				this.get("aad302"),
				new Date(System.currentTimeMillis())
		};
		return this.executeUpdate(sql.toString(), param);  
	}
	
	private boolean addOne()throws Exception {
		StringBuilder sql=new StringBuilder()
				.append(" update ad05 set aad503=aad503+1 ")
				.append(" where aaa102=? and aad302=? and aad502=?");
		Object[] param=new Object[] {
				this.get("aaa102"),
				this.get("aad302"),
				new Date(System.currentTimeMillis())
		};
		return this.executeUpdate(sql.toString(), param);  
	}
}

