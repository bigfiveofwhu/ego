package com.ego.services.impl;

import java.util.List;
import java.util.Map;

import com.ego.services.JdbcServicesSupport;

/**
 * ab01:���̱�
 * ab02:��Ʒ��
 * ac01:�����̱�
 * ac02:�����
 * ad08:��˱�
 * @author zyf
 */
public class Ad08ServicesImpl extends JdbcServicesSupport 
{
	@Override
	public List<Map<String, String>> query(String qtyep) throws Exception 
	{
		if(qtyep.equalsIgnoreCase("queryAd08"))
			return this.queryAd08();
		throw new Exception("δ֧�ֵ�qtyep: "+qtyep);
	}
	
	@Override
	public Map<String, String> findById(String ftype) throws Exception
	{
		if(ftype.equalsIgnoreCase("findAb01ById"))
			return this.findAb01ById();
		if(ftype.equalsIgnoreCase("findAb02ById"))
			return this.findAb02ById();
		if(ftype.equalsIgnoreCase("findAc01ById"))
			return this.findAc01ById();
		if(ftype.equalsIgnoreCase("findAc02ById"))
			return this.findAc02ById();
		throw new Exception("δ֧�ֵ�ftype: "+ftype);
	}
	
	@Override
	public boolean update(String utype) throws Exception 
	{
		if(utype.equalsIgnoreCase("modifyAb01"))
			this.modifyAb01();
		else if(utype.equalsIgnoreCase("modifyAb02"))
			this.modifyAb02();
		else if(utype.equalsIgnoreCase("modifyAc01"))
			this.modifyAc01();
		else if(utype.equalsIgnoreCase("modifyAc02"))
			this.modifyAc02();
		else 
			return (boolean)this.getMethod(utype).invoke(this);
		
		return this.modifyAd08();
	}
	
	/**
	 * ���ݵ���id��ѯ���������ص���ϸ��Ϣ
	 * @return
	 * @throws Exception
	 */
	private Map<String, String> findAb01ById() throws Exception 
	{
		StringBuilder sql=new StringBuilder()
				.append("SELECT aab102,aab103,aab105,aab106,s1.fvalue cnaab107,")
				.append("	    aab108,a.aaa102,aaa103,aaa104,aaa105,")
				.append("	    aaa106,aaa108,aaa109,aad802,aad801,")
				.append("	    c.aad102,aad104,s2.fvalue cnaad804,aad806")
				.append("  FROM aa01 a,ab01 b,ad01 c,ad08 d,syscode s1,syscode s2")
				.append(" WHERE a.aaa102=b.aaa102 AND d.aad803='01' AND d.aad805=b.aab102")
				.append("   AND c.aad102=d.aad102 AND s1.fcode=aab107 AND s1.fname='aab107'")
				.append("   AND s2.fcode=aad804 AND s2.fname='aad804' AND aab102=?")
				;
		Object[] args = { 
				this.get("aab102")
		};
		return this.queryForMap(sql.toString(), args);
	}
	
	/**
	 * ������Ʒid��ѯ��Ʒ�����ص���ϸ��Ϣ
	 * @return
	 * @throws Exception
	 */
	private Map<String, String> findAb02ById() throws Exception 
	{
		StringBuilder sql=new StringBuilder()
				.append("SELECT a.aab102,aab103,aab104,aab105,aab106,")
				.append("	    aab108,aab109,aab110,aab111,aab202,")
				.append("	    aab203,s3.fvalue cnaab204,aab205,aab206,aab207,")
				.append("	    aab208,aab209,aab211,s1.fvalue cnaab212,aad802,")
				.append("	    aad801,c.aad102,aad104,s2.fvalue cnaad804,aad806")
				.append("  FROM ab02 a,ab01 b,ad01 c,ad08 d,syscode s1,syscode s2,syscode s3")
				.append(" WHERE a.aab102=b.aab102 AND d.aad803='02' AND d.aad805=a.aab203")
				.append("   AND c.aad102=d.aad102 AND s1.fcode=aab212 AND s1.fname='aab212'")
				.append("   AND s2.fcode=aad804 AND s2.fname='aad804' AND s3.fcode=aab204")
				.append("   AND s3.fname='aab204' AND aab203=?")
				;
		Object[] args = { 
				this.get("aab203")
		};
		return this.queryForMap(sql.toString(), args);
	}
	
	/**
	 * ���ݷ�����id��ѯ�����������ص���ϸ��Ϣ
	 * @return
	 * @throws Exception
	 */
	private Map<String, String> findAc01ById() throws Exception 
	{
		StringBuilder sql=new StringBuilder()
				.append("SELECT aac102,aac103,aac104,aac105,s3.fvalue cnaac106,")
				.append("	    aac107,s1.fvalue cnaac108,aac109,a.aaa102,aaa103,")
				.append("	    aaa104,aaa105,aaa106,aaa108,aaa109,")
				.append("	    aad802,aad801,c.aad102,aad104,s2.fvalue cnaad804,")
				.append("	    aad806")
				.append("  FROM aa01 a,ac01 b,ad01 c,ad08 d,syscode s1,syscode s2,syscode s3")
				.append(" WHERE a.aaa102=b.aaa102 AND d.aad803='03' AND d.aad805=b.aac102 ")
				.append("   AND c.aad102=d.aad102 AND s1.fcode=aac108 AND s1.fname='aac108'")
				.append("   AND s2.fcode=aad804 AND s2.fname='aad804' AND s3.fcode=aac106 ")
				.append("   AND s3.fname='aac106' AND aac102=?")
				;
		Object[] args = { 
				this.get("aac102")
		};
		return this.queryForMap(sql.toString(), args);
	}
	
