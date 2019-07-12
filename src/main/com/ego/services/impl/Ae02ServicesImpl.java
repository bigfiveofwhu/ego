package com.ego.services.impl;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import com.ego.services.JdbcServicesSupport;

/**
 * 
 * Ϊwebsocket����ṩdao�㣬�ƹ�BaseServlet������������dto��ͨ��websocket��˽�������
 * 
 * ����1��1�����¼
 * ae02:�����¼��
 * 
 * aae201:��ˮ��
 * aae202:������
 * aae203:������
 * aae204:����ʱ��
 * aae205:����
 * aae206:״̬  0-δ�� 1-�Ѷ�
 */
public class Ae02ServicesImpl extends JdbcServicesSupport
{
	/**
	 * ���������¼
	 * @param dto
	 * @return
	 * @throws Exception
	 */
	public boolean addAe02(Map<String, Object> dto) throws Exception
	{
		StringBuilder sql = new StringBuilder()
				.append("INSERT INTO ae02 (aae202,aae203,aae204,aae205,aae206)")
				.append("     VALUES (?,?,?,?,?)")
				;
		Object[] args = { 
				dto.get("from"), 
				dto.get("to"),
				dto.get("date"),
				dto.get("content"),
				dto.get("state")
				};
		return this.executeUpdate(sql.toString(), args);
	}
	
	public boolean delAe02(Map<String, Object> dto) throws Exception
	{
		String sql = "DELETE FROM ae02 WHERE aae202=? AND aae203=?";
		Object[] args = { 
				dto.get("from"), 
				dto.get("to")
				};
		return this.executeUpdate(sql, args);
	}
	
	/**
	 * ��ѯδ����Ϣ
	 * @param dto
	 * @return
	 * @throws Exception
	 */
	public List<Map<String, String>> queryAe02(Map<String, Object> dto) throws Exception
	{
		StringBuilder sql=new StringBuilder()
				.append("SELECT aae201,aae202,aae203,aae204,aae205")
				.append("  FROM ae02") 
				.append(" WHERE aae203=? AND aae206=0");
		List<Object> paramList=new ArrayList<>();
		paramList.add(dto.get("to"));
		if(isNotNull(dto.get("from"))) 
		{
			sql.append(" AND aae202=?");
			paramList.add(dto.get("from"));
		}
		return this.queryForList(sql.toString(), paramList.toArray());
	}
	
	/**
	 * �޸�δ��״̬
	 * @param aae201
	 * @return
	 * @throws Exception
	 */
	public boolean modifyAe02(String aae201) throws Exception 
	{
		StringBuilder sql=new StringBuilder()
    			.append("UPDATE ae02")
    			.append("   SET aae206=1")
    			.append(" WHERE aae201=?")
    			;
    	return this.executeUpdate(sql.toString(), aae201);
	}
}
