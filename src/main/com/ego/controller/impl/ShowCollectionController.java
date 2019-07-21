package com.ego.controller.impl;

import java.util.List;
import java.util.Map;

import com.ego.controller.ControllerSupport;
import com.ego.services.impl.Aa03ServiceImpl;

public class ShowCollectionController extends ControllerSupport {

	@Override
	public String execute() throws Exception {
		this.setServices(new Aa03ServiceImpl());
		List<Map<String,String>> proList = this.getServices().query("product");
		List<Map<String,String>> shopList = this.getServices().query("shop");
		this.saveAttribute("proList", proList); //�ղ���Ʒ
		this.saveAttribute("shopList", shopList); //�ղ�����
		return "person/collection";
	}

}
