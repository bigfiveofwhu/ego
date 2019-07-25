package com.ego.services.impl;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import com.ego.services.JdbcServicesSupport;
import com.ego.system.tools.Tools;
/**
 * ������Ʒ����һϵ�з�����ʵ����
 * @author Dcz
 *
 */
public class Ab04ServicesImpl extends JdbcServicesSupport 
{

	//********************************************************************
	//                             ҵ�����
	//********************************************************************
	/**
	 * ���²�����֧���
	 */
	@Override
	public boolean update(String utype)throws Exception
	{
		if(utype.equalsIgnoreCase("comment"))
		{
			return this.comment();
		}
		
		else if(utype.equalsIgnoreCase("comment2"))
		{
			return this.comment2();
		}
		else if(utype.equalsIgnoreCase("delComment"))
		{
			return this.delComment();
		}
		else
		{
			throw new Exception("����[ Ab04ServicesImpl ]�н�����δ����ĸ��¶�������,"
								+ "����������  "+utype);
		}
	}
	/**
	 * ������ѯ������֧���
	 */
	@Override
	public List<Map<String, String>> query(String qtype)throws Exception
	{
		if(qtype.equalsIgnoreCase("allComment"))
		{
			return this.allComment();
		}
		else if(qtype.equalsIgnoreCase("point"))
		{
			return this.queryPoint();
		}
		else if(qtype.equalsIgnoreCase("queryCommentByAab203"))
		{
			return queryCommentByAab203();
		}
		else
		{
			throw new Exception("����[ Ab04ServicesImpl ]�н�����δ�����������ѯ��������,"
					+ "����������  "+qtype);
		}
	}
	
	/**
	 * ������ѯ������֧���
	 */
	@Override
	public Map<String,String> findById(String qtype)throws Exception
	{
		
		if(qtype.equalsIgnoreCase("commentDetail"))
		{
			return this.commentDetail();
		}
		else if(qtype.equalsIgnoreCase("userPoint"))
		{
			return this.totalPoint();
		}
		else if(qtype.equalsIgnoreCase("comentCountByAab203"))
		{
			return this.comentCountByAab203();
		}
		else if(qtype.equalsIgnoreCase("commentBestByAab203"))
		{
			return commentBestByAab203();
		}
		else if(qtype.equalsIgnoreCase("commentMidByAab203"))
		{
			return commentMidByAab203();
		}
		else if(qtype.equalsIgnoreCase("commentBadByAab203"))
		{
			return commentBadByAab203();
		}
		else
		{
			throw new Exception("����[ Ab04ServicesImpl ]�н�����δ����ĵ�һ��ѯ��������,"
					+ "����������  "+qtype);
		}
		
	} 

	
	//********************************************************************
	//                             ����ҵ��
	//********************************************************************
	
	/**
	 * ��ѯ�û����ֱ仯��ʷ
	 * @return
	 * @throws Exception
	 */
	private List<Map<String, String>> queryPoint()throws Exception
	{
		StringBuilder sql = new StringBuilder()
				.append("select a.aaa1003,b.fvalue,a.aaa1005,a.aaa1004")
				.append("  from aa10 a,syscode b")
				.append("  where b.fname='aaa1004' and b.fcode=a.aaa1004 ")
				.append("  and a.aaa102=? ")
				.append("  order by a.aaa1005 desc")
				;
		
		
		
		//���ò����б�
		List<Object> paramList = new ArrayList<>();
		
		paramList.add(this.get("aaa102"));

		return this.queryForList(sql.toString(),paramList.toArray());
	}
	
	/**
	 * ������Ʒid��ѯ���е�������Ϣ  ÿ����15��
	 * hug
	 * @return
	 * @throws Exception
	 */
	private List<Map<String,String>> queryCommentByAab203() throws Exception
	{
		StringBuilder sql=new StringBuilder()
				.append("select y.aaa102,y.aaa103,x.aab402,x.aab403,x.aab404,")
				.append("       x.aab405,x.aab406,x.aab407,x.aab408,x.aab409,")
				.append("       x.aab410,x.aab411,x.aab412")
				.append("  from ab04 x,aa01 y")
				.append(" where x.aaa102=y.aaa102")
				.append("   and x.aab203=?")
				.append(" limit 15")
				;
		return this.queryForList(sql.toString(), this.get("aab203"));
	}
	
	/**
	 * ��һʵ����ѯ�û���ǰʣ�����
	 * @return
	 * @throws Exception
	 */
	private Map<String,String> totalPoint()throws Exception
	{
		String sql = "select aaa106 from aa01 where aaa102=?";

		return this.queryForMap(sql.toString(), this.get("aaa102"));
	}
	
	/**
	 * ��ѯ��һ��������
	 * @return
	 * @throws Exception
	 */
	private Map<String,String> commentDetail()throws Exception
	{
		StringBuilder sql =null;
		sql = new StringBuilder()
				.append("select a.aab402,a.aab302,b.aab202,a.aab403,a.aab404,")
				.append("		a.aab405,a.aab406,a.aab407,a.aab408,a.aab409,")
				.append("       a.aab410,a.aab411,a.aab412,a.aab413,a.aab203,b.aab208")
    			.append("  from ab04 a, ab02 b")
    			.append(" where a.aab203=b.aab203") 
    			.append(" and a.aab302=?")
    			;
		System.out.println("***��ѯ��һ��������:��ʾfindById()��SQL��ѯ���****");
		System.out.println(sql.toString()+"������:"+this.get("aab302"));
		return this.queryForMap(sql.toString(), this.get("aab302"));
	}
	
