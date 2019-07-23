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
	 * 商品单例查询
	 */
	@Override
	public Map<String, String> findById() throws Exception {
		StringBuilder sql=new StringBuilder()
  		  		.append("	select x.aab202,x.aab203,x.aab205,x.aab206,x.aab204,a.fvalue cnaab212,b.fvalue cnaab204,c.fvalue cnaab211	")
  		  		.append("  from syscode a, ab02 x ,syscode b ,syscode c	")
  		 	    .append("  where x.aab212=a.fcode and a.fname='aab212' 	")
  		 	    .append("  and  x.aab204=b.fcode and b.fname='aab204' ")
  		 	    .append( "  and x.aab211=c.fcode and c.fname='aab211' ")
  		 	    .append("  and x.aab203 = ? ")
  				;
		return this.queryForMap(sql.toString(), this.get("aab203"));
	}
	/**
	 * 商品页面查询(某个商铺)
	 */
	public List<Map<String,String>> query() throws Exception
	{

  		//还原页面查询条件
  		Object aab202=this.get("qaab202");     //商品名称  模糊查询
  		Object aab212=this.get("qaab212");     //商品状态
  		Object aab102=this.get("aab102");

  		
  		//定义SQL主体
  		StringBuilder sql=new StringBuilder()
  		  		.append("	select x.aab202,x.aab203,x.aab205,x.aab206,a.fvalue cnaab212,b.fvalue cnaab204	")
  		  		.append("  from syscode a, ab02 x ,syscode b	")
  		 	    .append("  where x.aab212=a.fcode and a.fname='aab212' 	")
  		 	    .append("  and  x.aab204=b.fcode and b.fname='aab204' ")
  		 	    .append( "  and x.aab212 <> '05' ")
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
  		if(this.isNotNull(aab102))
  		{
  			sql.append(" and x.aab102 = ?");
  			paramList.add(aab102);
  		}
  		sql.append(" order by x.aab203");
  		return this.queryForList(sql.toString(), paramList.toArray());
	}
	
	/**
	 * 商品单例删除
	 * @throws Exception 
	 */
	public boolean deleteById() throws Exception
	{
		Object id = this.get("aab203");
		System.out.println("id:"+id);
		String sql = "update ab02 set aab212 = '05' where aab203 = ?";
		
	
			return this.executeUpdate(sql, id);

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
	 * 添加商品,上架
	 * @return
	 * @throws Exception
	 */
	public boolean addProduct() throws Exception
	{
		Object aab102 = this.get("aab102");//店铺id session获取
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
    	
    	//
    	String aab207 =(String)this.get("aab207");
    	aab207 = aab207 + "&";
    	
    	String aab209=(String)this.get("aab209");
    	aab209 = aab209.substring(0,aab209.length()-1);
    	
    	//1.编写SQL语句
    	StringBuilder sql1=new StringBuilder()
    			.append("insert into ab02(aab102,aab202,aab203,aab204,aab205,")
    			.append("                 aab206,aab207,aab208,aab209,aab210,")
    			.append("                 aab211,aab212)")
    			.append("          values(?,?,?,?,?,")
    			.append("                 ?,?,?,?,current_timestamp,")
    			.append("                 ?,?)")
    			;
	 
    	//2.编写参数数组
    	Object args1[]={
    			aab102,   //店铺id
    			this.get("aab202"),
    			aab203,               //商品id
    			aab204,
    			this.get("aab205"),
    			this.get("aab206"),
    			aab207,
    			this.get("aab208"),
    			aab209,
    			this.get("aab211"),
    			"01"
    	};
    	

    	
    	//添加审核表
    	StringBuilder sql2 = new StringBuilder()
    			.append("insert into ad08(aaa102,aad802,aad803,aad804,aad805) ")
    		  	.append("        VALUES(?,?,?,?,?) ")
    			;
    	Object args2[] = {
    		this.get("aaa102"),
    		this.get("aab202")+":请求通过",
    		"02",
    		"01",
    		aab203
    	};
    	
//    	String updateSql ="update ab02 set aab210 = current_time where aab203 = ?";
//    	this.executeUpdate(updateSql, aab203);
    	
       if( this.executeUpdate(sql1.toString(), args1))
       {
    	   return this.executeUpdate(sql2.toString(), args2);
       }
       else
    	   return false;
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
	
	/**
	 * 商品下架
	 * @return
	 * @throws Exception
	 */
	public boolean putOffSale() throws Exception
	{
		String sql = "update ab02 set aab212 = '04' where aab203 = ? ";
		return this.executeUpdate(sql, this.get("aab203"));
	}
	
	public boolean updateById() throws Exception
	{
		String sql = "update ab02 set aab205 = ?,aab206 = ? where aab203 = ?";
		Object args[] = {
				this.get("aab205"),
				this.get("aab206")
		};
		return this.batchUpdate(sql, args, this.get("aab203"));
	}
	
	/**
	 * 存商品图片
	 * @return
	 * @throws Exception
	 */
	public boolean saveShopImg() throws Exception
	{
		//判断aab208是否为空
		String sql = "select aab208 from ab02 where aab203 = ?";
		Map<String,String> map = this.queryForMap(sql, this.get("aab203"));
		String path = (String)this.get("imgPath");
		String sql1;
		if(map.get("aab208") == null)
			sql1="update ab02 set aab208='"+path+"' where aab203 = ?";
		else
		{
			path = ";" + path;
		    sql1 = "update ab02 set aab208=CONCAT(aab208,'"+ path + "') where aab203=?";
		}
		System.out.println(sql1);
		return this.executeUpdate(sql1, this.get("aab203"));
	}
	
	/**
	 * 存取详情图片
	 * @return
	 * @throws Exception
	 */
	public boolean saveSpecImg() throws Exception
	{
		String sql = "select aab207 from ab02 where aab203 = ?";
		Map<String,String> map = this.queryForMap(sql, this.get("aab203"));
		String path = (String)this.get("imgPath");
		String sql1;
		if(map.get("aab207")==null)
		{
			sql1="update ab02 set aab207='"+path+"' where aab203 = ?";
		}
		else if(map.get("aab207").endsWith("&"))
		{
		    sql1 = "update ab02 set aab207=CONCAT(aab207,'"+ path + "') where aab203=?";
		}
		else 
		{
			path = ";"+path;
		    sql1 = "update ab02 set aab207=CONCAT(aab207,'"+ path + "') where aab203=?";
		}
		System.out.println(sql1);
		return this.executeUpdate(sql1, this.get("aab203"));
	}
	
	
	@Override
	public Map<String, String> findById(String qtype) throws Exception {
		if(qtype.equalsIgnoreCase("getProImgPath"))
		{
			return this.getProImgPath();
		}
		else
		 throw new Exception("未定义的qtype:" + qtype);
	}
	/**
	 * 获取图片路径
	 * @return
	 * @throws Exception
	 */
	private Map<String,String> getProImgPath() throws Exception
	{
		String sql = "select aab207,aab208 from ab02 where aab203=? ";
		return this.queryForMap(sql, this.get("aab203"));
	}
}
