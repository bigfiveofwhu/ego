package com.ego.services.impl;

import java.util.List;
import java.util.Map;

import com.ego.services.JdbcServicesSupport;

//商家用户卡券包
public class Ab05ServiceImpl extends JdbcServicesSupport{
	@Override
	public boolean update(String utype) throws Exception {
		// TODO Auto-generated method stub
		switch (utype) {
		case "addCoupon":
			return addDiscount();
		case "delete":
			return delete();
		case "changeAmount":
			return changeAmount();
		case "decreseByOne":
			return decreseByOne();
		default:
			throw new Exception("不支持的类型");
		}
	}

	@Override
	public List<Map<String, String>> query(String qtype) throws Exception {
		// TODO Auto-generated method stub
		return query();
	}
	
	@Override
	public Map<String, String> findById(String ftype) throws Exception {
		// TODO Auto-generated method stub
		switch (ftype) {
		case "getPOV":
			return getPOV();
		case "getCoupon":
			return getCoupon();
		default:
			throw new Exception("不支持的类型");
		}
	}
	
	
	
	/**
	 * 将对应优惠券的值减一
	 * @return
	 * @throws Exception
	 */
	private boolean decreseByOne()throws Exception {
		String sql="update ab05 set aab506=aab506-1 where aab501=?";
		return this.executeUpdate(sql, this.get("aab501"));
	}
	
	private Map<String, String> getCoupon() throws Exception{
		String sql="select * from ab05 where aab501=?";
		return this.queryForMap(sql, this.get("aab501"));
	}

	private Map<String, String> getPOV() throws Exception {
		String sql="select aab505 from ab05 where aab501=?";
		return this.queryForMap(sql, this.get("aab501"));
	}
	
	public List<Map<String, String>> query() throws Exception {
		StringBuilder sql=new StringBuilder()
				.append("select aab501,aab502,aab503,aab504,aab505,aab506 ")
				.append(" from ab05 where aab102=?");
		return this.queryForList(sql.toString(), this.get("aab102"));
	}

	
	private boolean delete() throws Exception {
		StringBuilder sql=new StringBuilder()
				.append(" delete from ab05 ")
				.append(" where aab501=? ");
		return this.executeUpdate(sql.toString(), this.get("aab501"));
	}
	
	private boolean changeAmount() throws Exception {
		StringBuilder sql=new StringBuilder()
				.append(" update ab05 ")
				.append(" set aab506=?")
				.append(" where aab501=?");
		Object[] parameter=new Object[] {
			this.get("aab506"),
			this.get("aab501")
		};
		return this.executeUpdate(sql.toString(),parameter);
	}
	
	//1为无条件，2为满减
	private boolean addDiscount() throws Exception{
		
		int type=Integer.parseInt(this.get("aab502").toString());
		Object[] parameter;
		//aab504为使用条件
		switch (type) {
		case 1://无条件
			StringBuilder sql1=new StringBuilder()
			.append("insert into ab05(aab102,aab502,aab503,aab505,aab506)")  
			.append(" value(?,?,?,?,?)");
			parameter= new Object[]{
					this.get("aab102"),
					this.get("aab502"),
					this.get("aab503"),
					this.get("aab505"),
					this.get("aab506")
				};
			this.executeUpdate(sql1.toString(), parameter);
			return true;
		case 2://满减
			StringBuilder sql2=new StringBuilder()
			.append("insert into ab05(aab102,aab502,aab503,aab504,aab505,aab506)")
			.append(" value(?,?,?,?,?,?)");
			try {
				int man=Integer.parseInt(this.get("aab504").toString()) ;
				int jian=Integer.parseInt(this.get("aab503").toString()) ;
				if (man<jian) {
					throw new Exception("数字不满足要求");
				}
			} catch (NumberFormatException e) {
				// TODO: handle exception
				throw new Exception("不是合法的数字");
			}
			parameter= new Object[]{
					this.get("aab102"),
					this.get("aab502"),
					this.get("aab503"),
					this.get("aab504"),
					this.get("aab505"),
					this.get("aab506")
				};
			this.executeUpdate(sql2.toString(), parameter);
			return true;
		default:
			throw new Exception("不支持的类型");
		}
		
	}
}
