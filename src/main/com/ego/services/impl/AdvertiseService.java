package com.ego.services.impl;

import java.util.List;
import java.util.Map;

import com.ego.services.JdbcServicesSupport;
import com.ego.system.tools.Tools;

public class AdvertiseService extends JdbcServicesSupport{

	public static final String productAd="00";
	public static final String shoptAd="01";
	public static final String serviceAd="10";

	public static final String headLine="00";//首页轮播
	public static final String search="01";//搜索靠前
	public static final String AIads="10";//猜你喜欢
	public static final String homePage="11";//热门商品

	@Override
	public Map<String, String> findById(String qtype) throws Exception {
		// TODO Auto-generated method stub
		switch (qtype) {
		case "getAccountById":
			return this.getAccountById();
		default:
			throw new Exception("不支持的类型");
		}
	}
	
	@Override
	public List<Map<String, String>> query(String qtyep) throws Exception {
		// TODO Auto-generated method stub
		switch (qtyep) {
		case "queryAdsByAccountId":
			return queryAdsByAccountId();
		case "getAdByType":
			return this.getAdByType();
		default:
			throw new Exception("不支持的类型");
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
		case "addAdAudit":
			return this.addAdAudit();
		default:
			throw new Exception("不支持的类型");
		}
	}
	/**
	 * 通过type和ref 返回产品的名字
	 * @param type 类型
	 * @param ref id值
	 * @return
	 * @throws Exception
	 */
	public String getName(String type,String ref) throws Exception {
		String sqlProduct="select aab202 from ab02 where aab203=?";
		String sqlService="select aac203 from ac02 where aac202=?";
		String sqlShop="select aab103 from ab01 where aab102=?";
		switch (type) {
		case AdvertiseService.productAd:
			return this.queryForMap(sqlProduct, ref).get("aab202");
		case AdvertiseService.serviceAd:
			return this.queryForMap(sqlService, ref).get("aac203");
		case AdvertiseService.shoptAd:
			return this.queryForMap(sqlShop, ref).get("aab102");
		default:
			throw new Exception("aad303类型出错  in advertiseController");
		}
	}

	public String getAdType(String aad305) throws Exception {		
		switch (aad305) {
		case headLine:
			return "首页轮播";
		case search:
			return "搜索靠前";
		case AIads:
			return "猜你喜欢";
		case homePage:
			return "热门商品";
		default:
			throw new Exception("未知的广告类型，in advertiseService");
		}
	}
	
	private boolean addAdAudit() throws Exception{
		StringBuilder sql=new StringBuilder()
				.append(" insert into ad08")
				.append(" (aaa102,aad802,aad803,aad804)")
				.append(" value(?,?,'ad','01')");
		Object[] param=new Object[] {
				this.get("aaa102"),
				this.get("aad802")
		};
		return this.executeUpdate(sql.toString(), param);
	}
	
	private List<Map<String,String>> queryAdsByAccountId() throws Exception {
		StringBuilder sql=new StringBuilder()
				.append(" select aad301,aad302,aad303,aad304,aad305,aad306")
				.append(" from ad03 where aad402=?");
		
		return this.queryForList(sql.toString(),this.get("aad402") );
	}
	
	private List<Map<String, String>> getAdByType() throws Exception {
		//获取广告id，物品类型，广告内容和ref
		StringBuilder sql=new StringBuilder()
				.append(" select aad302,aad303,aad306")
				.append(" from ad03 where aad305=?")
				.append(" order by aad304 DESC")
				.append(" limit 20");
		return this.queryForList(sql.toString(), this.get("aad305"));
		
	}
	
	/**
	 * 添加广告
	 * @return
	 * @throws Exception
	 */
	private  boolean insertAd() throws Exception {
		StringBuilder sql=new StringBuilder()
				.append(" insert into ad03(aad402,aad302,aad303,aad304,aad305,aad306)")
				.append(" values(?,?,?,?,?,?)");
		Object[] parameter=new Object[] {
				this.get("aad402"),
				Tools.getIncrementId("aad302"),
				this.get("aad303"),
				this.get("aad304"),
				this.get("aad305"),
				this.get("aad306"),
		};
		return this.executeUpdate(sql.toString(), parameter);
	}
	//添加广告的钱
	private boolean	addMoney() throws Exception {
		StringBuilder sql=new StringBuilder()
				.append(" update ad03 set")
				.append(" aad304=aad304+?")
				.append(" where aad302=?");
		return this.executeUpdate(sql.toString(),this.get("increment"),this.get("aad302") );
	}
	//减少广告的钱
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
	//-----------------关于账户的操作-----------------------------
	static final double initMin=2000;//最少的账户余额
	private boolean insertAdAccount() throws Exception{
		int idNumber=Tools.getIncrementId("aad402");
		StringBuilder sql=new StringBuilder()
				.append(" insert into ad04(aad402,aad403,aaa102)")
				.append(" value(?,?,?)");
		double initMoney= Double.parseDouble(this.get("aad403").toString());
		if (initMoney<initMin) {
			throw new Exception("初始充值不能少于"+initMin);
		}
		Object[] parameter=new Object[] {
				idNumber,
				this.get("aad403"),
				this.get("aaa102")
		};
		return this.executeUpdate(sql.toString(),parameter);
	}
	/**
	 * 通过accountid获得广告账户信息
	 * @return
	 * @throws Exception
	 */
	private Map<String, String> getAccountById() throws Exception {
		String sql="select aad403 from ad04 where aad402=?";
		return this.queryForMap(sql, this.get("aad402"));
	}
	
	
	//对账户进行充值
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
	//收取广告费，减少账户的钱
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
	
	/**
	 * 通过userid获得广告账户id
	 * @return 广告账户id或null
	 * @throws Exception 
	 */
	public String getAccountId() throws Exception {
		String sql="select aad402 from ad04 where aaa102=?";
		Map<String, String> map=this.queryForMap(sql, this.get("aaa102"));
		return map==null?null:map.get("aad402");
		
	}
	/**
	 * 
	 * @return 当前账户是否在审核
	 * @throws Exception
	 */
	public boolean isInAudit() throws Exception {
		String sql="select aad801 from ad08 where aaa102=? and aad803='ad' and aad804='01' ";
		return this.queryForMap(sql, this.get("aaa102"))==null?false:true;
	}
	
	//0无账户，1账户未审核通过，2有账户
	public int accountStatus() throws Exception {
		if (getAccountId()!=null) {
			return 2;
		}else if (isInAudit()) {
			return 1;
		}else {
			return 0;
		}
	}
	
}
