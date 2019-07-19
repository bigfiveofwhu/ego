/**
 * @author hug
 */
package com.ego.controller.impl.localCity;

import java.util.Map;

import com.ego.controller.ControllerSupport;
import com.ego.services.impl.Ac01ServiceImpl;

public class DetailController extends ControllerSupport
{

	@Override
	public String execute() throws Exception
	{
		this.dto.put("aac102", this.get("id"));
		this.setServices(new Ac01ServiceImpl());
		Map<String,String> ins=this.getServices().findById("findByAac102");
		this.saveAttribute("com", ins);
		return "localCity/detail";
	}

}
