/**
 * @author hug
 * aab102 --店铺id
 * aab202 --商品名称
 * aab203 --商品id
 * aab204 --商品类型
 * aab205 --商品价格
 * aab206 --库存
 * aab207 --商品描述
 * aab208 --展示页面
 * aab209 --商品规格
 * aab210 --上架时间
 * aab211 --售后类型
 * aab212 --商品状态
 */

package com.ego.services.impl;

import java.lang.reflect.Method;
import java.util.List;
import java.util.Map;

import com.ego.services.JdbcServicesSupport;

public class Ab02ServiceImpl extends JdbcServicesSupport
{

	/**
	 * @author hug
	 */
	@Override
	public Map<String, String> findById(String qtype) throws Exception
	{
		Method method=this.getMethod(qtype);
		return (Map<String, String>)method.invoke(this);
	}
	/**
	 * @author hug
	 */
	@Override
	public List<Map<String, String>> query(String qtype) throws Exception
	{
		Method method=this.getMethod(qtype);
		return (List<Map<String, String>>)method.invoke(this);
	}
	/**
	 * @author hug
	 * 通过aab102 --店铺id 批量查询商品
	 * @return
	 */
	private List<Map<String,String>> findProductsByAab102() throws Exception
	{
		String sql="select aab202,aab203,aab205,aab208 from ab02 where aab212='02' and aab102=?";
		return this.queryForList(sql, this.get("aab102"));
	}
	/**
	 * 通过关键字搜索商品, 模糊匹配商品名称
	 * hug
	 * @return
	 */
	private List<Map<String,String>> queryByKey() throws Exception
	{
		String sql="select aab202,aab203,aab205,aab206,aab208 from ab02 where aab212='02' and aab202 like ?";
		System.out.println("通过关键字模糊查询");
		return this.queryForList(sql, this.get("key"));
	}
	
	/**
	 * 通过分类进行搜索,类别可能是第一级类别,第二级类别,第三季类别,多表联合擦查询
	 * hug
	 * @return
	 */
	private List<Map<String,String>> queryBySort() throws Exception
	{
		StringBuilder sql=new StringBuilder()
				.append("select x.aab202,x.aab204,x.aab203,x.aab205,x.aab206,x.aab208,s.fcode,y.fcode,z.fcode ")
				.append("  from ab02 x, syscode s, syscode y,syscode z")
				.append(" where x.aab212='02'      and s.fname='aab204' and y.fname='aab204'")
				.append("   and ((x.aab204=?       and s.fcode =?       and y.fcode=s.pfcode and z.fcode=y.pfcode)")
				.append("    or  (x.aab204=s.fcode and s.pfcode=?       and y.fcode=?        and z.fcode=y.pfcode)")
				.append("    or  (x.aab204=s.fcode and s.pfcode=y.fcode and y.pfcode=?       and z.fcode=?))")
				;
		Object args[]= {
			this.get("type"),
			this.get("type"),
			this.get("type"),
			this.get("type"),
			this.get("type"),
			this.get("type")
		};
		System.out.println("通过分类模糊查询");
		return this.queryForList(sql.toString(), args);
	}
	
	/**
	 * @author hug
	 * 查找商品最新上架的八个
	 * @return
	 */
	private List<Map<String,String>> findByUpToDate() throws Exception
	{
		String sql="select aab202,aab203,aab205,aab206,aab208 from ab02 where aab212='02' order by aab210 desc limit 8";
		return this.queryForList(sql);
	}
	/**
	 * 根据商品id查询商品的详细信息
	 * @author hug
	 * @return
	 * @throws Exception
	 */
	private Map<String, String> findByAab203() throws Exception
	{
		String sql="select y.aaa102,y.aab103,x.aab102,x.aab202,x.aab203,x.aab204,x.aab205,x.aab206,x.aab207,x.aab208,x.aab209 from ab02 x,ab01 y where y.aab102=x.aab102 and aab203=? order by aab210 desc";
		return this.queryForMap(sql,this.get("aab203"));
	}
	/**
	 * 根据多个商品id查询 多个商品的粗略信息
	 * @return
	 * @throws Exception
	 */
	private Map<String, String> findNameAndPriceByAab203() throws Exception
	{
		String sql="select aab202,aab203,aab205,aab208 from ab02 where aab203=?";
		return this.queryForMap(sql, this.get("aab203"));
	}
}
