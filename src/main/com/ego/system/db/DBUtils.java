package com.ego.system.db;

import java.io.FileInputStream;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Properties;
//资源文件解析器

import org.apache.tomcat.dbcp.dbcp2.*;

public class DBUtils 
{
	
	private	static BasicDataSource dataSource=null;
	private static final ThreadLocal<java.sql.Connection> threadLocal = new ThreadLocal<>();
	
	/**
	 * 静态块 < 静态块的代码,在类被第一次加载入内存时候,执行一次,以后不再执行 静态块创建的对象,常驻内存,直到程序执行结束 >
	 */
	
	static 
	{
		Properties properties=new Properties();
		try {
			properties.load(new FileInputStream("src/resources/DBOptions.properties"));
			dataSource=BasicDataSourceFactory.createDataSource(properties);
		} catch (Exception e) {
			// TODO Auto-generasted catch block
			System.out.println("初始化数据库失败");
			e.printStackTrace();
		}
	}

	private DBUtils() 
	{}
	
	/**
	 * 获取数据库连接
	 * 
	 * @return
	 * @throws Exception
	 */
	public static Connection getConnection() throws SQLException
	{
		// 获取当前线程绑定连接对象
		Connection conn = threadLocal.get();
		// 判断当前线程是否绑定了连接对象
			if (conn == null || conn.isClosed())
			{
				// 创建连接对象
				conn = dataSource.getConnection();
				// 将连接对象与当前线程绑定
				threadLocal.set(conn);
			}
		
		return conn;
	}

	/**
	 * SQL语句编译方法
	 * 
	 * @param sql
	 * @return
	 * @throws Exception
	 */
	public static PreparedStatement prepareStatement(final String sql) throws SQLException
	{
		return DBUtils.getConnection().prepareStatement(sql);
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
		String sql="select * from sequence where "+ name+ " = ? ";
		
		PreparedStatement pStatement= DBUtils.getConnection().prepareStatement(sql,
				ResultSet.TYPE_FORWARD_ONLY,ResultSet.CONCUR_UPDATABLE,ResultSet.CLOSE_CURSORS_AT_COMMIT);
		pStatement.setString(1, idName);
		ResultSet set=pStatement.executeQuery();
		try
		{
			if (set.next()) {//有相应的id
				int id=set.getInt(value);
				set.updateInt(value, ++id);
				set.updateRow();
				return id;
				
			}else {//没有相应的id，则插入一个新的
				
				int startNumber=1;//定义起始的主键值
				set.moveToInsertRow();
				set.updateString(name, idName);
				set.updateInt(value, startNumber);
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
	
	
	
	
	
	// =======================以下为事务相关方法================================
	/**
	 * 开启事务
	 * 
	 * @throws Exception
	 */
	public static void beginTransaction() throws Exception 
	{
		DBUtils.getConnection().setAutoCommit(false);
	}

	/**
	 * 提交事务
	 * 
	 * @throws Exception
	 */
	public static void commit() throws Exception 
	{
		DBUtils.getConnection().commit();
	}

	/**
	 * 回滚事务
	 */
	public static void rollback() 
	{
		try 
		{
			DBUtils.getConnection().rollback();
		}
		catch (Exception e) 
		{
			try 
			{
				DBUtils.getConnection().rollback();
			}
			catch (Exception e1) 
			{
				e1.printStackTrace();
			}
			e.printStackTrace();
		}
	}

	/**
	 * 结束事务
	 */
	public static void endTransaction() 
	{
		try 
		{
			DBUtils.getConnection().setAutoCommit(true);
		} 
		catch (Exception e)
		{
			e.printStackTrace();
		}
	}


	
	
	// =======================以下为资源销毁方法================================

	public static void close(ResultSet rs) 
	{
		try
		{
			if (rs != null) // 规避NPE
			{
				rs.close();
			}
		} 
		catch (Exception ex) 
		{
			ex.printStackTrace();
		}
	}
	

	public static void close(PreparedStatement pstm)
	{
		try 
		{
			if (pstm != null) 
			{
				pstm.close();
			}
		}
		catch (Exception ex)
		{
			ex.printStackTrace();
		}
	}

	public static void close() 
	{
		try
		{
			// 1.获取当前线程绑定的连接对象
			Connection conn = threadLocal.get();
			// 2.判断连接是否需要销毁
			if (conn != null && !conn.isClosed())
			{
				System.out.println("---------Close Connection---------------------");
				// 3.解除连接与线程的绑定
				threadLocal.remove();
				// 4.连接销毁
				conn.close();
			}
		}
		catch (Exception ex) 
		{
			ex.printStackTrace();
		}
	}
}
