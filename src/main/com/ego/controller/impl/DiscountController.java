package com.ego.controller.impl;

import com.ego.controller.ControllerSupport;
import com.ego.services.impl.Ab05ServiceImpl;

public class DiscountController extends ControllerSupport{

	public DiscountController() {
		// TODO Auto-generated constructor stub
		this.setServices(new Ab05ServiceImpl());
		
	}
	
	@Override
	public String execute() throws Exception {
		// TODO Auto-generated method stub
		if (this.getServices().update("addDiscount")) {
			saveAttribute("msg", "��ӳɹ�");
		}else {
			saveAttribute("msg", "���ʧ��");
		}
		return "result";
	}

}
