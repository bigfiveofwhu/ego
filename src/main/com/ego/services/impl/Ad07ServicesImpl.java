/**
 * @author zb
 * 举报表:ad07
 Name	      Code	
流水号	     aad701	
用户id	     aaa102	
举报原因	     aad702	
举报内容	     aad703	
举报对象类型	 aad704	   01--评论,02--商品,03--商铺,04--服务,05--服务商
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
		Object aad706=this.get("aad706");       //投诉处理状态
       
  		
  		//定义SQL主体
  		StringBuilder sql=new StringBuilder()
  		  		.append("	select y.aaa102,y.aaa103, x.aad705,x.aad704	")
  		  		.append("   a.fvalue cnaad702,b.fvalue cnaad703,c.fvalue cnaad704,d.fvalue cnaad706 ")
  		  		.append("  from ad07 x, aa01 y, syscode a,syscode b,syscode c,syscode d ")
  		 	    .append(" where x.aaa102=y.aaa102 	")
  		 	    .append("  and a.fname='aad702' and a.fcode=x.aad702 ")
  		 	    .append("  and b.fname='aad703' and b.fcode=x.aad703 ")
  		 	    .append("  and c.fname='aad704' and c.fcode=c.aad704 ")
  		 	    .append("  and d.fname='aad706' and d.fcode=x.aad706 ")
  		 	    ;
  				
  		//参数列表
  		List<Object> paramList=new ArrayList<>();
  		//逐一判断查询条件是否录入,拼接AND条件
  		if(this.isNotNull(aad706))
  		{
  			sql.append(" and x.aab202 like ?");
  			paramList.add("%"+aad706+"%");
  		}
  		//sql.append(" order by x.aab101");
  		return this.queryForList(sql.toString(), paramList.toArray());
    }
	
	/**
	 * 判断举报对象类型,查询详细信息
	 */
	@Override
	public List<Map<String, String>> query(String qtype) throws Exception 
	{
		//String type = (String)this.get("aad704");
		String sql;
		switch (qtype) {
		case "01":
			break;
		case "02":
			break;
		default:
			break;
		}
			// TODO Auto-generated method stub
			return super.query(qtype);
	}
	
	
	
	
	
	
}
