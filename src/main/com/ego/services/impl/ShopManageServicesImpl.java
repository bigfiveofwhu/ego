/**表ab01:店铺表
Name	    Code	
店铺流水号	aab101	
用户id	    aaa102	
店铺id	    aab102	
店铺名称	    aab103	
店铺信用积分	aab104	
店铺地址	    aab105	
认证信息   	aab106	
店铺状态	    aab107	01--未审核;02--审核通过;03--审核未通过;04--关闭
保证金	    aab108	
物流评分   	aab109	
服务评分   	aab110	
商品评分   	aab111	
**/
package com.ego.services.impl;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import com.ego.services.JdbcServicesSupport;

public class ShopManageServicesImpl extends JdbcServicesSupport
{
	public boolean update(String utype) throws Exception 
    {
    	if(utype.equalsIgnoreCase("queryAll"))
    	{
    		//return this.modifyUserInfo();
    	}
    	{
    		throw new Exception("在类[ShopManageServicesImpl]中进行了未定义的动作调用,动作名称是  "+utype);
    	}	
    }
	
	/**
	 * 商铺页面查询
	 */
	public List<Map<String,String>> query() throws Exception
	{

  		//还原页面查询条件
  		Object aab103=this.get("qaab103");     //店铺名称  模糊查询
  		Object aab107=this.get("qaab107");     //店铺状态

  		
  		//定义SQL主体
  		StringBuilder sql=new StringBuilder()
  		  		.append("	select y.aaa109,x.aab102,x.aab103,y.aaa108,a.fvalue cnaab107 	")
  		  		.append("  from syscode a, ab01 x, aa01 y 	")
  		 	    .append(" where x.aab107=a.fcode and a.fname='aab107' 	")
  		     	.append("  and x.aaa102=y.aaa102 	")
  				;
  		
  		//参数列表
  		List<Object> paramList=new ArrayList<>();
  		//逐一判断查询条件是否录入,拼接AND条件
  		if(this.isNotNull(aab103))
  		{
  			sql.append(" and x.aab103 like ?");
  			paramList.add("%"+aab103+"%");
  		}
  		if(this.isNotNull(aab107))
  		{
  			sql.append(" and x.aab107=?");
  			paramList.add(aab107);
  		}
  		//sql.append(" order by x.aab101");
  		return this.queryForList(sql.toString(), paramList.toArray());
	}
	
	/**
	 * 获取本店商品评级 待调试
	 * 评价表:ab04
	 * @return
	 * @throws Exception
	 */
	public Map<String,String> getProductAvg() throws Exception
	{
		//获取该商铺所有商品idlist
		String sql1 = "select aab203 from ab02 where aab102 = ?";
		List<Map<String,String>> list = this.queryForList(sql1, this.get("aab102"));
		List<Object> olist = new ArrayList<>(); 
		for(Map<String,String> map : list)
		{
			olist.add(map.get("aab102"));
		}
		
		String sql2 = "select avg(aab410) as productAvg from ab04 where aab203=?";
		return this.queryForMap(sql2,olist.toArray());
	}
	
	/**
	 * 服务评级 待调试
	 * @return
	 * @throws Exception
	 */
	public Map<String,String> getServiceAvg() throws Exception
	{
		//获取该商铺所有商品idlist
		String sql1 = "select aab203 from ab02 where aab102 = ?";
		List<Map<String,String>> list = this.queryForList(sql1, this.get("aab102"));
		List<Object> olist = new ArrayList<>(); 
		for(Map<String,String> map : list)
		{
			olist.add(map.get("aab102"));
		}
		
		String sql2 = "select avg(aab411) as productAvg from ab04 where aab203=?";
		return this.queryForMap(sql2,olist.toArray());
	}
	
	/**
	 * 物流评级 待调试
	 * @return
	 * @throws Exception
	 */
	public Map<String,String> getShipAvg() throws Exception
	{
		//获取该商铺所有商品idlist
		String sql1 = "select aab203 from ab02 where aab102 = ?";
		List<Map<String,String>> list = this.queryForList(sql1, this.get("aab102"));
		List<Object> olist = new ArrayList<>(); 
		for(Map<String,String> map : list)
		{
			olist.add(map.get("aab102"));
		}
		
		String sql2 = "select avg(aab409) as productAvg from ab04 where aab203=?";
		return this.queryForMap(sql2,olist.toArray());
	}
	
	public boolean checkIn() throws Exception
	{
		//用户id用session获得
		Object userId = "1";
		String sql1="select a.aab107 from ab01 a where a.aaa102 = ?";
		List<Map<String,String>> list = this.queryForList(sql1,userId );
		if(list.size() > 0)
		{
			//用户审核通过
			if(list.get(0).get("aab107").equals("02"))
					return true;
			else
			//用户审核未通过
				return false;
		}
		//用户未开店
		return false;
	}
}
