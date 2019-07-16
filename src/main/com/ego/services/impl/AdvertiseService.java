package com.ego.services.impl;

import java.util.List;
import java.util.Map;

import com.ego.services.JdbcServicesSupport;
import com.ego.system.tools.Tools;

public class AdvertiseService extends JdbcServicesSupport{

	public static final String productAd="00";
	public static final String shoptAd="01";
	public static final String serviceAd="10";

	public static final String headLine="00";//��ҳ�ֲ�
	public static final String search="01";//������ǰ
	public static final String AIads="10";//����ϲ��
	public static final String homePage="11";//������Ʒ

	@Override
	public Map<String, String> findById(String qtype) throws Exception {
		// TODO Auto-generated method stub
		switch (qtype) {
		case "getAccountById":
			return this.getAccountById();
		case "getShop":
			return this.getShop();
		default:
			throw new Exception("��֧�ֵ�����");
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
			//�����ǻ�ù�����ݵķ���
		case "getTopHeadLine":
			//aad302���id�� aad303�ƹ����ͣ�aad306Ϊ����,aab205Ϊ�۸���෵��8��
			return this.getTopHeadLine();
		case "gethotProducts":
			//aad302���id��aad306Ϊ��Ʒid��aab202Ϊ��Ʒ���ƣ���෵��8��
			return this.gethotProducts();
		case "gethotShops":
			//aad302���id��aad306Ϊ����id��aab103Ϊ�������ƣ���෵��8��
			return this.gethotShops();
		case "getTargetAds":
			//aad302���id��aad306Ϊ��Ʒid��aab202Ϊ��Ʒ����,aab205Ϊ�۸���෵��8��
			return this.getTargetAds();
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
		case "addAdAudit":
			return this.addAdAudit();
		default:
			throw new Exception("��֧�ֵ�����");
		}
	}
	/**
	 * ͨ��type��ref ���ز�Ʒ������
	 * @param type ����
	 * @param ref idֵ
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
			throw new Exception("aad303���ͳ���  in advertiseController");
		}
	}
	/**
	 * ��õ�����Ϣ
	 * @return ����map
	 * @throws Exception
	 */
	private Map<String, String> getShop() throws Exception {
		String sql="select aab102,aab103 from ab01 where aaa102=?";
		return this.queryForMap(sql, this.get("aaa102"));
	}
	/**
	 * �����û�id������̵�����в�Ʒ
	 * @return ���в�Ʒ��list
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
	 * ���ݴ�����ֵ
	 * @param aad305
	 * @return
	 * @throws Exception
	 */
	public String getAdType(String aad305) throws Exception {		
		switch (aad305) {
		case headLine:
			return "��ҳ�ֲ�";
		case search:
			return "������ǰ";
		case AIads:
			return "����ϲ��";
		case homePage:
			return "������Ʒ";
		default:
			throw new Exception("δ֪�Ĺ�����ͣ�in advertiseService");
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
				.append(" select aad301,aad302,aad303,aad304,aad305,aad306,aad307")
				.append(" from ad03 where aad402=?");
		
		return this.queryForList(sql.toString(),this.get("aad402") );
	}
	
	private List<Map<String, String>> getAdByType() throws Exception {
		//��ȡ���id����Ʒ���ͣ�������ݺ�ref
		StringBuilder sql=new StringBuilder()
				.append(" select aad302,aad303,aad306")
				.append(" from ad03 where aad305=?")
				.append(" order by aad304 DESC")
				.append(" limit 20");
		return this.queryForList(sql.toString(), this.get("aad305"));
		
	}
	
	/**
	 * ��ӹ��
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
	//-----------------�����˻��Ĳ���-----------------------------
	static final double initMin=2000;//���ٵ��˻����
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
	/**
	 * ͨ��accountid��ù���˻���Ϣ
	 * @return
	 * @throws Exception
	 */
	private Map<String, String> getAccountById() throws Exception {
		String sql="select aad403 from ad04 where aad402=?";
		return this.queryForMap(sql, this.get("aad402"));
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
	
	/**
	 * ͨ��userid��ù���˻�id
	 * @return ����˻�id��null
	 * @throws Exception 
	 */
	public String getAccountId() throws Exception {
		String sql="select aad402 from ad04 where aaa102=?";
		Map<String, String> map=this.queryForMap(sql, this.get("aaa102"));
		return map==null?null:map.get("aad402");
		
	}
	/**
	 * 
	 * @return ��ǰ�˻��Ƿ������
	 * @throws Exception
	 */
	public boolean isInAudit() throws Exception {
		String sql="select aad801 from ad08 where aaa102=? and aad803='ad' and aad804='01' ";
		return this.queryForMap(sql, this.get("aaa102"))==null?false:true;
	}
	
	//0���˻���1�˻�δ���ͨ����2���˻�
	public int accountStatus() throws Exception {
		if (getAccountId()!=null) {
			return 2;
		}else if (isInAudit()) {
			return 1;
		}else {
			return 0;
		}
	}
	/***************************************************************
	 *                                                  ���ڹ��չʾ�Ĳ���
	 *************************************************************/
	
	/**
	 * �����ҳ�ֲ���top5
	 * @return aad302���id�� aad303�ƹ����ͣ�aad306Ϊ���ã���෵��8��
	 * @throws Exception 
	 */
	public List<Map<String, String>> getTopHeadLine() throws Exception {
		StringBuilder sql=new StringBuilder()
				.append(" select aad302,aad303,aad306 from ad03")
				.append(" where aad303="+headLine)
				.append(" order by aad304 DESC ")
				.append(" limit 5");
		return this.queryForList(sql.toString());
	}
	
	/**
	 * ���������Ʒ����
	 * @return aad302���id��aad306Ϊ��Ʒid��aab202Ϊ��Ʒ���ƣ���෵��8��
	 * @throws Exception
	 */
	public List<Map<String, String>> gethotProducts()throws Exception {
		StringBuilder sql=new StringBuilder()
				.append(" select aad302,aad306,aab202,aab205 from ad03 join ab02")
				.append(" on ad03.aad306 = ab02.aab203")
				.append(" where aad305=").append(homePage)
				.append(" and aad303=").append(productAd)
				.append(" order by aad304 DESC ")
				.append(" limit 8");
		return this.queryForList(sql.toString());
	}
	
	/**
	 * �����������
	 * @return aad302���id��aad306Ϊ����id��aab103Ϊ�������ƣ���෵��8��
	 * @throws Exception
	 */
	public List<Map<String, String>> gethotShops()throws Exception {
		StringBuilder sql=new StringBuilder()
				.append(" select aad302,aad306,aab103 from ad03 join ab01")
				.append(" on ad03.aad306 = ab01.aab102")
				.append(" where aad305=").append(homePage)
				.append(" and aad303=").append(shoptAd)
				.append(" order by aad304 DESC ")
				.append(" limit 8");
		return this.queryForList(sql.toString());
	}
	
	/**
	 * ����û��Ķ�����
	 * @return aad302���id��aad306Ϊ��Ʒid��aab202Ϊ��Ʒ����,��෵��8��
	 * @throws Exception
	 */
	public List<Map<String, String>> getTargetAds()throws Exception{
		StringBuilder sql=new StringBuilder()
				.append(" select aad302,aad306,aab202,aab205 from ad03 join ab02")
				.append(" on ad03.aad306 = ab02.aab203")//ref������Ʒid
				.append(" where aad305=").append(homePage)
				.append(" and aad303=").append(shoptAd)
				.append(" and aab204 in (select * from (select aaa902 from aa09")//��Ʒ������������
				.append(" where aaa102=? order by aaa903 limit 3)as t)")
				.append(" order by aad304 DESC ")
				.append(" limit 8");
		return this.queryForList(sql.toString(),this.get("aaa102"));
	}
	
	
}
