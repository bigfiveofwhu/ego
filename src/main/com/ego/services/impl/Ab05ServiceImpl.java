package com.ego.services.impl;

import com.ego.services.JdbcServicesSupport;

public class Ab05ServiceImpl extends JdbcServicesSupport{
		
	String errorMessage = null ;
	
	@Override
	public boolean update(String utype) throws Exception {
		// TODO Auto-generated method stub
		switch (utype) {
		case "addDiscount":
			return addDiscount();
		default:
			throw new Exception("不支持的类型");
		}
	}
	
	private boolean addDiscount() throws Exception{
		StringBuilder sql1=new StringBuilder()
			.append("insert into ab05(aab102,aab203,aab502,aab503,aab505)")  
			.append("value(?,?,?,?,?)");
		StringBuilder sql2=new StringBuilder()
			.append("insert into ab05(aab102,aab203,aab502,aab503,aab504,aab505)")
			.append("value(?,?,?,?,?,?)");
		int type=Integer.parseInt((String)this.get("aab502"));
		Object[] parameter;
		switch (type) {
		case 1://满减
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
					this.get("aab203"),
					this.get("aab502"),
					this.get("aab503"),
					this.get("aab504"),
					this.get("aab505"),
				};
			this.executeUpdate(sql1.toString(), parameter);
			return true;
		case 2:
			parameter= new Object[]{
					this.get("aab102"),
					this.get("aab203"),
					this.get("aab502"),
					this.get("aab503"),
					this.get("aab505"),
				};
			this.executeUpdate(sql2.toString(), parameter);
			return true;
		default:
			throw new Exception("不支持的类型");
		}
		
	}
}
