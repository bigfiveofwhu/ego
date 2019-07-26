package com.ego.controller.impl.localCity;

import com.ego.controller.ControllerSupport;

public class EntryController extends ControllerSupport {

	@Override
	public String execute() throws Exception {
		if(this.get("aaa102")==null)
			return "home/home";

		return "houtai/html/service_provider/index";
	}

}
