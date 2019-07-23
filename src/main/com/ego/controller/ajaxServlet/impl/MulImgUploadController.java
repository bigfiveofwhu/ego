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
		base64= base64.substring(base64.indexOf(",")+1);//��ȡ
		String name = FileUpload.BASE64CodeToBeImage(base64, Tools.getImgPath(), "jpg");//����base64,���ͼƬ����
		this.dto.put("imgPath", "/images/upload/"+name);
		if(this.get("type").equals("shop"))//��ƷͼƬ
		{
          this.getService().update("saveShopImg");
          this.put("tag", 1);
          System.out.println(name);
		}
		
		if(this.get("type").equals("spec"))//����ͼƬ
		{
			this.getService().update("saveSpecImg");
			this.put("tag", 1);
		}
	}

}
