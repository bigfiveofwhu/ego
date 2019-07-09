package com.ego.system.tools;

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

	/**
	 * ��ȡԱ����ˮ��
	 * 
	 * @return String number="yyyy"+4λ��ˮ��
	 * @throws Exception
	 */
	public static String getEmpNumber() throws Exception
	{
		return Tools.getCurrentYear() + Tools.getFormatNumber("E");
	}

	private static final String baseCode1 = "0000";

	/**
	 * ��ȡ��ʽ����β��
	 * 
	 * @param firstName
	 * @return
	 * @throws Exception
	 */
	private static String getFormatNumber(String firstName) throws Exception 
	{
		// 1.��ȡ��ˮ��
		int lastNumber = Tools.getNumnberForYear(firstName);
		// 2.������ˮ�ŵĿ��
		int size = String.valueOf(lastNumber).length();

		return baseCode1.substring(size) + lastNumber;
	}

	/**
	 * ��ȡԱ����ŵ�β��
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
			// 1.����SQL����ѯ��ǰֵ
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
	 * ��ȡ����
	 * 
	 * @return
	 */
	private static String getCurrentYear() 
	{
		return new SimpleDateFormat("yyyy").format(new java.util.Date());
	}

	/**
	 * ���������ӳ��ַ���
	 * 
	 * @param element
	 * @return
	 */
	public static String joinArray(Object element)
	{
		// ��ֵ����
		if (element == null || element.equals("")) 
		{
			return "";
		}

		// �ж�element������ʲô?���ַ��������ַ�������
		if (element instanceof java.lang.String[]) 
		{
			// ������ת�����ַ�������
			String arr[] = (String[]) element;
			// �������鳤��
			int len = arr.length;
			// ���춯̬�ַ�������,װ�������ÿ��Ԫ��
			StringBuilder tem = new StringBuilder(arr[0]);
			// ѭ����ȡ����ĺ��Ԫ��
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

	// =======================����Ϊʵ�÷���================================
	/**
	 * ע��ÿ�ε��ö��Ὣ��Ӧֵ��һ�����Բ�Ҫֱ�ӵ��ã�Ӧ�÷��������У�������ʧ��ʱ��Ҫ�ع�
	 * 
	 * @param idName ������������
	 * @return ��������ֵ���Զ���һ
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
			if (set.next()) 
			{	//����Ӧ��id
				int id=set.getInt(value);
				set.updateInt(value, ++id);
				set.updateRow();
				return id;
				
			}else 
			{	
				//û����Ӧ��id�������һ���µ�
				int startNumber=1;//������ʼ������ֵ
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

}
