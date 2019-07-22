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
				.append("select y.aaa102,y.aac102,y.aac103,y.aac104,y.aac110,x.aac202,")
				.append("		x.aac203,z.fvalue serviceType,s.fvalue serviceMethod,x.aac206,x.aac207,")
				.append("       x.aac209,x.aac210")
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
	/**
	 * 通过关键字模糊匹配地理位置信息,进行相应的服务查找   ,服务服务商分别要通过审核
	 * hug
	 * @return
	 */
	private List<Map<String,String>> queryByKeyLocation() throws Exception
	{
		StringBuilder sql=new StringBuilder()
				.append("select x.aac202,x.aac203,z.fvalue aac104,a.fvalue aac105,x.aac206,aac210")
				.append("  from ac02 x, T_Area y,syscode z, syscode a, ac01 b")
				.append(" where (x.aac205=a.fcode and a.fname='aac205')")
				.append("   and (x.aac204=z.fcode and z.fname='aac204')")
				.append("   and (x.aac203 like ?)")    //关键字对服务名称进行模糊匹配
				.append("	and (x.aac208='02' and x.aac102=b.aac102)")   //服务  02 --审核通过
				.append("   and (b.aac108='02')")        //服务商  02 --通过审核
				.append("	and (b.aac105=y.areaId)")
				.append("   and (y.`level`='2' and y.areaName like ?)")   //对地理位置进行模糊匹配
				;
		Object args[]= {
			this.get("key"),
			this.get("location")
		};
		return this.queryForList(sql.toString(), args);
	}
	/**
	 * 通过类别编码模糊匹配分类信息,进行相应的服务查找,服务服务商分别要通过审核
	 * hug
	 * @return
	 * @throws Exception
	 */
	private List<Map<String,String>> queryByTypeLocation() throws Exception
	{
		StringBuilder sql=new StringBuilder()
				.append("select x.aac202,x.aac203,z.fvalue aac104,a.fvalue aac105,x.aac206,aac210")
				.append("  from ac02 x, T_Area y,syscode z, syscode a, ac01 b")
				.append(" where (x.aac205=a.fcode and a.fname='aac205')")
				.append("   and (x.aac204=z.fcode and z.fname='aac204')")
				.append("	and (x.aac208='02' and x.aac102=b.aac102)")   //服务  02 --审核通过
				.append("   and (b.aac108='02' and b.aac106=?)")     //根据类别对服务商进行筛选   02 --审核通过
				.append("	and (b.aac105=y.areaId)")
				.append("   and (y.`level`='2' and y.areaName like ?)")   //对地理位置进行模糊匹配
				;
		Object args[]= {
			this.get("type"),
			this.get("location")
		};
		return this.queryForList(sql.toString(), args);
	}
}
