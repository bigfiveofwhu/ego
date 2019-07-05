package com.ego.system.db;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
//资源文件解析器
import java.util.ResourceBundle;

public class DBUtils {
	// 1.定义驱动串--描述驱动jar中,核心类的完整路径
	private static String driver = null;
	// 2.定义连接串--描述数据库的物理地址及数据库名称
	private static String url = null;
	private static String userName = null;
	private static String password = null;

	private static final ThreadLocal<java.sql.Connection> threadLocal = new ThreadLocal<>();

	/**
	 * 静态块 < 静态块的代码,在类被第一次加载入内存时候,执行一次,以后不再执行 静态块创建的对象,常驻内存,直到程序执行结束 >
	 */
	static
	{
		try
		{
			// 获取资源文件解析器对象
			ResourceBundle bundle = ResourceBundle.getBundle("DBOptions");
			// 通过解析对象,获取数据
			driver = bundle.getString("DRIVER");
			url = bundle.getString("URL");
			userName = bundle.getString("USERNAME");
			password = bundle.getString("PASSWORD");

			// 3.加载驱动
			Class.forName(driver);
		} 
		catch (ClassNotFoundException e)
		{
			e.printStackTrace();
		}
	}

	private DBUtils() 
	{
	}

	/**
	 * 获取数据库连接
	 * 
	 * @return
	 * @throws Exception
	 */
	private static Connection getConnection() throws Exception
	{
		// 获取当前线程绑定连接对象
		Connection conn = threadLocal.get();
		// 判断当前线程是否绑定了连接对象
		if (conn == null || conn.isClosed())
		{
			// 创建连接对象
			conn = DriverManager.getConnection(url, userName, password);
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
	public static PreparedStatement prepareStatement(final String sql) throws Exception
	{
		return DBUtils.getConnection().prepareStatement(sql);
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
