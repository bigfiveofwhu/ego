package com.ego.controller.impl;

import java.util.List;
import java.util.Map;

import com.ego.controller.ControllerSupport;
import com.ego.services.impl.Ab02ServiceImpl;
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
		}else if(this.get("type")!=null)
		{
			List<Map<String,String>> rows=this.getServices().query("queryBySort");
			this.saveAttribute("productList", rows);
			this.saveAttribute("searchSum", rows.size());
			//修改用户偏好
			dto.put("rows", rows);
			this.setServices(new PreferenceService());
			this.getServices().update(PreferenceService.search);
			
		}else
		{
			List<Map<String,String>> rows=this.getServices().query("findByUpToDate");
			this.saveAttribute("productList", rows);
			this.saveAttribute("searchSum", rows.size());
		}
		return "home/search";
	}

}
