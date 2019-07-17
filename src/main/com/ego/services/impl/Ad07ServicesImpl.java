/**
 * @author zb
 * 举报表:ad07
 Name	      Code	
流水号	     aad701	
用户id	     aaa102	
举报原因	     aad702	
举报内容	     aad703	
举报对象类型	 aad704	    01--商品,02--商铺,03--评价,04--服务,05--服务商
举报对象ref	 aad705         存对象id
举报状态	     aad706		01--已处理 02--未处理
 */

package com.ego.services.impl;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import com.ego.services.JdbcServicesSupport;

public class Ad07ServicesImpl extends JdbcServicesSupport
{
   /**
        *  举报表查询
    */
	@Override
    public List<Map<String, String>> query() throws Exception 
    { 	
		//还原页面查询条件
		Object aab202=this.get("aab202");       //评论商品名称
  		Object isreply=this.get("isreply");     //评论是否回复
  		Object aab412=this.get("aab412");     //是否带图
  	

  		
  		//定义SQL主体
  		StringBuilder sql=new StringBuilder()
  		  		.append("	select y.aab202,y.aab203,z.aaa103,x.aab403,x.aab410	")
  		  		.append("  from ab04 x, ab02 y, aa01 z 	")
  		 	    .append(" where x.aab203=y.aab203 and x.aaa102=z.aaa102	")
  				;
  		
  		//参数列表
  		List<Object> paramList=new ArrayList<>();
  		//逐一判断查询条件是否录入,拼接AND条件
  		if(this.isNotNull(aab202))
  		{
  			sql.append(" and x.aab202 like ?");
  			paramList.add("%"+aab202+"%");
  		}
  		if(this.isNotNull(isreply))
  		{
  			if(isreply.equals("01"))
  			sql.append(" and x.aab405 is null ");
  			else
  				sql.append(" and x.aab405 is not null");
  			//paramList.add(aab107);
  		}
  		if(this.equals(aab412))
  		{
  			sql.append(" and x.aab412 = ?");
  			paramList.add(aab412);
  		}
  		//sql.append(" order by x.aab101");
  		return this.queryForList(sql.toString(), paramList.toArray());
    }
	
	
	
}
