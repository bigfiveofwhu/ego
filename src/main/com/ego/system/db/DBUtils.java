package com.ego.system.db;

import java.io.FileInputStream;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Properties;
//��Դ�ļ�������

import org.apache.tomcat.dbcp.dbcp2.*;

public class DBUtils 
{
	
	private	static BasicDataSource dataSource=null;
	private static final ThreadLocal<java.sql.Connection> threadLocal = new ThreadLocal<>();
	
	/**
	 * ��̬�� < ��̬��Ĵ���,���౻��һ�μ������ڴ�ʱ��,ִ��һ��,�Ժ���ִ�� ��̬�鴴���Ķ���,��פ�ڴ�,ֱ������ִ�н��� >
	 */
	
	static 
	{
		Properties properties=new Properties();
		try {
			properties.load(new FileInputStream("src/resources/DBOptions.properties"));
			dataSource=BasicDataSourceFactory.createDataSource(properties);
		} catch (Exception e) {
			// TODO Auto-generasted catch block
			System.out.println("��ʼ�����ݿ�ʧ��");
			e.printStackTrace();
		}
	}

	private DBUtils() 
	{}
	
	/**
	 * ��ȡ���ݿ�����
	 * 
	 * @return
	 * @throws Exception
	 */
	public static Connection getConnection() throws SQLException
	{
		// ��ȡ��ǰ�̰߳����Ӷ���
		Connection conn = threadLocal.get();
		// �жϵ�ǰ�߳��Ƿ�������Ӷ���
			if (conn == null || conn.isClosed())
			{
				// �������Ӷ���
				conn = dataSource.getConnection();
				// �����Ӷ����뵱ǰ�̰߳�
				threadLocal.set(conn);
			}
		
		return conn;
	}

	/**
	 * SQL�����뷽��
	 * 
	 * @param sql
	 * @return
	 * @throws Exception
	 */
	public static PreparedStatement prepareStatement(final String sql) throws SQLException
	{
		return DBUtils.getConnection().prepareStatement(sql);
	}

	
	
	
	
	
	// =======================����Ϊ������ط���================================
	/**
	 * ��������
	 * 
	 * @throws Exception
	 */
	public static void beginTransaction() throws Exception 
	{
		DBUtils.getConnection().setAutoCommit(false);
	}

	/**
	 * �ύ����
	 * 
	 * @throws Exception
	 */
	public static void commit() throws Exception 
	{
		DBUtils.getConnection().commit();
	}

	/**
	 * �ع�����
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
	 * ��������
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


	
	
	// =======================����Ϊ��Դ���ٷ���================================

	public static void close(ResultSet rs) 
	{
		try
		{
			if (rs != null) // ���NPE
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
			// 1.��ȡ��ǰ�̰߳󶨵����Ӷ���
			Connection conn = threadLocal.get();
			// 2.�ж������Ƿ���Ҫ����
			if (conn != null && !conn.isClosed())
			{
				// 3.����������̵߳İ�
				threadLocal.remove();
				// 4.��������
				conn.close();
			}
		}
		catch (Exception ex) 
		{
			ex.printStackTrace();
		}
	}
}
