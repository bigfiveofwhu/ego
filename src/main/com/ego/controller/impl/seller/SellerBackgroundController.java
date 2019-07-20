package com.ego.controller.impl.seller;

import com.ego.controller.ControllerSupport;
import com.ego.services.impl.ShopManageServicesImpl;

public class SellerBackgroundController extends ControllerSupport{

	
	public SellerBackgroundController()
	{
		this.setServices(new ShopManageServicesImpl());
	}
	@Override

	public String execute() throws Exception
	{
		//����Ƿ�����ʸ�����ʸ�
	    if(this.getServices().update("checkIn"))
		return "houtai/html/seller/sellerpage/index";
	    else
	    	return null;
	    	
	}
	
}
