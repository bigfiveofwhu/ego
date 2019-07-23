package com.ego.controller.ajaxServlet.impl;

import javax.servlet.http.HttpSession;

import com.ego.controller.ajaxServlet.AjaxControllerSupport;
import com.ego.services.impl.ProductManageServicesImpl;
import com.ego.system.tools.Tools;
import com.ego.system.utils.FileUpload;

public class MulImgUploadController extends AjaxControllerSupport {

	@Override
	public void execute(HttpSession session) throws Exception
	{
		this.setService(new ProductManageServicesImpl());
		System.out.println("myDTO:"+this.dto);
		String type = (String)this.get("type");
		String base64 = (String)this.get("base64");
		base64= base64.substring(base64.indexOf(",")+1);//截取
		String name = FileUpload.BASE64CodeToBeImage(base64, Tools.getImgPath(), "jpg");//解析base64,获得图片名字
		this.dto.put("imgPath", "/images/upload/"+name);
		if(this.get("type").equals("shop"))//商品图片
		{
          this.getService().update("saveShopImg");
          this.put("tag", 1);
          System.out.println(name);
		}
		
		if(this.get("type").equals("spec"))//详情图片
		{
			this.getService().update("saveSpecImg");
			this.put("tag", 1);
		}
	}

}
