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
 * aae206:״̬  01-δ�� 02-�Ѷ�
 */
public class Ae02ServicesImpl extends JdbcServicesSupport
{
	@Override
	public boolean update(String utype) throws Exception {
		if(utype.equalsIgnoreCase("insert"))
			return insert(this.dto);
		throw new Exception("Ae02ServicesImpl utype:"+utype);
	}

	/**
	 * ���������¼
	 * @param dto
	 * @return
	 * @throws Exception
	 */
	public boolean insert(Map<String, Object> dto) throws Exception
	{
		StringBuilder sql = new StringBuilder()
				.append("INSERT INTO ae02 (aae202,aae203,aae204,aae205,aae206,aae207) ")
				.append("VALUES (?,?,?,?,?,?)")
				;
		Object[] args = {
				dto.get("from_id"),
				dto.get("to_id"),
				dto.get("datetime"),
				dto.get("content"),
				"01",
				dto.get("from_name")
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
				.append("SELECT aae201 id,aae202 from_id,aae203 to_id,aae204 datetime,aae205 content,aae206 state,aae207 from_name")
				.append("  FROM ae02")
				.append(" WHERE aae203=? OR aae202=?")
				.append(" ORDER BY datetime")
				;
		List<Object> paramList=new ArrayList<>();
		paramList.add(dto.get("to_id"));
		paramList.add(dto.get("from_id"));

		if(isNotNull(dto.get("state")))
		{
			sql.append(" AND aae206=?");
			paramList.add(dto.get("state"));
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
    			.append("   SET aae206='02'")
    			.append(" WHERE aae202=? AND aae203=?")
    			;
		Object[] args={
		        dto.get("from_id"),
                dto.get("to_id")
        };
    	return this.executeUpdate(sql.toString(), args);
	}
}
