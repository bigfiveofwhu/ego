package com.ego.services.impl.shop;

import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.ego.services.JdbcServicesSupport;

public class shopSercvice extends JdbcServicesSupport{
	
	
	
	@Override
	public List<Map<String, String>> query() throws Exception {
		// TODO Auto-generated method stub
		return getHotProducts();
	}
	
	/**
	 * 获得店铺的热门商品，要求传递店铺id
	 * @return
	 * @throws Exception 
	 */
	private List<Map<String, String>> getHotProducts() throws Exception {
		List<Map<String, String>> products= (List<Map<String, String>>) dto.get("products");
		List<Map<String, String>> hotProducts=new ArrayList<Map<String,String>>();
		for (Map<String, String> map : products) {
			String total=orderSumLastMouth(map.get("aab203")).get("lastmouthsum");
			map.put("lastmouthsum",total==null?"0":total );
			hotProducts.add(map);
		}
		hotProducts.sort(new Comparator<Map<String, String>>() {
			@Override
			public int compare(Map<String, String> o1, Map<String, String> o2) {
				// TODO Auto-generated method stub
				int total1=Integer.parseInt(o1.get("lastmouthsum"));
				int total2=Integer.parseInt(o2.get("lastmouthsum"));
				return total2-total1;
			}
		});
		int i=hotProducts.size()>16?16:hotProducts.size();
		return hotProducts.subList(0, i);
	}
	
	private Map<String,String> orderSumLastMouth(String id) throws Exception
	{
		StringBuilder sql=new StringBuilder()
				.append("select sum(x.aab310) as lastmouthsum from ab03 x")
				.append(" where PERIOD_DIFF(date_format(NOW( ),'%Y%m'),date_format(x.aab306,'%Y%m'))=1")   //1代表上个月的销量
				.append(" and x.aab303!='01' and x.aab303!='03' ")
				.append("and x.aab303!='08' and x.aab303!='09' and x.aab203=?")
				;
		return this.queryForMap(sql.toString(), id);
	}
}
