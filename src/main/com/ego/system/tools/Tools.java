package com.ego.system.tools;

import java.security.MessageDigest;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.Map;

import com.ego.system.db.DBUtils;

public class Tools 
{
	private Tools()
	{
	}
	
	public static void main(String[] args) {
		try 
		{
			/**
			 * MD5���λ�������
			 */
			//�õ�����
			String pwd="123456";
			String md45pwd2=Tools.getMd5(pwd);
			System.out.println(md45pwd2+"   "+md45pwd2.length());
		}
		catch (Exception e) 
		{
			e.printStackTrace();
		}
	}
	/***************************************************************************
	 *                    MD5Begin
	 ***************************************************************************/
	
	
	   public static String getMd5(Object pwd)throws Exception
	   {
			/**
			 * MD5���λ�������
			 */
			//���ԭʼ����
			String md5pwd1=Tools.MD5Encode(pwd);
			//���ɻ�������
			String pwd2=md5pwd1+"�����ե㥥�����ɦ������ը㡦��������:�ԟo�ˤϤ�����èبר�Ŧؤ������з�,�ԟo��Ƨާ�٧��ޞ�����"+md5pwd1;
			String md5pwd2=Tools.MD5Encode(pwd2);
			return md5pwd2;

	   }
	
	   
	    private final static String[] hexDigits = {
		     "0", "1", "2", "3", "4", "5", "6", "7",
		     "8", "9", "a", "b", "c", "d", "e", "f"
		     };

		  /**
		   * ת���ֽ�����Ϊ16�����ִ�
		   * @param b �ֽ�����
		   * @return 16�����ִ�
		   */
		  private static String byteArrayToHexString(byte[] b)
		  {
		      StringBuffer resultSb = new StringBuffer();
		      for (int i = 0; i < b.length; i++)
		      {
		         resultSb.append(byteToHexString(b[i]));
		      }
		      return resultSb.toString();
		  }
		  /**
		   * ת���ֽ�Ϊ16�����ַ���
		   * @param b byte
		   * @return String
		   */
		  private static String byteToHexString(byte b)
		  {
		      int n = b;
		      if (n < 0)
		         n = 256 + n;
		      int d1 = n / 16;
		      int d2 = n % 16;
		      return hexDigits[d1] + hexDigits[d2];
		  }
		  /**
		   * �õ�MD5����������
		   * @param origin String
		   * @throws Exception
		   * @return String
		   */
		  private static String MD5Encode(Object origin) throws Exception
		  {
		       String resultString = null;
		       try
		       {
		           resultString=new String(origin.toString());
		           MessageDigest md = MessageDigest.getInstance("MD5");
		           resultString=byteArrayToHexString(md.digest(resultString.getBytes()));
		           return resultString;
		       }
		       catch (Exception ex)
		       {
		          throw ex;
		       }
		  }	
	/***************************************************************************
	 *                    MD5End
	 ***************************************************************************/
	
	
	
	//==============================����Ϊ�����Ż�ȡ�Լ����ۺŻ�ȡ����(dcz)=======================
	private static final String baseCode2="00000";

	/**
	 * ��ȡ��Ʒ������yyyyMMddxxxxx
	 * @return
	 * @throws Exception
	 */
	public static String getOrderNumber() throws Exception
	{
		return Tools.getCurrentDay()+Tools.getFormatTailNumber("aab302code");
	}
	
	/**
	 * ��ȡ���񶩵���yyyyMMddxxxxx
	 * @return
	 * @throws Exception
	 */
	public static String getServiceOrderNumber() throws Exception
	{
		return Tools.getCurrentDay()+Tools.getFormatTailNumber("aac402");
	}

