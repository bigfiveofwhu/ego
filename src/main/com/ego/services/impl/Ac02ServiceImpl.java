/**
 * @author hug
 */
package com.ego.services.impl;

import java.lang.reflect.Method;
import java.util.List;
import java.util.Map;

import com.ego.services.JdbcServicesSupport;

public class Ac02ServiceImpl extends JdbcServicesSupport 
{

	/****************************************************************
	 *     以下是单一实例查询
	 ***************************************************************/
	@Override
	public Map<String, String> findById(String qtype) throws Exception 
	{
		Method method=this.getMethod(qtype);
		return (Map<String,String>)method.invoke(this);
	}
	/**
	 * 通过服务id查询服务的详细信息,包括服务商的粗略信息
	 * hug
	 * @return
	 * @throws Exception
	 */
	private Map<String,String> findByAac202() throws Exception
	{
		StringBuilder sql=new StringBuilder()
				.append("select y.aac102,y.aac103,y.aac104,y.aac110,x.aac202,")
				.append("			  x.aac203,z.fvalue serviceType,s.fvalue serviceMethod,x.aac206,x.aac207,")
				.append("             x.aac209,x.aac210")
				.append("  from ac02 x, ac01 y,syscode z, syscode s")
				.append(" where x.aac102=y.aac102 and x.aac202=? and x.aac208='02'")
				.append("   and z.fcode=x.aac204 and z.fname='aac204'")
				.append("   and s.fcode=x.aac205 and s.fname='aac205'")
				;
		return this.queryForMap(sql.toString(), this.get("aac202"));
	}
	
	/*******************************************************************
	 *      以下为批量查询方法
	 *******************************************************************/
	@Override
	public List<Map<String, String>> query(String qtype) throws Exception 
	{
		Method method=this.getMethod(qtype);
		return (List<Map<String, String>>)method.invoke(this);
	}
	/**
	 * 通过Aac102 --服务商id批量查找服务
	 * @author hug
	 * @return
	 */
	private List<Map<String,String>> queryByAac102() throws Exception
	{
		String sql="select aac202,aac203,aac210 from ac02 where aac102=? and aac208='02'";
		return this.queryForList(sql, this.get("aac102"));
	}
	
	
}
