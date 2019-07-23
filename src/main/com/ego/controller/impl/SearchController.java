package com.ego.controller.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;

import com.ego.controller.ControllerSupport;
import com.ego.services.impl.Ab02ServiceImpl;
import com.ego.services.impl.AdvertiseService;
import com.ego.services.impl.PreferenceService;

public class SearchController extends ControllerSupport 
{

	@Override
	public String execute() throws Exception 
	{
		this.setServices(new Ab02ServiceImpl());
		if(this.get("key")!=null)
		{
			this.saveAttribute("key", this.get("key"));
			this.dto.put("key", "%"+this.get("key").toString()+"%");
			List<Map<String,String>> rows=this.getServices().query("queryByKey");
			this.saveAttribute("productList", rows);
			this.saveAttribute("searchSum", rows.size());
			//修改用户偏好
			dto.put("rows", rows);
			this.setServices(new PreferenceService());
			this.getServices().update(PreferenceService.search);
			//获取搜索广告
			this.setServices(new AdvertiseService());
			this.saveAttribute("searceAds", this.getServices().query("getSearchTopByKey"));
		}else if(this.get("type")!=null)
		{
			List<Map<String,String>> rows=this.getServices().query("queryBySort");
			this.saveAttribute("productList", rows);
			this.saveAttribute("searchSum", rows.size());
			//修改用户偏好
			dto.put("rows", rows);
			this.setServices(new PreferenceService());
			this.getServices().update(PreferenceService.search);
			//获取搜索广告
			this.setServices(new AdvertiseService());
			dto.put("productType", getType(rows));
			this.saveAttribute("searceAds",this.getServices().query("getSerachTop") );
		}else
		{
			List<Map<String,String>> rows=this.getServices().query("findByUpToDate");
			this.saveAttribute("productList", rows);
			this.saveAttribute("searchSum", rows.size());
		}
		return "home/search";
	}

	/**
	 * 根据dto的数据获得最多的类型，dto为空则返回null
	 * @param dto
	 * @return
	 * @throws Exception
	 */
	private String getType(List<Map<String,String>> dto)throws Exception {
		if (dto==null||dto.isEmpty()) {
			return null;
		}
		Map<String,Integer> result=new HashMap<String, Integer>();
		for (Map<String, String> map : dto) {
			if (result.get(map.get("aab204"))==null) {
				result.put(map.get("aab204"), 1);
			}else {//如果已经存在
				Integer a=result.get(map.get("aab204"));
				result.put(map.get("aab204"), ++a);
			}
		}
		
		//获得最多的类型
		int max=0;
		String maxType=null;
		for (Entry<String, Integer> map : result.entrySet()) {
			if (map.getValue()>max) {
				maxType=map.getKey();
				max=map.getValue();
			}
		}
		return maxType;
	}
}