	/**
	 * ���ݷ���id��ѯ���������ص���ϸ��Ϣ
	 * @return
	 * @throws Exception
	 */
	private Map<String, String> findAc02ById() throws Exception 
	{
		StringBuilder sql=new StringBuilder()
				.append("SELECT a.aac102,aac103,aac104,aac105,s3.fvalue cnaac106,")
				.append("	    aac107,aac109,aac110,aac202,aac203,")
				.append("	    s1.fvalue cnaac204,s4.fvalue cnaac205,aac206,aac207,s5.fvalue cnaac208,")
				.append("	    aad802,aad801,c.aad102,aad104,s2.fvalue cnaad804,")
				.append("	    aad806")
				.append("  FROM ac02 a,ac01 b,ad01 c,ad08 d,syscode s1,syscode s2,syscode s3,syscode s4,syscode s5")
				.append(" WHERE a.aac102=b.aac102 AND d.aad803='04' AND d.aad805=a.aac202 ")
				.append("   AND c.aad102=d.aad102 AND s1.fcode=aac204 AND s1.fname='aac204'")
				.append("   AND s2.fcode=aad804 AND s2.fname='aad804' AND s3.fcode=aac106")
				.append("   AND s3.fname='aac106' AND s4.fcode=aac205 AND s4.fname='aac205'")
				.append("   AND s5.fcode=aac208 AND s5.fname='aac208' AND aac202=?")
				;
		Object[] args = { 
				this.get("aac202")
		};
		return this.queryForMap(sql.toString(), args);
	}
	
	/**
	 * ��ѯ��ǰ����Ա����˼�¼
	 * @return
	 * @throws Exception
	 */
	private List<Map<String, String>> queryAd08() throws Exception 
	{
		StringBuilder sql=new StringBuilder()
				.append("  SELECT aad801,aaa102,aad802,aad803,")
				.append("		  aad804,aad805,aad104,aad806")
				.append("	 FROM ad01,ad08")
				.append("   WHERE ad01.aad102=? AND ad08.aad102=?")
				;
		Object[] args = { 
				this.get("aad102"),
				this.get("aad102")
		};
		return this.queryForList(sql.toString(), args);
	}


	/**
	 * aad802 --�������  aad803 --������� , aad804 --���״̬, aad805 --��˶���, aaa102 --�û�id
	 * ����������ݾ���ͨ���÷�������
	 * @author hug
	 * @return
	 * @throws Exception
	 */
	private boolean insertAd08() throws Exception
	{
		String sql="insert into ad08(aad802,aad803,aad804,aad805,aaa102) values(?,?,'01',?,?)";
		Object args[]= {
				this.get("aad802"),
				this.get("aad803"),
				this.get("aad805"),
				this.get("aaa102")
		};
		return this.executeUpdate(sql, args);
	}
	
	/**
	 * �޸ĵ���״̬�������µ�sql����������������˱�ͬʱ����
	 * @throws Exception
	 */
	private void modifyAb01()throws Exception
    {
    	StringBuilder sql=new StringBuilder()
    			.append("UPDATE ab01")
    			.append("   SET aab107=?")
    			.append(" WHERE aab102=?")
    			;
    	Object args[]={
    			this.get("aab107"),
    			this.get("aab102")
    	};
    	this.apppendSql(sql.toString(), args);
    }
	
	/**
	 * �޸���Ʒ״̬�������µ�sql����������������˱�ͬʱ����
	 * @throws Exception
	 */
	private void modifyAb02()throws Exception
    {
    	StringBuilder sql=new StringBuilder()
    			.append("UPDATE ab02")
    			.append("   SET aab212=?")
    			.append(" WHERE aab203=?")
    			;
    	Object args[]={
    			this.get("aab212"),
    			this.get("aab203")
    	};
    	this.apppendSql(sql.toString(), args);
    }
	
	/**
	 * �޸ķ�����״̬�������µ�sql����������������˱�ͬʱ����
	 * @throws Exception
	 */
	private void modifyAc01()throws Exception
    {
    	StringBuilder sql=new StringBuilder()
    			.append("UPDATE ac01")
    			.append("   SET aac108=?")
    			.append(" WHERE aac102=?")
    			;
    	Object args[]={
    			this.get("aac108"),
    			this.get("aac102")
    	};
    	this.apppendSql(sql.toString(), args);
    }
	
	/**
	 * �޸ķ���״̬�������µ�sql����������������˱�ͬʱ����
	 * @throws Exception
	 */
	private void modifyAc02()throws Exception
    {
    	StringBuilder sql=new StringBuilder()
    			.append("UPDATE ac02")
    			.append("   SET aac208=?")
    			.append(" WHERE aac202=?")
    			;
    	Object args[]={
    			this.get("aac208"),
    			this.get("aac202")
    	};
    	this.apppendSql(sql.toString(), args);
    }
	
	/**
	 * �޸���˱�״̬��ͬʱ���¶�Ӧ�ı�
	 * @return
	 * @throws Exception
	 */
	private boolean modifyAd08()throws Exception
    {
    	StringBuilder sql=new StringBuilder()
    			.append("UPDATE ad08")
    			.append("   SET aad804=? , aad102=? , aad806=CURRENT_TIMESTAMP")
    			.append(" WHERE aad801=?")
    			;
    	Object args[]={
    			this.get("aad804"),
    			this.get("aad102"),//session��
    			this.get("aad801")
    	};
    	this.apppendSql(sql.toString(), args);
    	return this.executeTransaction();
    }
}
