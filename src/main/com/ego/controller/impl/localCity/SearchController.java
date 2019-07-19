package com.ego.controller.impl.localCity;

import java.util.List;
import java.util.Map;

import com.ego.controller.ControllerSupport;
import com.ego.services.impl.Ac02ServiceImpl;

public class SearchController extends ControllerSupport 
{

	@Override
	public String execute() throws Exception 
	{
		this.saveAttribute("location", this.get("location"));   //λ����Ϣ
		String location=(String)this.get("location");
		this.dto.put("location", "%"+location.substring(0, location.length()-1)+"%");
		System.out.println("��ǰλ��: "+location.substring(0, location.length()-1));
		
		this.saveAttribute("key", this.get("key"));
		this.setServices(new Ac02ServiceImpl());
		if(this.get("type")!=null)   //��������
		{
			List<Map<String,String>> rows=this.getServices().query("queryByTypeLocation");
			this.saveAttribute("services", rows);
			this.saveAttribute("searchSum", rows.size());
		}
		else if(this.get("key")!=null)    //�ؼ�������
		{
			String key=(String)this.get("key");
			System.out.println("�����ؼ���:"+key);
			this.dto.put("key", "%"+key+"%");
			List<Map<String,String>> rows=this.getServices().query("queryByKeyLocation");
			this.saveAttribute("services", rows);
			this.saveAttribute("searchSum", rows.size());
		}
		return "localCity/search";
	}

}
