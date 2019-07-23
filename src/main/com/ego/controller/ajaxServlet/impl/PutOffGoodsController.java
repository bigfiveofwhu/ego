package com.ego.controller.ajaxServlet.impl;

import java.util.Map;

import javax.servlet.http.HttpSession;

import com.ego.controller.ajaxServlet.AjaxControllerSupport;
import com.ego.services.impl.ProductManageServicesImpl;
import com.ego.system.tools.Tools;

public class PutOffGoodsController extends AjaxControllerSupport {

	@Override
	public void execute(HttpSession session) throws Exception {
         this.setService(new ProductManageServicesImpl());
         switch ((String)this.get("type"))
         {
			case "putoff"://ÏÂ¼Ü
				if( this.getService().update("putOffSale"))
		        	 this.put("tag", 1);
		         else
		        	 this.put("tag", 0);
				break;
			case "del"://É¾³ý
				if( this.getService().update("deleteById"))
		        	 this.put("tag", 1);
		         else
		        	 this.put("tag", 0);
				break;
			case "pro"://ÏêÇé
				Map<String,String> map = this.getService().findById();
				//String code = map.get("aab204");
				//map.put("acnaab204", Tools.getTriSort(code));
				this.put("map", map);
				this.put("tag", 1);
				break;
			case "img"://Í¼Æ¬
				Map<String,String> map1 = this.getService().findById("getProImgPath");
				String proPath = map1.get("aab208");
				String specPath = map1.get("aab207");
				String [] proimgs = proPath.split(";");
				specPath = specPath.substring(specPath.indexOf("&")+1);
				String[]  specimgs = specPath.split(";");
				
				this.put("proimgUrl", proimgs);
				this.put("specimgUrl", specimgs);
				break;
			case "update"://ÐÞ¸Ä
				if( this.getService().update("updateById"))
		        	 this.put("tag", 1);
		         else
		        	 this.put("tag", 0);
				break;
			default:
				break;
		}
        
	}

}
