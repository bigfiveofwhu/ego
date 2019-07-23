/**
 * @author hug
 */
package com.ego.controller.impl.localCity;

import java.util.Map;

import com.ego.controller.ControllerSupport;
import com.ego.services.impl.Ac01ServiceImpl;
import com.ego.services.impl.T_AreaService;

public class DetailController extends ControllerSupport
{

	@Override
	public String execute() throws Exception
	{
		this.dto.put("aac102", this.get("id"));
		this.setServices(new Ac01ServiceImpl());
		Map<String,String> ins=this.getServices().findById("findByAac102");
		this.saveAttribute("com", ins);
		String aac104=(String)ins.get("aac104");
		this.dto.put("aab105", aac104.split(" ")[2]);
		this.setServices(new T_AreaService());
		ins=this.getServices().findById("findByAab105");
		this.saveAttribute("position", ins);
		return "localCity/detail";
	}

}
