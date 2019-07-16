package com.ego.services.impl;

import java.sql.Date;
import java.util.Calendar;
import java.util.List;
import java.util.Map;

import com.ego.services.JdbcServicesSupport;
//用户卡券包
public class Aa05ServiceImpl extends JdbcServicesSupport{
	@Override
	public List<Map<String, String>> query() throws Exception {
		// TODO Auto-generated method stub
		StringBuilder sql=new StringBuilder()
				.append("select aaa501,aab102,aaa502,aaa503,aaa504,aaa505,aaa506")
				.append(" from aa05 where aaa102=?");
		return this.queryForList(sql.toString(), this.get("aaa102"));
	}
	
	@Override
	public boolean update(String utype) throws Exception {
		// TODO Auto-generated method stub
		switch (utype) {
		case "addUserCoupon":
			return addCoupon();
		case "useCoupon":
			return removeCoupon();
		default:
			throw new Exception("不支持的类型");
		}
	}
	
	private boolean removeCoupon()throws Exception 
	{
		String sql="delete from aa05 where aaa501 =?";
		return this.executeUpdate(sql, this.get("aaa501"));
	}
	
	private boolean addCoupon() throws Exception {
		int type=Integer.parseInt(get("aaa502").toString());
		Object[] parameter;
		Date currentDate=new Date(System.currentTimeMillis());
		int rollDay=Integer.parseInt(this.get("aab505").toString());
		Calendar calendar=Calendar.getInstance();
		calendar.setTime(currentDate);
		calendar.add(Calendar.DATE,rollDay);
		//aab504为使用条件
		switch (type) {
		case 1://无条件
			StringBuilder sql1=new StringBuilder()
			.append("insert into aa05 (aaa102,aab102,aaa502,aaa503,aaa505,aaa506)")
			.append(" value(?,?,?,?,?,?)");
			
			parameter= new Object[]{
					this.get("aaa102"),
					this.get("aab102"),
					this.get("aaa502"),
					this.get("aaa503"),
					currentDate,
					new Date(calendar.getTimeInMillis())
				};
			return this.executeUpdate(sql1.toString(), parameter);
		case 2://满减
			StringBuilder sql2=new StringBuilder()
			.append("insert into aa05")
			.append("(aaa102,aab102,aaa502,aaa503,aaa504,aaa505,aaa506)")
			.append(" value(?,?,?,?,?,?,?)");
			parameter= new Object[]{
					this.get("aaa102"),
					this.get("aab102"),
					this.get("aaa502"),
					this.get("aaa503"),
					this.get("aaa504"),
					currentDate,
					new Date(calendar.getTimeInMillis())
				};
			return this.executeUpdate(sql2.toString(), parameter);
		default:
			throw new Exception("不支持的类型");
		}
	}
}