	/**
	 * ��ѯ��������
	 * @return
	 * @throws Exception
	 */
	private List<Map<String, String>> allComment()throws Exception
	{
		//����SQL����
				StringBuilder sql = new StringBuilder()
						.append("select x.aab302,z.aab202,x.aab402,x.aab403,x.aab406,")
						.append("       x.aab410,x.aab412,y.aab303,z.aab208")
						.append("  from ab04 x,ab03 y,ab02 z  ")
						.append("  where x.aab302=y.aab302 ")
						.append("  and x.aab203=z.aab203 ")
						.append("  and x.aaa102=?")
						
						;
				
				
				
				//���ò����б�
				List<Object> paramList = new ArrayList<>();
				
				paramList.add(this.get("aaa102"));

		  		
		  		System.out.println("***��ʾ����������ѯSQL���***");
		  		System.out.println(sql.toString());
		  		System.out.println("***��ʾ������ѯ�����б�***");
		  		System.out.println(paramList);
		  		
		  		
		  		return this.queryForList(sql.toString(),paramList.toArray());
				
	}
	
	/**
	 * ����:������Ʒ����
	 * @return
	 * @throws Exception
	 */
	private boolean comment()throws Exception
	{
		
		//1.����SQL���
		StringBuilder sql = new StringBuilder()
				.append("insert into ab04(aab302,aaa102,aab203,aab402,aab403,")
    			.append("                 aab406,aab409,aab410,aab411,aab412,")
    			.append("                 aab413)")
    			.append("          values (?,?,?,?,?,")
    			.append("                  current_timestamp,?,?,?,?,")
    			.append("                  0)")
    			;
		//2.��д��������
		Object args[]={
				this.get("aab302"),
				this.get("aaa102"),
				this.get("aab203"),
				this.get("aab402"),
				this.get("aab403"),
				//5
				this.get("aab409"),
				this.get("aab410"),
				this.get("aab411"),
				this.get("aab412")
				//10
				
		};
		System.out.println("***�����¶���***");
		System.out.println(sql.toString());
		this.commentOnce();
		return this.executeUpdate(sql.toString(), args);
		
	}
	/**
	 * ׷��:������Ʒ����
	 * @return
	 * @throws Exception
	 */
	private boolean comment2()throws Exception
	{
		System.out.println("aab404:"+this.get("aab404"));
		System.out.println("aab302:"+this.get("aab302"));
		System.out.println("aab203:"+this.get("aab203"));
		StringBuilder sql = new StringBuilder()
				.append("update ab04 a set")
				.append("  a.aab404=?,a.aab407=current_timestamp")
				.append("  where a.aab302=? and a.aab203=?")
				;
		
		Object args[]={
				this.get("aab404"),
				this.get("aab302"),
				this.get("aab203")
		};
		
		this.commentTwice();
		return this.executeUpdate(sql.toString(), args);
	}
	
	/**
	 * ɾ������
	 * @return
	 * @throws Exception
	 */
	private boolean delComment()throws Exception
	{
		String sql = "delete from ab04 where aab302=? and aab203=? ";
		Object args[]={
				this.get("aab302"),
				this.get("aab203")
		};
		return this.executeUpdate(sql,args);
		
	}

	/**
	 * �������޸�����״̬
	 * @return
	 * @throws Exception
	 */
	private void commentOnce()throws Exception
	{
		StringBuilder sql = new StringBuilder()
				.append("update ab03 a set")
				.append("  a.aab303='06'")
				.append("  where a.aab302=?")
				;
		
		Object args[]={
				this.get("aab302")
		};
		
		//System.out.println("***��ʾ�༭����SQL���****");
		//System.out.println(sql.toString());
		this.executeUpdate(sql.toString(), args);
	}
	
	/**
	 * ׷�����޸Ķ���״̬
	 * @throws Exception
	 */
	private void commentTwice()throws Exception
	{
		StringBuilder sql = new StringBuilder()
				.append("update ab03 a set")
				.append("  a.aab303='07'")
				.append("  where a.aab302=?")
				;
		
		Object args[]={
				this.get("aab302")
		};
		
		//System.out.println("***��ʾ�༭����SQL���****");
		//System.out.println(sql.toString());
		this.executeUpdate(sql.toString(), args);
	}

	/**
	 * ͨ����Ʒid,����ۼ��ж���������
	 * hg
	 * @return
	 * @throws Exception
	 */
	private Map<String,String> comentCountByAab203() throws Exception
	{
		String sql="select count(*) as commentsum from ab04 where aab203=?";
		return this.queryForMap(sql, this.get("aab203"));
	}
	/**
	 * ��ѯ������
	 * hug
	 * @return
	 * @throws Exception
	 */
	private Map<String,String> commentBestByAab203() throws Exception
	{
		String sql="select count(*) as commentsum from ab04 where aab410>=4 and aab410<=5 and aab203=?";
		return this.queryForMap(sql, this.get("aab203"));
	}
	
	/**
	 * ��ѯ������
	 * hug
	 * @return
	 * @throws Exception
	 */
	private Map<String,String> commentMidByAab203() throws Exception
	{
		String sql="select count(*) as commentsum from ab04 where aab410>2 and aab410<4 and aab203=?";
		return this.queryForMap(sql, this.get("aab203"));
	}
	
	/**
	 * ��ѯ������
	 * hug
	 * @return
	 * @throws Exception
	 */
	private Map<String,String> commentBadByAab203() throws Exception
	{
		String sql="select count(*) as commentsum from ab04 where aab410>=0 and aab410<=2 and aab203=?";
		return this.queryForMap(sql, this.get("aab203"));
	}
}
