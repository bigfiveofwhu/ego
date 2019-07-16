package com.ego.services.impl;

import com.ego.services.JdbcServicesSupport;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

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
	public boolean insert(Map<String, Object> dto) throws Exception
	{
		StringBuilder sql = new StringBuilder()
				.append("INSERT INTO ae02 (aae202,aae203,aae204,aae205,aae206)")
				.append("     VALUES (?,?,CURRENT_TIMESTAMP,?,?)")
				;
		Object[] args = {
				dto.get("from"),
				dto.get("to"),
				dto.get("content"),
				dto.get("state")
				};
		return this.executeUpdate(sql.toString(), args);
	}

	/**
	 * ��ѯδ����Ϣ
	 * @param dto
	 * @return
	 * @throws Exception
	 */
	public List<Map<String, String>> query(Map<String, Object> dto) throws Exception
	{
		StringBuilder sql=new StringBuilder()
				.append("SELECT aae201,aae202,aae203,aae204,aae205")
				.append("  FROM ae02")
				.append(" WHERE aae203=?");
		List<Object> paramList=new ArrayList<>();
		paramList.add(dto.get("to"));

		if(isNotNull(dto.get("state")))
		{
			sql.append(" AND aae206=?");
			paramList.add(dto.get("state"));
		}
		if(isNotNull(dto.get("from")))
		{
			sql.append(" AND aae202=?");
			paramList.add(dto.get("from"));
		}
		return this.queryForList(sql.toString(), paramList.toArray());
	}

	/**
	 * �޸�δ��״̬
	 * @param dto
	 * @return
	 * @throws Exception
	 */
	public boolean modify(Map<String, Object> dto) throws Exception
	{
		StringBuilder sql=new StringBuilder()
    			.append("UPDATE ae02")
    			.append("   SET aae206=02")
    			.append(" WHERE aae202=? AND aae203=?")
    			;
		Object[] args={
		        dto.get("from"),
                dto.get("to")
        };
    	return this.executeUpdate(sql.toString(), args);
	}
}
