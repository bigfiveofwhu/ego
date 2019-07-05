package com.ego.system.tools;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.text.SimpleDateFormat;

import com.ego.system.db.DBUtils;

public class Tools 
{

	public static void main(String[] args)
	{
		try 
		{
			String aab103 = Tools.getEmpNumber();
			System.out.println(aab103);
		} 
		catch (Exception e) 
		{
			e.printStackTrace();
		}
	}

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

	/**
	 * ��ȡ����ֵ
	 * 
	 * @param pkname
	 * @return
	 * @throws Exception
	 */
	public static int getSequence(String pkname) throws Exception
	{
		PreparedStatement pstm1 = null; // ��ѯ���еĵ�ǰֵ
		PreparedStatement pstm2 = null; // �޸����еĵ�ǰֵ
		ResultSet rs = null;
		try 
		{
			// ����SQL���,��ѯ���еĵ�ǰֵ
			String sql1 = "select a.pkvalue from sequence a where a.pkname=?";
			// ����SQL1
			pstm1 = DBUtils.prepareStatement(sql1);
			// ������ֵ
			pstm1.setObject(1, pkname);
			// ִ�в�ѯ
			rs = pstm1.executeQuery();

			// �������е�ǰֵ
			int currentVal = 0;
			// �ж����ݿ���,�Ƿ���ڵ�ǰ�е�ֵ
			if (rs.next()) 
			{
				// ��ȡ���ݿ⵱ǰֵ,Ϊ���и�ֵ
				currentVal = rs.getInt(1);

				// �޸������е�ֵ,��ԭ��������+1
				String sql2 = "update sequence set pkvalue=? where pkname=?";
				pstm2 = DBUtils.prepareStatement(sql2);
				pstm2.setObject(1, ++currentVal);
				pstm2.setObject(2, pkname);
				pstm2.executeUpdate();

			} 
			else
			{
				// �����ݿ�¼�뵱ǰ����������,pkvalueֵΪ1
				String sql2 = "insert into sequence(pkname,pkvalue) values(?,?)";
				pstm2 = DBUtils.prepareStatement(sql2);
				pstm2.setObject(1, pkname);
				pstm2.setObject(2, ++currentVal);
				pstm2.executeUpdate();
			}
			return currentVal;
		} 
		finally 
		{
			DBUtils.close(rs);
			DBUtils.close(pstm1);
			DBUtils.close(pstm2);
		}
	}
}
