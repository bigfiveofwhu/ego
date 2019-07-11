package com.ego.services.impl;

import java.util.List;
import java.util.Map;

import com.ego.services.JdbcServicesSupport;
import com.ego.system.tools.Tools;

public class AdvertiseService extends JdbcServicesSupport{
	static final String productAd="00";
	static final String shoptAd="01";
	
	static final String headLine="00";
	static final String search="01";
	static final String AIads="10";
	static final String homePage="11";
	
	
	
	private List<Map<String,String>> queryAdsByAccountId() throws Exception {
		StringBuilder sql=new StringBuilder()
				.append(" select aad301,aad302,aad303,aad304,aad305,aad306,aad307")
				.append(" from ad03 where aad402=?");
		
		return this.queryForList(sql.toString(),this.get("add402") );
	}
	
	private List<Map<String, String>> getAdByType() throws Exception {
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
				.append(" aad306,aad307")
				.append(" value(?,?,?,?,?,?,?)");
		Object[] parameter=new Object[] {
				this.get("aad402"),
				this.get("aad302"),
				this.get("aad303"),
				this.get("aad304"),
				this.get("aad305"),
				this.get("aad306"),
				this.get("aad307"),
		};
		return this.executeUpdate(sql.toString(), parameter);
	}
	
	private boolean	addMoney() throws Exception {
		StringBuilder sql=new StringBuilder()
				.append(" update ad03 set")
				.append(" aad304=aad304+?")
				.append(" where aad302=?");
		return this.executeUpdate(sql.toString(),this.get("increment"),this.get("aad302") );
	}
	private boolean reduceMoney()throws Exception {
		StringBuilder sql=new StringBuilder()
				.append("update ad03 set")
				.append(" aad304=aad304-?")
				.append(" where aad302=?");
		Map<String, String> ad=getAdById();
		double balance= Double.parseDouble(ad.get("aad304").toString());
		double decrement=Double.parseDouble(this.get("decrement").toString());
		if (decrement>balance) {
			throw new Exception("账户余额不足");
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
				.append(" value(?,?,?,?)");
		double initMoney= Double.parseDouble(this.get("aad403").toString());
		if (initMoney<initMin) {
			throw new Exception("初始充值不能少于"+initMin);
		}
		Object[] parameter=new Object[] {
				idNumber,
				this.get("aad403"),
				this.get("aad102")
		};
		
		return this.executeUpdate(sql.toString(),parameter);
	}
	
	private boolean recharge() throws Exception{
		StringBuilder sql=new StringBuilder()
				.append(" update ad04 set")
				.append(" aad403 =aad403+?")
				.append(" where aad402=?");
		double increse=Tools.changeDouble(this.get("increment"));
		if (increse<0) {
			throw new Exception("非法的数字");
		}
		return this.executeUpdate(sql.toString(),increse,this.get("aad402"));
	}
	
	private boolean chargeMoney() throws Exception{
		StringBuilder sql=new StringBuilder()
				.append(" update ad04 set")
				.append(" aad403 =aad403-?")
				.append(" where aad402=?");
		double decrement=Tools.changeDouble(this.get("decrement"));
		if (decrement<0) {
			throw new Exception("非法的数字");
		}
		return this.executeUpdate(sql.toString(),decrement,this.get("aad402"));
	}
}
