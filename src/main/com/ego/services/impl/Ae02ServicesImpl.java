package com.ego.services.impl;

import com.ego.services.JdbcServicesSupport;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

/**
 *
 * 为websocket后端提供dao层，绕过BaseServlet拦截器，所以dto是通过websocket后端解析传来
 *
 * 处理1对1聊天记录
 * ae02:聊天记录表
 *
 * aae201:流水号
 * aae202:发送人
 * aae203:接收人
 * aae204:发送时间
 * aae205:内容
 * aae206:状态  0-未读 1-已读
 */
public class Ae02ServicesImpl extends JdbcServicesSupport
{
	/**
	 * 保存聊天记录
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
	 * 查询未读消息
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
	 * 修改未读状态
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
