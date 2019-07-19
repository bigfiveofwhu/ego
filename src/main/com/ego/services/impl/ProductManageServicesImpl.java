/**
 * 表ab02:商品信息表
 *  Name	    Code	
	商品流水号	aab201
	店铺id	    aab102	
	商品名称	    aab202	
	商品id	    aab203	=年份+编码
	商品类型	    aab204	选择商品类型:
	商品价格	    aab205	
	库存	        aab206	
	商品描述	    aab207	
	展示页面    	aab208	
	商品规格	    aab209	
	上架时间	    aab210	 
	售后类型	    aab211	 
	商品状态	    aab212	 01--未提交审核;02---申请中;03--申请通过;04---申请未通过;05---已下架
 */

package com.ego.services.impl;

import java.lang.reflect.Method;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import com.ego.services.JdbcServicesSupport;
import com.ego.system.tools.Tools;

public class ProductManageServicesImpl extends JdbcServicesSupport
{
	public boolean update(String utype) throws Exception 
    {
		//System.out.println("执行反射");
		Method method=this.getClass().getDeclaredMethod(utype);
		method.setAccessible(true);
		return (boolean)method.invoke(this);
    }
	
	/**
	 * 商品页面查询
	 */
	public List<Map<String,String>> query() throws Exception
	{

  		//还原页面查询条件
  		Object aab202=this.get("qaab202");     //商品名称  模糊查询
  		Object aab212=this.get("qaab212");     //商品状态

  		
  		//定义SQL主体
  		StringBuilder sql=new StringBuilder()
  		  		.append("	select x.aab202,x.aab203,x.aab205,x.aab206,a.fvalue cnaab212 	")
  		  		.append("  from syscode a, ab02 x	")
  		 	    .append(" where x.aab212=a.fcode and a.fname='aab212' 	")
  				;
  		
  		//参数列表
  		List<Object> paramList=new ArrayList<>();
  		//逐一判断查询条件是否录入,拼接AND条件
  		if(this.isNotNull(aab202))
  		{
  			sql.append(" and x.aab202 like ?");
  			paramList.add("%"+aab202+"%");
  		}
  		if(this.isNotNull(aab212))
  		{
  			sql.append(" and x.aab212=?");
  			paramList.add(aab212);
  		}
  		//sql.append(" order by x.aab101");
  		return this.queryForList(sql.toString(), paramList.toArray());
	}
	
	/**
	 * 商品单例删除
	 * @throws Exception 
	 */
	public boolean deleteById() throws Exception
	{
		Object id = this.get("aab203");
		String sql = "delete from ab02 where aab203=? ";
		return this.executeUpdate(sql,id);
	}
	
	/**
	 * 商品批量删除
	 * @return
	 * @throws Exception
	 */
	public boolean batchDelete() throws Exception
	{
		//1.定义SQL语句
    	String sql="delete from ab02 where aab203=?";
    	//2.获取页面idlist数组
    	String idlist[]=this.getIdList("proidList");
    	//3.执行
    	return this.batchUpdate(sql, idlist);
	}
     
	/**
	 * 添加商品
	 * @return
	 * @throws Exception
	 */
	public boolean addProduct() throws Exception
	{
		Object aab102 = 1;//店铺id session获取
		//获取当前商品编号
    	int aab203=Tools.getIncrementId("ab02");
    
    	//向DTO添加商品编号
    	this.put("aab203", aab203);
    	
    	//解析商品类型,获得第三级类别
    	String type =(String) this.get("aab204");
    	String aab204 = "";
    	String sortName=type.split("-")[type.split("-").length-1];
    	if(type!=null)
        aab204 = this.getSortCode(sortName);
    	
    	//1.编写SQL语句
    	StringBuilder sql=new StringBuilder()
    			.append("insert into ab02(aab102,aab202,aab203,aab204,aab205,")
    			.append("                 aab206,aab207,aab208,aab209,aab210,")
    			.append("                 aab211,aab212)")
    			.append("          values(?,?,?,?,?,")
    			.append("                 ?,?,?,?,?,")
    			.append("                 ?,?)")
    			;
	 
    	//2.编写参数数组
    	Object args[]={
    			aab102,   //店铺id
    			this.get("aab202"),
    			aab203,               //商品id
    			aab204,
    			this.get("aab205"),
    			this.get("aab206"),
    			this.get("aab207"),
    			this.get("aab208"),
    			this.get("aab209"),
    			this.get("aab210"),
    			this.get("aab211"),
    			"01"
    	};
        return this.executeUpdate(sql.toString(), args);	
	}
	
	/**
	 * 获取商品类别编码
	 * @param sortName
	 * @return
	 * @throws Exception
	 */
	private String getSortCode(String sortName) throws Exception
	{
		//定义SQL
		String sql = "select fcode from syscode where fvalue=?";
		
		Map<String,String> map = this.queryForMap(sql, sortName);
		 
		return map.get("fcode");
	}
	
}
