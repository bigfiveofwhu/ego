package com.ego.services.impl;

import java.text.SimpleDateFormat;
import java.util.Date;
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
		case "getShop":
			return this.getShop();
		case "getAdById":
			return this.getAdById();
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
		case "getProducts":
			return this.getProducts();
		case "getServices":
			return this.getServices();
			//下面是获得广告数据的方法
		case "getTopHeadLine":
			//aad302广告id， aad303推广类型，aad306为引用,aab205为价格，最多返回8个
			return this.getTopHeadLine();
		case "gethotProducts":
			//aad302广告id，aad306为商品id，aab202为商品名称，最多返回8个
			return this.gethotProducts();
		case "gethotShops":
			//aad302广告id，aad306为店铺id，aab103为店铺名称，最多返回8个
			return this.gethotShops();
		case "getTargetAds":
			//aad302广告id，aad306为商品id，aab202为商品名称,aab205为价格最多返回8个
			return this.getTargetAds();
		case "getSerachTop":
			return getSearchTop();
		case "getSearchTopByKey":
			return getSearchTopByKey();
		case "getSameProducts":
			return getSameProducts();
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
		case "recharge"://给账户充值
			return this.recharge();
		case "chargeMoney"://减少账户的钱
			return this.chargeMoney();
		case "insertAd":
			return this.insertAd();
		case "addMoney"://给广告充值
			return this.addMoney();
		case "reduceMoney"://减少广告的钱
			return this.reduceMoney();
		case "addAdAudit":
			return this.addAdAudit();
		case "retractAd":
			return this.retractAd();
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
			return this.queryForMap(sqlShop, ref).get("aab103");
		default:
			throw new Exception("aad303类型出错  in advertiseController");
		}
	}
	/**
	 * 获得店铺信息
	 * @return 店铺map
	 * @throws Exception
	 */
	private Map<String, String> getShop() throws Exception {
		String sql="select aab102,aab103 from ab01 where aaa102=?";
		return this.queryForMap(sql, this.get("aaa102"));
	}
	/**
	 * 根据用户id获得他商店的所有产品
	 * @return 所有产品的list
	 * @throws Exception
	 */
	private List<Map<String, String>> getProducts() throws Exception {
		StringBuilder sql=new StringBuilder()
				.append(" select aab202,aab203 ")
				.append(" from ab02 join ab01")
				.append(" on ab02.aab102=ab01.aab102")
				.append(" where ab01.aaa102=?");
		return this.queryForList(sql.toString(), this.get("aaa102"));
	}
	
	private List<Map<String, String>> getServices()throws Exception {
		StringBuilder sql=new StringBuilder()
				.append(" select aac202,aac203 ")
				.append(" from ac02 join ac01")
				.append(" on ac02.aac102=ac01.aac102")
				.append(" where ac01.aaa102=?");
		return this.queryForList(sql.toString(), this.get("aaa102"));
	}
	/**
	 * 根据id删除广告
	 * @return
	 * @throws Exception
	 */
	private boolean retractAd()throws Exception {
		String sql="delete from ad03 where aad302=?";
		return this.executeUpdate(sql, this.get("aad302"));
	}
	
	/**
	 * 根据代码获得值
	 * @param aad305
	 * @return
	 * @throws Exception
	 */
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
	
	/**
	 * 
	 * @return
	 * @throws Exception
	 */
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
				.append(" select aad301,aad302,aad303,aad304,aad305,aad306,aad307")
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
				.append(" insert into ad03(aad402,aad302,aad303,aad304,aad305,aad306,aad307)")
				.append(" values(?,?,?,?,?,?,?)");
		
		Object[] parameter=new Object[] {
				this.get("aad402"),
				this.get("aad302"),
				this.get("aad303"),
				this.get("aad304"),
				this.get("aad305"),
				this.get("aad306"),
				this.get("aad307")
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
	/**
	 * 添加账户，需要一个用户id
	 * @return
	 * @throws Exception
	 */
	private boolean insertAdAccount() throws Exception{
		int idNumber=Tools.getIncrementId("aad402");
		StringBuilder sql=new StringBuilder()
				.append(" insert into ad04(aad402,aad403,aaa102)")
				.append(" value(?,0,?)");
		Object[] parameter=new Object[] {
				idNumber,
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
	
	
	/**
	 * 对账户进行充值，需要increment参数
	 * @return
	 * @throws Exception
	 */
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
	/**
	 * 减少广告账户的钱，需要dto中存放decrement
	 * @return 
	 * @throws Exception
	 */
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
	/**前提是该用户还没有广告账户
	 * 获取aaa102用户的账户审核状态，当未通过时显示还有几天解封
	 * @return  01表示未审核，03表示审核未通过，00表示还没有申请
	 * @throws Exception
	 */
	public String getAuditStatus() throws Exception {
		//获取是否还未审核
		String sql="select aad804 from ad08 where aaa102=? and aad803='ad' and aad804='01' and aad102=0" ;
		StringBuilder sql2=new StringBuilder()
				.append(" select aad806 from ad08 where aaa102=? and ")
				.append(" aad803='ad' and aad804='03'")
				.append(" order by aad806 DESC");
		if (this.queryForMap(sql, this.get("aaa102"))!=null) {
			return "01";//提交了申请还没审核
		}else {
			Map<String, String> map=this.queryForMap(sql2.toString(), this.get("aaa102"));
			if (map==null) {//如果没有否决记录，则说明未申请过广告账户
				return "00";
			}
			//获得管理员否决的日期
			Date date=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").parse(map.get("aad806"));
			Date current=new Date();
			long dayDif=(current.getTime()-date.getTime())/(1000*3600*24);
			if (dayDif>=10) {//已经过了冷冻期
				return "00";
			}else {//还在冷冻期
				dto.put("frozenDay", 10-dayDif);
				return "03";
			}
		}
	}
	
//	//0无账户，1账户未审核通过，2有账户
//	public int accountStatus(String ss) throws Exception {
//		if (getAccountId()!=null) {
//			return 2;
//		}else if (isInAudit()) {
//			return 1;
//		}else {
//			return 0;
//		}
//	}
	/***************************************************************
	 *                                                  关于广告展示的操作
	 *************************************************************/
	
	/**
	 * 获得首页轮播的top5
	 * @return aad302广告id， aad303推广类型，aad306为引用，最多返回8个
	 * @throws Exception 
	 */
	public List<Map<String, String>> getTopHeadLine() throws Exception {
		StringBuilder sql=new StringBuilder()
				.append(" select aad302,aad303,aad306,aad307 from ad03")
				.append(" where aad305=?")
				.append(" order by aad304 DESC ")
				.append(" limit 5");
		return this.queryForList(sql.toString(),headLine);
	}
	
	/**
	 * 获得热门商品排名
	 * @return aad302广告id，aad306为商品id，aab202为商品名称，最多返回8个
	 * @throws Exception
	 */
	public List<Map<String, String>> gethotProducts()throws Exception {
		StringBuilder sql=new StringBuilder()
				.append(" select aad302,aad306,aad307,aab202,aab203,aab205 from ad03 join ab02")
				.append(" on ad03.aad306 = ab02.aab203")
				.append(" where aad305=?")//11
				.append(" and aad303=?")//00
				.append(" order by aad304 DESC ")
				.append(" limit 8");
		return this.queryForList(sql.toString(),homePage,productAd);
	}
	
	/**
	 * 获得热门商铺
	 * @return aad302广告id，aad306为店铺id，aab103为店铺名称，最多返回8个
	 * @throws Exception
	 */
	public List<Map<String, String>> gethotShops()throws Exception {
		StringBuilder sql=new StringBuilder()
				.append(" select aad302,aad306,aad307,aab103 from ad03 join ab01")
				.append(" on ad03.aad306 = ab01.aab102")
				.append(" where aad305=?")
				.append(" and aad303=?")
				.append(" order by aad304 DESC ")
				.append(" limit 8");
		return this.queryForList(sql.toString(),homePage,shoptAd);
	}
	
	/**
	 * 通过类型获得广告，需要传递productType
	 * @return
	 * @throws Exception
	 */
	public List<Map<String, String>> getSearchTop()throws Exception {
		StringBuilder sql=new StringBuilder()
				.append(" select aad302,aab202,aab203,aab205,aab206,aab208 from ad03 join ab02")
				.append(" on ad03.aad306 = ab02.aab203")
				.append(" where aad305=?")//11
				.append(" and aad303=?")//00
				.append(" and aab204=?")
				.append(" order by aad304 DESC ")
				.append(" limit 3");
		return this.queryForList(sql.toString(),search,productAd,this.get("productType"));
	}
	
	/**
	 * 根据productType从广告里获取同类商品
	 * @return
	 * @throws Exception
	 */
	private List<Map<String, String>> getSameProducts()throws Exception {
		StringBuilder sql=new StringBuilder()
				.append(" select aad302,aab202,aab203,aab205,aab206,aab208 from ad03 join ab02")
				.append(" on ad03.aad306 = ab02.aab203")
				.append(" where aad305=?")//11
				.append(" and aad303=?")//00
				.append(" and aab204=?")
				.append(" order by aad304 DESC ")
				.append(" limit 8");
		return this.queryForList(sql.toString(),search,productAd,this.get("productType"));
	}
	
	/**
	 * 通过类型获得广告，需要传递productType
	 * @return
	 * @throws Exception
	 */
	public List<Map<String, String>> getSearchTopByKey()throws Exception {
		StringBuilder sql=new StringBuilder()
				.append(" select aad302,aab202,aab203,aab205,aab206,aab208 from ad03 join ab02")
				.append(" on ad03.aad306 = ab02.aab203")
				.append(" where aad305=?")//11
				.append(" and aad303=?")//00
				.append(" and aab202 like ?")
				.append(" order by aad304 DESC ")
				.append(" limit 3");
		return this.queryForList(sql.toString(),search,productAd,this.get("key"));
	}
	
	
	/**
	 * 获得用户的定向广告
	 * @return aad302广告id，aad306为商品id，aab202为商品名称,最多返回8个
	 * @throws Exception
	 */
	public List<Map<String, String>> getTargetAds()throws Exception{
		StringBuilder sql=new StringBuilder()
				.append(" select aad302,aad306,aad307,aab202,aab205 from ad03 join ab02")
				.append(" on ad03.aad306 = ab02.aab203")//ref等于商品id
				.append(" where aad305=?")
				.append(" and aad303=?")
				.append(" and aab204 in (select * from (select aaa902 from aa09")//商品类型满足条件
				.append(" where aaa102=? order by aaa903 limit 3)as t)")
				.append(" order by aad304 DESC ")
				.append(" limit 4");
		return this.queryForList(sql.toString(),AIads,shoptAd,this.get("aaa102"));
	}
}
