package com.ego.controller.ajaxServlet.impl;

import java.util.Map;

import javax.servlet.http.HttpSession;

import com.ego.controller.ajaxServlet.AjaxControllerSupport;
import com.ego.services.impl.ProductManageServicesImpl;

public class PutOffGoodsController extends AjaxControllerSupport {

	@Override
	public void execute(HttpSession session) throws Exception {
         this.setService(new ProductManageServicesImpl());
         switch ((String)this.get("type"))
         {
			case "putoff":
				if( this.getService().update("putOffSale"))
		        	 this.put("tag", 1);
		         else
		        	 this.put("tag", 0);
				break;
			case "del":
				if( this.getService().update("deleteById"))
		        	 this.put("tag", 1);
		         else
		        	 this.put("tag", 0);
				break;
			case "pro":
				Map<String,String> map = this.getService().findById();
				this.put("map", map);
				this.put("tag", 1);
				break;
			default:
				break;
		}
        
	}

}
