package com.ego.services.impl;

import java.util.List;
import java.util.Map;

import com.ego.services.JdbcServicesSupport;
import com.ego.system.tools.Tools;

public class AdvertiseService extends JdbcServicesSupport{

	public static final String productAd="00";
	public static final String shoptAd="01";
	
	public static final String headLine="00";//��ҳ�ֲ�
	public static final String search="01";//������ǰ
	public static final String AIads="10";//����ϲ��
	public static final String homePage="11";//��ҳ������Ʒ

	@Override
	public List<Map<String, String>> query(String qtyep) throws Exception {
		// TODO Auto-generated method stub
		switch (qtyep) {
		case "queryAdsByAccountId":
			return queryAdsByAccountId();
		case "getAdByType":
			return this.getAdByType();
		default:
			throw new Exception("��֧�ֵ�����");
		}
	}
	@Override
	public boolean update(String utype) throws Exception {
		// TODO Auto-generated method stub
		switch (utype) {
		case "insertAdAccount":
			return this.insertAdAccount();
		case "recharge":
			return this.recharge();
		case "chargeMoney":
			return this.chargeMoney();
		case "insertAd":
			return this.insertAd();
		case "addMoney":
			return this.addMoney();
		case "reduceMoney":
			return this.reduceMoney();
		
		default:
			throw new Exception("��֧�ֵ�����");
		}
	}
	
	
	private List<Map<String,String>> queryAdsByAccountId() throws Exception {
		StringBuilder sql=new StringBuilder()
				.append(" select aad301,aad302,aad303,aad304,aad305,aad306,aad307")
				.append(" from ad03 where aad402=?");
		
		return this.queryForList(sql.toString(),this.get("aad402") );
	}
	
	private List<Map<String, String>> getAdByType() throws Exception {
		//��ȡ���id����Ʒ���ͣ�������ݺ�ref
		StringBuilder sql=new StringBuilder()
				.append(" select aad302,aad303,aad306,aad307")
				.append(" from ad03 where aad305=?")
				.append(" order by aad304 DESC")
				.append(" limit 20");
		return this.queryForList(sql.toString(), this.get("aad305"));
		
	}
	
	
	private  boolean insertAd() throws Exception {
		StringBuilder sql=new StringBuilder()
				.append(" insert into ad03(aad402,aad302,aad303,aad304,aad305,")
				.append(" aad306,aad307)")
				.append(" values(?,?,?,?,?,?,?)");
		Object[] parameter=new Object[] {
				this.get("aad402"),
				Tools.getIncrementId("aad302"),
				this.get("aad303"),
				this.get("aad304"),
				this.get("aad305"),
				this.get("aad306"),
				this.get("aad307"),
		};
		return this.executeUpdate(sql.toString(), parameter);
	}
	//��ӹ���Ǯ
	private boolean	addMoney() throws Exception {
		StringBuilder sql=new StringBuilder()
				.append(" update ad03 set")
				.append(" aad304=aad304+?")
				.append(" where aad302=?");
		return this.executeUpdate(sql.toString(),this.get("increment"),this.get("aad302") );
	}
	//���ٹ���Ǯ
	private boolean reduceMoney()throws Exception {
		StringBuilder sql=new StringBuilder()
				.append("update ad03 set")
				.append(" aad304=aad304-?")
				.append(" where aad302=?");
		Map<String, String> ad=getAdById();
		double balance= Double.parseDouble(ad.get("aad304").toString());
		double decrement=Double.parseDouble(this.get("decrement").toString());
		if (decrement>balance) {
			throw new Exception("�˻�����");
		}
		return  this.executeUpdate(sql.toString(),decrement,this.get("aad302") );
	}
	
	private Map<String, String> getAdById() throws Exception {
		String sql="select * from ad03 where aad302=?";
		return this.queryForMap(sql, this.get("aad302"));
	}
	
	static final double initMin=2000;
	private boolean insertAdAccount() throws Exception{
		int idNumber=Tools.getIncrementId("aad402");
		StringBuilder sql=new StringBuilder()
				.append(" insert into ad04(aad402,aad403,aaa102)")
				.append(" value(?,?,?)");
		double initMoney= Double.parseDouble(this.get("aad403").toString());
		if (initMoney<initMin) {
			throw new Exception("��ʼ��ֵ��������"+initMin);
		}
		Object[] parameter=new Object[] {
				idNumber,
				this.get("aad403"),
				this.get("aaa102")
		};
		
		return this.executeUpdate(sql.toString(),parameter);
	}
	//���˻����г�ֵ
	private boolean recharge() throws Exception{
		StringBuilder sql=new StringBuilder()
				.append(" update ad04 set")
				.append(" aad403 =aad403+?")
				.append(" where aad402=?");
		double increse=Tools.changeDouble(this.get("increment"));
		if (increse<0) {
			throw new Exception("�Ƿ�������");
		}
		return this.executeUpdate(sql.toString(),increse,this.get("aad402"));
	}
	//��ȡ���ѣ������˻���Ǯ
	private boolean chargeMoney() throws Exception{
		StringBuilder sql=new StringBuilder()
				.append(" update ad04 set")
				.append(" aad403 =aad403-?")
				.append(" where aad402=?");
		double decrement=Tools.changeDouble(this.get("decrement"));
		if (decrement<0) {
			throw new Exception("�Ƿ�������");
		}
		return this.executeUpdate(sql.toString(),decrement,this.get("aad402"));
	}
}
