package com.ego.system.tools;

import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;

import com.ego.system.db.DBUtils;

public class Tools 
{
	private Tools()
	{
	}
	
	
	//==============================以下为订单号获取以及评论号获取部分(dcz)=======================
	private static final String baseCode2="00000";

	/**
	 * 获取商品订单号yyyyMMddxxxxx
	 * @return
	 * @throws Exception
	 */
	public static String getOrderNumber() throws Exception
	{
		return Tools.getCurrentDay()+Tools.getFormatTailNumber("aab302code");
	}
	
	/**
	 * 获取服务订单号yyyyMMddxxxxx
	 * @return
	 * @throws Exception
	 */
	public static String getServiceOrderNumber() throws Exception
	{
		return Tools.getCurrentDay()+Tools.getFormatTailNumber("aac402");
	}

	/**
	 * 获取格式化的订单尾号
	 * @param firstName
	 * @return
	 * @throws Exception
	 */
	private static String getFormatTailNumber(String firstName)throws Exception
	{
		//获取流水号
		int lastNumber = Tools.getNumberForDay(firstName);
		//计算流水号宽度
		int size = String.valueOf(lastNumber).length();
		
		//substring可以截断后边部分size位数的字符串
		return baseCode2.substring(size)+lastNumber;
	}
	
	
	/**
	 * 获取订单编号的尾码
	 * @param firstName  --指sequence表中的主键名
	 * @return
	 * @throws Exception
	 */
	private static int getNumberForDay(String firstName)throws Exception
	{
		PreparedStatement pstm1 = null;
		PreparedStatement pstm2 = null;
		ResultSet rs = null;
		try 
		{
			//1.定义SQL语句查询当前主键自增值
			StringBuilder sql1 = new StringBuilder()
					.append("select pkvalue from sequence a ")
					//.append("where date_format(a.sdate,'%Y')=date_format(current_date,'%Y') ")
					.append(" where a.sdate=current_date")
					.append(" and a.pkname = ? ")
					;
			System.out.println(sql1.toString());
			//赋值参数
			
			pstm1 = DBUtils.prepareStatement(sql1.toString());
			pstm1.setObject(1, firstName);
			//System.out.println(sql1.toString());
			rs = pstm1.executeQuery();
			int currentVal=0;
			
			StringBuilder sql2 = new StringBuilder();
			if(rs.next())
			{
				//存在该自增值
				currentVal = rs.getInt(1);
				sql2.append("update sequence a ")
					.append("set a.pkvalue=? ")
					//.append("where date_format(a.sdate,'%Y')=date_format(current_date,'%Y') ")
					.append(" where a.sdate=current_date")
					.append(" and a.pkname = ?")
					;
				
			}
			else
			{
				sql2.append("insert into sequence")
				.append("( pkvalue,pkname,sdate)")
				.append(" values (?,?,current_date)")
				;
			}
			pstm2=DBUtils.prepareStatement(sql2.toString());
			pstm2.setObject(1, ++currentVal);
			pstm2.setObject(2, firstName);
			//System.out.println(sql2.toString());
			pstm2.executeUpdate();
			
			return currentVal;
			
		} 
		finally
		{
			DBUtils.close(rs);
			DBUtils.close(pstm1);
			DBUtils.close(pstm2);
		}
	}
	
	/**
	 * 获取八位日码yyyyMMdd
	 * @return
	 */
	private static String getCurrentDay()
	{
		return new SimpleDateFormat("yyyyMMdd").format(new java.util.Date());
	}
	
	/**
	 * 获取评论id
	 * @return
	 * @throws Exception
	 */
	public static String getCommentId() throws Exception
	{
		return String.valueOf(Tools.getSequence("aab402code"));
	}
	
	/**
	 * 获取主键值
	 * @param pkname
	 * @return
	 * @throws Exception
	 */
	public static int getSequence(String pkname)throws Exception
	{
		//查询序列的当前值
		PreparedStatement pstm1 = null;
		//修改序列的当前值
		PreparedStatement pstm2 = null;
		//用于查询检查的容器
		ResultSet rs = null;
		
		try 
		{
			//定义SQL语句,查询当前序列的值
			StringBuilder sql1 = new StringBuilder()
					.append("select a.pkvalue from sequence a where a.pkname=?")
					//.append("and date_format(a.sdate,'%Y')=data_format(current_date,'%Y')")
					;
			//编译SQL语句
			pstm1 = DBUtils.prepareStatement(sql1.toString());
			//参数赋值
			pstm1.setObject(1, pkname);
			//执行查询
			rs = pstm1.executeQuery();
			
			//定义序列当前值
			int currentVal = 0;
			if(rs.next())
			{
				//读取数据库当前值,为序列赋值
				currentVal = rs.getInt(1);
				//修改数据库当前值,比原来+1
				String sql2 = "update sequence set pkvalue=? where pkname=?";
				pstm2 = DBUtils.prepareStatement(sql2);
				pstm2.setObject(1, ++currentVal);
				pstm2.setObject(2, pkname);
				
			}
			else
			{
				//如果数据库中不存在当前的主键,直接录入当前主键数据,pkvalue设为1
				String sql2 = "insert into sequence(pkname,pkvalue) values(?,?)";
				pstm2 = DBUtils.prepareStatement(sql2);
				pstm2.setObject(1,pkname);
				pstm2.setObject(2, ++currentVal);
			}
			pstm2.executeUpdate();
			return currentVal;
			
		}
		finally
		{
			DBUtils.close(rs);
			DBUtils.close(pstm1);
			DBUtils.close(pstm2);
		}
	}
	
	
	
	
	//================以下为原员工表的代码修改部分====================================
	private static final String baseCode1 = "0000";
	/**
	 * 获取员工流水号
	 * 
	 * @return String number="yyyy"+4位流水码
	 * @throws Exception
	 */
	public static String getEmpNumber() throws Exception
	{
		return Tools.getCurrentYear() + Tools.getFormatNumber("E");
	}
	/**
	 * 获取格式化的员工尾码
	 * 
	 * @param firstName
	 * @return
	 * @throws Exception
	 */
	private static String getFormatNumber(String firstName) throws Exception 
	{
		// 1.获取流水号
		int lastNumber = Tools.getNumnberForYear(firstName);
		// 2.计算流水号的宽度
		int size = String.valueOf(lastNumber).length();

		return baseCode1.substring(size) + lastNumber;
	}

