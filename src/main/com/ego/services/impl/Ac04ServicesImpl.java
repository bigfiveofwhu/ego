package com.ego.services.impl;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import com.ego.services.JdbcServicesSupport;
import com.ego.system.tools.Tools;

public class Ac04ServicesImpl extends JdbcServicesSupport 
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
		if(utype.equalsIgnoreCase("postNeed"))
		{
			return false;
		}
		else if(utype.equalsIgnoreCase("checkService"))
		{
			return this.checkService();
		}
		else
		{
			throw new Exception("����[ Ac04ServicesImpl ]�н�����δ����Ķ�������,"
								+ "����������  "+utype);
		}
	}
	
	/**
	 * ��һʵ����ѯ��֧���
	 * @return
	 * @throws Exception
	 */
	@Override
	public Map<String,String> findById(String qtype)throws Exception
	{
		if(qtype.equals("serviceOrderDetail"))
		{
			return this.serviceOrderDetail();
		}
		if(qtype.equals("comment"))
		{
			return this.queryForComment();
		}
		else if(qtype.equalsIgnoreCase("countLastSell"))
		{
			return countLastSell();
		}
		else if(qtype.equalsIgnoreCase("countAllSell"))
		{
			return countAllSell();
		}
		else
		{
			throw new Exception("ac04:δ֪�ĵ�һʵ����ѯ����: "+qtype);
			
		}
	}
	
	
	/**
	 * ������ѯ������֧���
	 * @return
	 * @throws Exception
	 */
	@Override
	public List<Map<String,String>> query(String qtype) throws Exception
	{
		if(qtype.equalsIgnoreCase("allServiceOrder"))
		{
			return this.allServiceOrder();
		}
		else
		{
			throw new Exception("ac04:δ֪��������ѯ����:"+qtype);
		}
		
	}
	
	
	
	//********************************************************************
	//								����ҵ��
	//********************************************************************
	
	
	/**
	 * ȷ�Ϸ����깤
	 * @return
	 * @throws Exception
	 */
	private boolean checkService()throws Exception
	{
		StringBuilder sql = new StringBuilder()
				.append("update ac04 a set")
				.append("  a.aac405=current_timestamp, a.aac408='02'")
				.append("  where a.aac402=?")
				;
		
		Object args[]={
				this.get("aac402")
		};
		boolean b= this.addPointForService();
		System.out.println("���񶩵�������ӻ���״̬:"+b);
		
		return this.executeUpdate(sql.toString(), args);
	}
	
	/**
	 * ���񶩵�������ӻ���
	 * @return
	 * @throws Exception
	 */
	private boolean addPointForService()throws Exception
	{
		System.out.println("***���ֱ仯ֵ:"+this.getPointValueForService((String)this.get("aac402")));
		int pointValue=this.getPointValueForService((String)this.get("aac402"));
		int changeId=Tools.getSequence("aaa1002");
		
		if(pointValue>0)
		{
			//���»�����ʷ��
			StringBuilder sql1 = new StringBuilder()
					.append("insert into aa10(aaa102,aaa1002,aaa1003,aaa1004,aaa1005)")
	    			.append("          values (?,?,?,'02',current_timestamp)")
	    			;
			
			Object args1[]={
					this.get("aaa102"),
					changeId,
					pointValue
			};
			
			boolean b1= this.executeUpdate(sql1.toString(), args1);
			
			//�����û�����
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
				throw new Exception("***��ȷ�Ϸ����޸Ļ���ʱ,�����޸ĳ���***");
			}
		}
			
		return true;
	}
	
	/**
	 * ��ȡ���񶩵��Ļ���ֵ
	 * @param orderCode
	 * @return
	 * @throws Exception
	 */
	private int getPointValueForService(String orderCode)throws Exception
	{
		int point =0;
		String sql = "select aac407 from ac04 where aac402=?";
		System.out.println("***������: "+orderCode);
		Map<String,String> orderInfo = this.queryForMap(sql,orderCode);
		System.out.println("**Ϊ�˻��ֲ�����ķ����:");
		System.out.println(orderInfo);
		if(!orderInfo.isEmpty())
		{
			point=(int)Math.floor( Double.valueOf(orderInfo.get("aac407"))/10 );
		}
		else
		{
			throw new Exception("***���ջ��޸Ļ���ʱ,�Ҳ�������: "+orderCode+"! ***");
			
		}
		return point;
	}
	
	/**
	 * ��ѯ���񶩵�����
	 * @return
	 * @throws Exception
	 */
	private Map<String,String>serviceOrderDetail() throws Exception
	{
		StringBuilder sql =null;
		sql = new StringBuilder()
				.append("select x.aac402,x.aac403,x.aac404,x.aac405,x.aac406,")
				.append("       x.aac407,x.aac408,x.aac409,x.aac410,x.aac411,")
				.append("       y.aac103,z.fvalue type")
    			.append("  from ac04 x,ac01 y,syscode z")
    			.append(" where x.aac410=z.fcode and z.fname='aac106'")
    			.append(" and   x.aac102=y.aac102 and x.aac402=?")
    			;
		System.out.println("***���񶩵����鵥һ:��ʾfindById()��SQL��ѯ���****");
		System.out.println(sql.toString()+"������:"+this.get("aac402"));
		
		return this.queryForMap(sql.toString(), this.get("aac402"));
	}
	
	/**
	 * Ϊ���۽����ѯ������Ϣ
	 * @return
	 * @throws Exception
	 */
	private Map<String,String>queryForComment() throws Exception
	{
		StringBuilder sql =null;
		sql = new StringBuilder()
				.append("select y.aac103,x.aac402,x.aac407,x.aac410,z.fvalue type")
    			.append("  from ac04 x,ac01 y,syscode z")
    			.append(" where x.aac410=z.fcode and z.fname='aac106' ")
    			.append(" and  x.aac102=y.aac102 and x.aac402=?")
    			;

		
		return this.queryForMap(sql.toString(), this.get("aac402"));
	}
	
	/**
	 * ��ѯ���з��񶩵�
	 * @return
	 * @throws Exception
	 */
	private List<Map<String,String>> allServiceOrder()throws Exception
	{
		//����SQL����
		StringBuilder sql = new StringBuilder()
				.append("select x.aac402,x.aac403,x.aac406,x.aac407,x.aac408,")
				.append("       z.fvalue,x.aac412,x.aac202,x.aac602,y.aac103")
				.append("  from ac04 x, ac01 y,syscode z")
				.append("  where x.aac410=z.fcode and z.fname='aac106' ")
				.append("    and x.aac102=y.aac102 and x.aaa102=? ")
				;
		

		
  		System.out.println("***��ʾ���񶩵�������ѯSQL���***");
  		System.out.println(sql.toString());
  		
  		return this.queryForList(sql.toString(),this.get("aaa102"));
	}
	/**
	 * ���ݷ���id������������  ���ɽ�ʱ�����
	 * hug
	 * @return
	 * @throws Exception
	 */
	private Map<String,String> countLastSell() throws Exception
	{
		String sql="select count(*) lastsell from ac04 where aac202=? and PERIOD_DIFF(date_format(NOW( ),'%Y%m'),date_format(aac405,'%Y%m'))=1";
		return this.queryForMap(sql, this.get("aac202"));
	}
	/**
	 * ���ݷ���id�����ۻ�����
	 * hug
	 * @return
	 * @throws Exception
	 */
	private Map<String,String> countAllSell() throws Exception
	{
		String sql="select count(*) allsell from ac04 where aac202=?";
		return this.queryForMap(sql, this.get("aac202"));
	}
}