	/**
	 * ��ȡ��ʽ���Ķ���β��
	 * @param firstName
	 * @return
	 * @throws Exception
	 */
	private static String getFormatTailNumber(String firstName)throws Exception
	{
		//��ȡ��ˮ��
		int lastNumber = Tools.getNumberForDay(firstName);
		//������ˮ�ſ��
		int size = String.valueOf(lastNumber).length();
		
		//substring���ԽضϺ�߲���sizeλ�����ַ���
		return baseCode2.substring(size)+lastNumber;
	}
	
	
	/**
	 * ��ȡ������ŵ�β��
	 * @param firstName  --ָsequence���е�������
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
			//1.����SQL����ѯ��ǰ��������ֵ
			StringBuilder sql1 = new StringBuilder()
					.append("select pkvalue from sequence a ")
					//.append("where date_format(a.sdate,'%Y')=date_format(current_date,'%Y') ")
					.append(" where a.sdate=current_date")
					.append(" and a.pkname = ? ")
					;
			System.out.println(sql1.toString());
			//��ֵ����
			
			pstm1 = DBUtils.prepareStatement(sql1.toString());
			pstm1.setObject(1, firstName);
			//System.out.println(sql1.toString());
			rs = pstm1.executeQuery();
			int currentVal=0;
			
			StringBuilder sql2 = new StringBuilder();
			if(rs.next())
			{
				//���ڸ�����ֵ
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
	 * ��ȡ��λ����yyyyMMdd
	 * @return
	 */
	private static String getCurrentDay()
	{
		return new SimpleDateFormat("yyyyMMdd").format(new java.util.Date());
	}
	
