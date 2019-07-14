package com.ego.controller.ajaxServlet.impl;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.ProgressListener;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import com.ego.controller.ajaxServlet.AjaxControllerSupport;
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
			FileUpload.writeFile(fileName,request);
		} catch (ServletException | IOException e) {
			e.printStackTrace();
		}
	}
}
