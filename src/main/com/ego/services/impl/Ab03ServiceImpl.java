/**
 * @author hug
 */
package com.ego.services.impl;

import java.lang.reflect.Method;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Map;

import com.ego.services.JdbcServicesSupport;

public class Ab03ServiceImpl extends JdbcServicesSupport
{
	/***********************************************
	 *          以下为查询方法
	 ***********************************************/
	@Override
	public Map<String, String> findById(String qtype) throws Exception 
	{
		Method method=this.getMethod(qtype);
		return (Map<String, String>)method.invoke(this);
	}
	
	/**
	 * @author hug
	 *  通过店铺id查找上个月的销量(卖的商品的数量), 01 --代付款,03--已取消,08--已退款,09--已申述等状态除外
	 * @return
	 * @throws Exception
	 */
	private Map<String,String> orderSumLastMouth() throws Exception
	{
		Date date=new Date();
		SimpleDateFormat format=new SimpleDateFormat("yyyy MM");
		String dates[]=format.format(date).split(" ");
		String d1=dates[0]+"-"+(Integer.parseInt(dates[1])-1)+"-01 00:00:00";
		String d2=dates[0]+"-"+(Integer.parseInt(dates[1])-1)+"-30 23:59:59";
		StringBuilder sql=new StringBuilder()
				.append("select sum(x.aab310) as lastMouthSum from ab03 x")
				.append(" where x.aab306>d1 and x.aab306<d2")
				.append(" and x.aab303!='01' and x.aab303!='03' ")
				.append("and x.aab303!='08' and x.aab303!='09' and x.aab203=?")
				;
		return this.queryForMap(sql.toString(), this.get("aab203"));
	}
	
	private Map<String,String> orderSum() throws Exception
	{
		String sql="select sum(x.aab310) as lastMouthSum from ab03 x where x.aab303!='01' and x.aab303!='03' and x.aab303!='08' and x.aab303!='09' and x.aab203=?";
		return this.queryForMap(sql, this.get("aab203"));
	}
	
}
