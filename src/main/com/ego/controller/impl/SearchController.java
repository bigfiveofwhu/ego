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
		if(this.get("pageCount")==null)    //����Ĭ�ϳ�ʼ��ѯid  ��������ҳ��ѯ
		{
			this.dto.put("lastId", 0);
			this.saveAttribute("pagIndex", 1);
		}else
		{
			int index=Integer.parseInt(this.get("pageCount").toString());
			this.dto.put("lastId", (index-1)*13);
			this.saveAttribute("pagIndex", index);
		}
		if(this.get("key")!=null)
		{
			this.saveAttribute("searchType", "key");   //������������
			this.saveAttribute("searchValue", this.get("key"));   //����ֵ
			
			this.saveAttribute("key", this.get("key"));
			this.dto.put("key", "%"+this.get("key").toString()+"%");
			List<Map<String,String>> rows=this.getServices().query("queryByKey");
			this.saveAttribute("productList", rows);
			//����������Ʒ��
			this.saveAttribute("searchSum", Integer.parseInt(this.getServices().findById("findProCountByKey").get("prosum").toString()));
			
			//�޸��û�ƫ��
			dto.put("rows", rows);
			this.setServices(new PreferenceService());
			this.getServices().update(PreferenceService.search);
			//��ȡ�������
			this.setServices(new AdvertiseService());
			List<Map<String,String>> rows1=this.getServices().query("getSearchTopByKey");
			this.saveAttribute("searceAds", rows1);
		}else if(this.get("type")!=null)
		{
			this.saveAttribute("searchType", "type");   //������������
			this.saveAttribute("searchValue", this.get("type"));   //����ֵ
			
			List<Map<String,String>> rows=this.getServices().query("queryBySort");
			this.saveAttribute("productList", rows);
			//����������Ʒ��
			this.saveAttribute("searchSum", Integer.parseInt(this.getServices().findById("findProCountBySort").get("prosum").toString()));
			
			//�޸��û�ƫ��
			dto.put("rows", rows);
			this.setServices(new PreferenceService());
			this.getServices().update(PreferenceService.search);
			//��ȡ�������
			this.setServices(new AdvertiseService());
			dto.put("productType", getType(rows));
			List<Map<String,String>> rows1=this.getServices().query("getSerachTop");
			this.saveAttribute("searceAds",rows1 );
		}else
		{
			List<Map<String,String>> rows=this.getServices().query("findByUpToDate");
			this.saveAttribute("productList", rows);
			this.saveAttribute("searchSum", rows.size());
		}
		return "home/search";
	}

	/**
	 * ����dto�����ݻ���������ͣ�dtoΪ���򷵻�null
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
			}else {//����Ѿ�����
				Integer a=result.get(map.get("aab204"));
				result.put(map.get("aab204"), ++a);
			}
		}
		
		//�����������
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
