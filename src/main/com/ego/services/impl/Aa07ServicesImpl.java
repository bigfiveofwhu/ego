package com.ego.services.impl;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import com.ego.services.JdbcServicesSupport;

public class Aa07ServicesImpl extends JdbcServicesSupport 
{
	//***********************************************************
	//					ҵ�����
	//***********************************************************
	
	/**
	 * ������ѯ��֧���
	 */
	@Override
	public List<Map<String,String>> query(String qtype) throws Exception
	{
		if(qtype.equalsIgnoreCase("history"))
		{
			return this.queryAllHistory();
		}
		else
		{
			throw new Exception("ab03:δ֪��������ѯ����:"+qtype);
		}
		
	}
	
	/**
	 * ������Ϊ��֧���
	 */
	@Override
	public boolean update(String utype) throws Exception
	{
		if(utype.equalsIgnoreCase("delHistory"))
		{
			return this.delHistory();
		}
		else
		{
			throw new Exception("ab03:δ֪�ĸ�������:"+utype);
		}
		
	}
	
	
	
	//***********************************************************
	//					����ҵ��
	//***********************************************************
	
	private boolean delHistory()throws Exception
	{
		String sql = "delete from aa07 where aaa701=?";
		return this.executeUpdate(sql, this.get("aaa701"));
	}
	
	/**
	 * ������ѯ��ʷ��¼
	 * @return
	 */
	private List<Map<String,String>> queryAllHistory()throws Exception
	{
		//����SQL����
		StringBuilder sql = new StringBuilder()
				.append("select a.aaa701,b.aab202,a.aaa702,a.aaa704,b.aab205,")
				.append("       b.aab212,b.aab203,b.aab204")
				.append("  from aa07 a, ab02 b ")
				.append("  where a.aab203=b.aab203 ")
				.append("  and a.aaa704='01' ")
				.append("  and a.aaa102=? ")
				;
		
		//���ò����б�
		List<Object> paramList = new ArrayList<>();
		
		paramList.add(this.get("aaa102"));
  		System.out.println("***��ʾ��ʷ��¼������ѯSQL���***");
  		System.out.println(sql.toString());
  		System.out.println("***��ʾ��ʷ��¼��ѯ�����б�***");
  		System.out.println(paramList);
  		
  		return this.queryForList(sql.toString(),this.get("aaa102"));
	}
	
}
