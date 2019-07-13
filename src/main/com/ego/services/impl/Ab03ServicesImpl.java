package com.ego.services.impl;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import com.ego.services.JdbcServicesSupport;
import com.ego.system.tools.Tools;

public class Ab03ServicesImpl extends JdbcServicesSupport 
{
	@Override
	public boolean update(String utype)throws Exception
	{
		if(utype.equalsIgnoreCase("addOrder"))
		{
			return this.addOrder();
		}
		else if(utype.equalsIgnoreCase("delById"))
		{
			return this.deleteById();
		}
		else if(utype.equalsIgnoreCase("payOrder"))
		{
			return this.payOrder();
		}
		else if(utype.equalsIgnoreCase("batchDelete"))
		{
			return this.batchDelete();
		}
		else if(utype.equalsIgnoreCase("recieveOrder"))
		{
			return this.recieveOrder();
		}
		else
		{
			throw new Exception("在类[ Ab03ServicesImpl ]中进行了未定义的动作调用,"
								+ "动作名称是  "+utype);
		}
		
	}
	
	/**
	 * 根据订单号删除某订单
	 * @return
	 * @throws Exception
	 */
	private boolean deleteById()throws Exception
	{
		String sql = "delete from ab03 where aab302=?";
		return this.executeUpdate(sql, this.get("aab302"));
	}

	
	/**
	 * 确认收货
	 * @return
	 * @throws Exception
	 */
	private boolean recieveOrder()throws Exception
	{
		StringBuilder sql = new StringBuilder()
				.append("update ab03 a set")
				.append("  a.aab303='05', a.aab307=current_timestamp")
				.append("  where a.aab302=?")
				;
		
		Object args[]={
				this.get("aab302")
		};
		
		//System.out.println("***显示编辑更新SQL语句****");
		//System.out.println(sql.toString());
		return this.executeUpdate(sql.toString(), args);
	}
	
	/**
	 * 支付编辑订单
	 * @return
	 * @throws Exception
	 */
	private boolean payOrder()throws Exception
	{
		StringBuilder sql = new StringBuilder()
				.append("update ab03 a set")
				.append("  a.aab303='02', a.aab305=current_timestamp,a.aab311=?,a.aab312=?")
				.append("  where a.aab302=?")
				;
		
		Object args[]={
				this.get("aab311"),
				this.get("aab312"),
				this.get("aab302")
		};
		
		//System.out.println("***显示编辑更新SQL语句****");
		//System.out.println(sql.toString());
		return this.executeUpdate(sql.toString(), args);
	}
	
	
	/**
	 * 批量删除勾选的员工信息
	 * @return
	 * @throws Exception
	 */
	private boolean batchDelete() throws Exception
	{
		//定义SQL语句
		String sql="delete from ab01 where aab101=?";
		//获取页面idList数组
		String idList[] = this.getIdList("idlist");
		//执行
		return this.batchUpdate(sql,idList);
	}
	/**
	 * 增加订单
	 * @return
	 * @throws Exception
	 */
	private boolean addOrder()throws Exception
	{
		//获取订单编号
		String aab302 =Tools.getOrderNumber();
		this.put("aab302", aab302);
		//1.创建SQL语句
		StringBuilder sql = new StringBuilder()
				.append("insert into ab03(aaa102,aab203,aab302,aab303,aab304,")
    			.append("                 aab308,aab310,aab311,aab313,aab314)")
    			.append("          values (?,?,?,?,current_timestamp,")
    			.append("                  ?,?,?,?,?)")
    			;
		//2.编写参数数组
		Object args[]={
				this.get("aaa102"),
				this.get("aab203"),
				aab302,
				"01",
				//5
				"01",
				this.get("aab310"),
				"收货地址:待定",
				"0",
				this.get("aab314")//10
		};
		System.out.println("***生成新订单***");
		System.out.println(sql.toString());
		
		return this.executeUpdate(sql.toString(), args);
		
	}
	
	
	
	
	//*******************************************
	//查询操作
	//********************************************

	/**
	 * 根据id查找单个订单
	 * @return
	 * @throws Exception
	 */
	@Override
	public Map<String,String> findById(String fType)throws Exception
	{
		//1.分情况编写SQL
		StringBuilder sql =null;
		if(fType.equals("pay"))
		{
			sql = new StringBuilder()
					.append("select a.aab302,a.aab304,a.aab310,a.aab313,a.aab314")
	    			.append("  from ab03 a")
	    			.append(" where a.aab302=?")
	    			;
			System.out.println("***为支付查询单一订单:显示findById()的SQL查询语句****");
			System.out.println(sql.toString()+"订单号:"+this.get("aab302"));
		}
		else if(fType.equals("detail"))
		{
			sql = new StringBuilder()
					.append("select x.aab203,x.aab302,x.aab303,x.aab304,x.aab305,")
					.append("       x.aab306,x.aab307,x.aab309,x.aab310,x.aab311,")
					.append("       x.aab313,x.aab314")
	    			.append("  from ab03 x")
	    			.append(" where x.aab302=?")
	    			;
			System.out.println("***为详情查询单一订单:显示findById()的SQL查询语句****");
			System.out.println(sql.toString()+"订单号:"+this.get("aab302"));
		}
		else
		{
			System.out.println("***提示:未知的单一实例查询类型: "+fType+" ****");
			
		}
		
		//执行查询
		return this.queryForMap(sql.toString(), this.get("aab302"));
	}
	
	
	/**
	 * 批量查询订单
	 * 实现按用户id查询
	 * @return
	 * @throws Exception
	 */
	public List<Map<String,String>> query(String qtype) throws Exception
	{
		
		//定义SQL主体
		StringBuilder sql = new StringBuilder()
				.append("select x.aab203,x.aab302,x.aab303,x.aab304,x.aab305,")
				.append("       x.aab306,x.aab307,x.aab309,x.aab310,x.aab313,")
				.append("       x.aab314")
				.append("  from ab03 x ")
				.append("  where x.aaa102=? and x.aab308='01' ")
				//.append("  and x.aab107=b.fcode and b.fname='aab107'")
				;
		
		
		
		//设置参数列表
		List<Object> paramList = new ArrayList<>();
		
		paramList.add(this.get("aaa102"));

  		
  		System.out.println("***显示订单条件查询SQL语句***");
  		System.out.println(sql.toString());
  		System.out.println("***显示订单查询参数列表***");
  		System.out.println(paramList);
  		
  		return this.queryForList(sql.toString(),paramList.toArray());
	}
}