	/**
	 * 获取员工编号的尾码
	 * 
	 * @param firstName
	 * @return
	 * @throws Exception
	 */
	private static int getNumnberForYear(String firstName) throws Exception 
	{
		PreparedStatement pstm1 = null;
		PreparedStatement pstm2 = null;
		ResultSet rs = null;
		try {
			// 1.定义SQL语句查询当前值
			StringBuilder sql1 = new StringBuilder().append("select a.pkvalue ").append("  from sequence a ")
					.append("  where date_format(a.sdate,'%Y')=date_format(current_date,'%Y')")
					.append("    and a.pkname=?");
			pstm1 = DBUtils.prepareStatement(sql1.toString());
			pstm1.setObject(1, firstName);
			rs = pstm1.executeQuery();

			int currentVal = 0;
			StringBuilder sql2 = new StringBuilder();
			if (rs.next()) 
			{
				currentVal = rs.getInt(1);
				sql2.append("update sequence ").append("   set pkvalue=?")
						.append(" where date_format(sdate,'%Y')=date_format(current_date,'%Y')")
						.append("   and pkname=?");
			} 
			else
			{
				sql2.append("insert into sequence(pkvalue,pkname,sdate)")
						.append("              values(?,?,current_date)");
			}
			pstm2 = DBUtils.prepareStatement(sql2.toString());
			pstm2.setObject(1, ++currentVal);
			pstm2.setObject(2, firstName);
			pstm2.executeUpdate();

			return currentVal;
		}
		finally 
		{
			DBUtils.close(rs);
			DBUtils.close(pstm2);
			DBUtils.close(pstm1);
		}
	}

	/**
	 * 获取年码
	 * 
	 * @return
	 */
	private static String getCurrentYear() 
	{
		return new SimpleDateFormat("yyyy").format(new java.util.Date());
	}

	/**
	 * 将数组连接成字符串
	 * 
	 * @param element
	 * @return
	 */
	public static String joinArray(Object element)
	{
		// 空值拦截
		if (element == null || element.equals("")) 
		{
			return "";
		}

		// 判断element到底是什么?是字符串还是字符串数组
		if (element instanceof java.lang.String[]) 
		{
			// 将参数转换成字符串数组
			String arr[] = (String[]) element;
			// 计算数组长度
			int len = arr.length;
			// 构造动态字符串对象,装载数组的每个元素
			StringBuilder tem = new StringBuilder(arr[0]);
			// 循环读取数组的后继元素
			for (int i = 1; i < len; i++)
			{
				tem.append(",").append(arr[i]);
			}
			return tem.toString();
		} 
		else
		{
			return element.toString();
		}
	}

	// =======================以下为实用方法================================
	/**
	 * 注意每次调用都会将相应值加一，所以不要直接调用，应该放在事务中，当插入失败时需要回滚
	 * 
	 * @param idName 自增键的名字
	 * @return 自增键的值，自动加一
	 * @throws SQLException
	 */
	public static int getIncrementId(String idName) throws SQLException 
	{
		String name="pkname";
		String value="pkvalue";
		String date="sdate";
		String sql="select * from sequence where "+ name+ " = ? ";
		
		PreparedStatement pStatement= DBUtils.getConnection().prepareStatement(sql,
				ResultSet.TYPE_FORWARD_ONLY,ResultSet.CONCUR_UPDATABLE,ResultSet.CLOSE_CURSORS_AT_COMMIT);
		pStatement.setString(1, idName);
		ResultSet set=pStatement.executeQuery();
		try
		{
			if (set.next()) 
			{	//有相应的id
				int id=set.getInt(value);
				set.updateInt(value, ++id);
				set.updateDate(date, new Date(System.currentTimeMillis()));
				set.updateRow();
				return id;
				
			}else 
			{	
				//没有相应的id，则插入一个新的
				int startNumber=1;//定义起始的主键值
				set.moveToInsertRow();
				set.updateString(name, idName);
				set.updateInt(value, startNumber);
				set.updateDate(date, new Date(System.currentTimeMillis()));
				set.insertRow();
				return startNumber;
			}
		}
		finally 
		{
			DBUtils.close(pStatement);
			DBUtils.close(set);
		}
	}

	
	public static int changeInt(Object obj) {
		 return Integer.parseInt(obj.toString());
	}
	
	public static double changeDouble(Object obj) {
		return Double.parseDouble(obj.toString());
	}
	
	public static String getparentCode(String code,String name) throws SQLException {
		String sql="select pfcode from syscode where fcode=? and fname=?";
		PreparedStatement pstm=DBUtils.getConnection().prepareStatement(sql);
		pstm.setObject(1, code);
		pstm.setObject(2, name);
		ResultSet result=pstm.executeQuery();
		result.next();
		return result.getString("pfcode");
	}
}
