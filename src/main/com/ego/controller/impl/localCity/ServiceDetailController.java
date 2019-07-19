/**
 * @author hug
 */
package com.ego.controller.impl.localCity;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import com.ego.controller.ControllerSupport;
import com.ego.services.impl.Ac02ServiceImpl;

public class ServiceDetailController extends ControllerSupport
{

	@Override
	public String execute() throws Exception
	{
		this.dto.put("aac202", this.get("serviceId"));
		this.setServices(new Ac02ServiceImpl());
		Map<String,String> ins=this.getServices().findById("findByAac202");
		this.saveAttribute("info", ins);
		String imgs=(String)ins.get("aac210");
		List<String> imgList=new ArrayList<>();
		for(String img:imgs.split(";"))
		{
			imgList.add(img);
		}
		this.saveAttribute("imgList", imgList);
		return "localCity/serviceDetail";
	}
}
