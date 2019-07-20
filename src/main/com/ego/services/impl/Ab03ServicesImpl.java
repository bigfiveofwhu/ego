package com.ego.services.impl;

import com.ego.services.JdbcServicesSupport;
import com.ego.system.tools.Tools;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;
/**
 * 关于订单一系列方法的实现类
 * @author Dcz
 * 
 */
public class Ab03ServicesImpl extends JdbcServicesSupport 
{
	
	//********************************************************************
	//                             业务入口
	//********************************************************************
	/**
	 * 更新操作分支入口
	 */
	@Override
	public boolean update(String utype)throws Exception
	{
		if(utype.equalsIgnoreCase("addOrder"))
		{
			return this.addOrder();
		}
		else if(utype.equalsIgnoreCase("addPointForOrder"))
		{
			return this.addPointForOrder();
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
	 * 单一实例查询分支入口
	 * @return
	 * @throws Exception
	 */
	@Override
	public Map<String,String> findById(String qtype)throws Exception
	{
		if(qtype.equals("pay"))
		{
			return this.queryForPay();
		}
		else if(qtype.equals("detail"))
		{
			return this.queryForDetail();
		}
		else if(qtype.equals("refund"))
		{
			return this.queryForRefund();
		}
		else
		{
			throw new Exception("ab03:未知的单一实例查询类型: "+qtype);
			
		}
	}
	
	
	/**
	 * 批量查询操作分支入口
	 * @return
	 * @throws Exception
	 */
	@Override
	public List<Map<String,String>> query(String qtype) throws Exception
	{
		if(qtype.equalsIgnoreCase("allOrder"))
		{
			return this.queryAllOrder();
		}
		else
		{
			throw new Exception("ab03:未知的批量查询类型:"+qtype);
		}
		
	}
	
	
	
	//********************************************************************
	//								具体业务
	//********************************************************************
	
	/**
	 * 批量查询所有订单
	 * @return
	 * @throws Exception
	 */
	private List<Map<String,String>> queryAllOrder()throws Exception
	{
		//定义SQL主体
		StringBuilder sql = new StringBuilder()
				.append("select x.aab203,x.aab302,x.aab303,x.aab304,x.aab305,")
				.append("       x.aab306,x.aab307,x.aab309,x.aab310,x.aab313,")
				.append("       x.aab314,y.aab202,z.aaa802")
				.append("  from ab03 x, ab02 y,aa08 z")
				.append("  where  x.aab203=y.aab203 and x.aab302=z.aab302")
				.append("  and x.aaa102=? and x.aab308='01' ")
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
	
	/**
	 * 跳转订单支付页面时的单一实例查询
	 * @return
	 * @throws Exception
	 */
	private Map<String,String> queryForPay()throws Exception
	{
		StringBuilder sql =null;
		sql = new StringBuilder()
				.append("select a.aab302,a.aab304,a.aab310,a.aab313,a.aab314")
    			.append("  from ab03 a")
    			.append(" where a.aab302=?")
    			;
		System.out.println("***为支付查询单一订单:显示findById()的SQL查询语句****");
		System.out.println(sql.toString()+"订单号:"+this.get("aab302"));
		
		return this.queryForMap(sql.toString(), this.get("aab302"));
	}
	
	/**
	 * 查看订单详情时的单一实例查询
	 * @return
	 * @throws Exception
	 */
	private Map<String,String>queryForDetail() throws Exception
	{
		StringBuilder sql =null;
		sql = new StringBuilder()
				.append("select x.aab203,x.aab302,x.aab303,x.aab304,x.aab305,")
				.append("       x.aab306,x.aab307,x.aab309,x.aab310,x.aab311,")
				.append("       x.aab313,x.aab314,y.aab202")
    			.append("  from ab03 x,ab02 y")
    			.append(" where x.aab302=?")
    			;
		System.out.println("***为详情查询单一订单:显示findById()的SQL查询语句****");
		System.out.println(sql.toString()+"订单号:"+this.get("aab302"));
		
		return this.queryForMap(sql.toString(), this.get("aab302"));
	}
	
	/**
	 * 提交售后退款申请时查询单一订单信息
	 * @return
	 * @throws Exception
	 */
	private Map<String,String>queryForRefund() throws Exception
	{
		StringBuilder sql =null;
		sql = new StringBuilder()
				.append("select y.aab202,x.aab302,x.aab310,x.aab314,x.aab305,")
				.append("		x.aab313,y.aab102,x.aab203")
    			.append("  from ab03 x,ab02 y")
    			.append(" where x.aab203=y.aab203")
    			.append(" and x.aab302=?")
    			;
		System.out.println("***为售后查询单一订单:显示findById()的SQL查询语句****");
		System.out.println(sql.toString()+"订单号:"+this.get("aab302"));
		
		return this.queryForMap(sql.toString(), this.get("aab302"));
	}
	
	/**
	 * 收货时同时修改积分历史和用户积分
	 * @return
	 * @throws Exception
	 */
	private boolean addPointForOrder()throws Exception
	{
		System.out.println("***积分变化值:"+this.getPointValueForOrder((String)this.get("aab302")));
		int pointValue=this.getPointValueForOrder((String)this.get("aab302"));
		int changeId=Tools.getSequence("aaa1002");
		
		if(pointValue>0)
		{
			//更新积分历史表
			StringBuilder sql1 = new StringBuilder()
					.append("insert into aa10(aaa102,aaa1002,aaa1003,aaa1004,aaa1005)")
	    			.append("          values (?,?,?,'01',current_timestamp)")
	    			;
			
			Object args1[]={
					this.get("aaa102"),
					changeId,
					pointValue
			};
			
			boolean b1= this.executeUpdate(sql1.toString(), args1);
			
			//更新用户积分
			StringBuilder sql2 = new StringBuilder()
					.append("update aa01 a set")
					.append("  a.aaa106=a.aaa106+?")
					.append("  where a.aaa102=?")
					;
			
			Object args2[]={
					pointValue,
					this.get("aaa102")
			};
			
			boolean b2= this.executeUpdate(sql2.toString(), args2);
			
			if(b1&&b2)
			{
				return true;
			}
			else
			{
				throw new Exception("***在收货修改积分时,两步修改出错***");
			}
		}
			
		return true;
	}
	
	/**
	 * 根据成交额获取对应积分值
	 * 10块钱1分
	 * @param orderCode
	 * @return
	 * @throws Exception
	 */
	private int getPointValueForOrder(String orderCode)throws Exception
	{
		int point =0;
		String sql = "select aab310,aab314 from ab03 where aab302=?";
		System.out.println("***订单号: "+orderCode);
		Map<String,String> orderInfo = this.queryForMap(sql,orderCode);
		System.out.println("**为了积分查出来的订单额:");
		System.out.println(orderInfo);
		if(!orderInfo.isEmpty())
		{
			point=(int)Math.floor((Integer.valueOf(orderInfo.get("aab310"))*Double.valueOf(orderInfo.get("aab314")))/10);
		}
		else
		{
			throw new Exception("***在收货修改积分时,找不到订单: "+orderCode+"! ***");
			
		}
		return point;
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

}