	/**
	 * ��ȡ��ǰʱ��
	 * @return
	 */
	public static String getCurrentTime()
	{
		return new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new java.util.Date());
	}
	/**
	 * ��ȡ����id
	 * @return
	 * @throws Exception
	 */
	public static String getCommentId() throws Exception
	{
		return String.valueOf(Tools.getSequence("aab402code"));
	}
	
	/**
	 * ��ȡ����ֵ
	 * @param pkname
	 * @return
	 * @throws Exception
	 */
	public static int getSequence(String pkname)throws Exception
	{
		//��ѯ���еĵ�ǰֵ
		PreparedStatement pstm1 = null;
		//�޸����еĵ�ǰֵ
		PreparedStatement pstm2 = null;
		//���ڲ�ѯ��������
		ResultSet rs = null;
		
		try 
		{
			//����SQL���,��ѯ��ǰ���е�ֵ
			StringBuilder sql1 = new StringBuilder()
					.append("select a.pkvalue from sequence a where a.pkname=?")
					//.append("and date_format(a.sdate,'%Y')=data_format(current_date,'%Y')")
					;
			//����SQL���
			pstm1 = DBUtils.prepareStatement(sql1.toString());
			//������ֵ
			pstm1.setObject(1, pkname);
			//ִ�в�ѯ
			rs = pstm1.executeQuery();
			
			//�������е�ǰֵ
			int currentVal = 0;
			if(rs.next())
			{
				//��ȡ���ݿ⵱ǰֵ,Ϊ���и�ֵ
				currentVal = rs.getInt(1);
				//�޸����ݿ⵱ǰֵ,��ԭ��+1
				String sql2 = "update sequence set pkvalue=? where pkname=?";
				pstm2 = DBUtils.prepareStatement(sql2);
				pstm2.setObject(1, ++currentVal);
				pstm2.setObject(2, pkname);
				
			}
			else
			{
				//������ݿ��в����ڵ�ǰ������,ֱ��¼�뵱ǰ��������,pkvalue��Ϊ1
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
	
	
	
	
	//================����ΪԭԱ����Ĵ����޸Ĳ���====================================
	private static final String baseCode1 = "0000";
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
	/**
	 * ��ȡ��ʽ����Ա��β��
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
		String date="sdate";
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
				set.updateDate(date, new Date(System.currentTimeMillis()));
				set.updateRow();
				return id;
				
			}else 
			{	
				//û����Ӧ��id�������һ���µ�
				int startNumber=1;//������ʼ������ֵ
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
	
	public static String getparentCode(String code,String name,String sortName) throws SQLException {
		String sql="select pfcode from syscode where fcode=? and fname=? and fvalue = ?";
		PreparedStatement pstm=DBUtils.getConnection().prepareStatement(sql);
		pstm.setObject(1, code);
		pstm.setObject(2, name);
		pstm.setObject(3, sortName);
		ResultSet result=pstm.executeQuery();
		result.next();
		return result.getString("pfcode");
	}
	
	private static String getSortName(String sortCode) throws Exception
	{
		String sql ="select fvalue from syscode where fcode=?";
		
		PreparedStatement pstm = DBUtils.getConnection().prepareStatement(sql);
		
		pstm.setObject(1, sortCode);
		
		ResultSet rs = pstm.executeQuery();
		 
		rs.next();
		 
		return rs.getString("fvalue");
	}
	
	/**
	 * �����������
	 * @param TriCode
	 * @return
	 * @throws Exception 
	 */
	public static String getTriSort(String TriCode) throws Exception 
	{
		String sort_3 = Tools.getSortName(TriCode);
		String SecCode = Tools.getparentCode(TriCode, "aab204", sort_3);
		String sort_2 = Tools.getSortName(SecCode);
		String FirCode = Tools.getparentCode(SecCode, "aab204", sort_2);
		String sort_1 = Tools.getSortName(FirCode);
		
		String cnaab204 = sort_1 + "-" + sort_2 + "-" + sort_3;
		
		return cnaab204;
	}
	/**
	 * ��ȡwebContent���Ե�ַ
	 * @return
	 */
	public static String getWebPath()
	{
		 String t=Thread.currentThread().getContextClassLoader().getResource("").getPath(); 
    	// System.out.println(t);
    	 int num=t.indexOf(".metadata");
    	 String path = null;
    	 if(num>1)
    	     path=t.substring(1,num).replace('/', '\\')+"ego\\WebContent\\";
    	 else
    		 path="./WebContent/";//û�취
    	 //return path;
    	 return "./WebContent/";
	}
	
	public static String getImgPath()
	{
		return Tools.getWebPath()+"images/upload";
	}
	
	/**
	 * ��ȡ������Ʒ���� ������
	 * ���۱�:ab04
	 * @return
	 * @throws Exception
	 */
	public static Double getProductAvg(String aab102) throws Exception
	{
		String sql = "select avg(aab410) as productAvg from ab04 a,ab02 b where b.aab203= a.aab203 and b.aab102= ?";
        
		PreparedStatement pstm = DBUtils.getConnection().prepareStatement(sql);
		
		pstm.setObject(1, aab102);
		
		ResultSet rs = pstm.executeQuery();
		 
		rs.next();
		 
		return rs.getDouble("proDuctAvg");
	}
	
	/**
	 * �������� ������
	 * @return
	 * @throws Exception
	 */
	public static Double getServiceAvg(String aab102) throws Exception
	{

        String sql = "select avg(aab411) as productAvg from ab04 a,ab02 b where b.aab203= a.aab203 and b.aab102= ?";
        
		PreparedStatement pstm = DBUtils.getConnection().prepareStatement(sql);
		
		pstm.setObject(1, aab102);
		
		ResultSet rs = pstm.executeQuery();
		 
		rs.next();
		 
		return rs.getDouble("proDuctAvg");
	}
	
	/**
	 * �������� ������
	 * @return
	 * @throws Exception
	 */
	public static Double getShipAvg(String aab102) throws Exception
	{

        String sql = "select avg(aab409) as productAvg from ab04 a,ab02 b where b.aab203= a.aab203 and b.aab102= ?";
        
		PreparedStatement pstm = DBUtils.getConnection().prepareStatement(sql);
		
		pstm.setObject(1, aab102);
		
		ResultSet rs = pstm.executeQuery();
		 
		rs.next();
		 
		return rs.getDouble("proDuctAvg");
	}
	

}
