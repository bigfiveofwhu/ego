package com.ego.controller.ajaxServlet.impl;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;



import com.ego.controller.ajaxServlet.AjaxControllerSupport;
import com.ego.system.tools.QiniuUpload;
import com.ego.system.tools.Tools;
import com.ego.system.utils.FileUpload;

public class FileUploadController extends AjaxControllerSupport {

	@Override
	public void execute(HttpSession session)
	{
		
		 HttpServletRequest request =(HttpServletRequest) this.dto.get("request");
		 String type = (String) this.dto.get("type");
		 String id = (String)this.dto.get("id");
		//文件名命名规则:类型+id
		 String fileName = type+"_"+id;
		 System.out.println(type);
		 try {
			FileUpload.writeFile(fileName, Tools.getImgPath(),request);
			//QiniuUpload.UploadPic("./WebContent/images/upload/user_8.jpg", fileName);
		} catch (ServletException | IOException e) {
			e.printStackTrace();
		}
	}
}
