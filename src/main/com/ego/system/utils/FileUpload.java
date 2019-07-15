package com.ego.system.utils;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.List;
import java.util.UUID;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.ProgressListener;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;



public class FileUpload 
{
   
	public static void writeFile(String fileName,HttpServletRequest request) throws ServletException, IOException 
	{
	
                   InputStream in = null;
		           OutputStream out = null;
		           // 获取上传文件目录
		          String savePath = request.getServletContext().getRealPath("/upload");

		 
		          try {
		              // 使用默认配置创建解析器工厂
		              DiskFileItemFactory factory = new DiskFileItemFactory();
		              // 获取解析器
		              ServletFileUpload upload = new ServletFileUpload(factory);
		              upload.setProgressListener(new ProgressListener() {
		                  @Override
		                  public void update(long l, long l1, int i) {
		                      System.out.println("文件大小为：" + l1 + ",当前已处理：" + l);
		                  }
		              });
		              // 解决上传文件名的中文乱码问题
		              upload.setHeaderEncoding("UTF-8");
		              // 上传表单是否为multipart/form-data类型
		              if (!ServletFileUpload.isMultipartContent(request)) {
		                  return;
		              }
		              // 解析request的输入流
		              List<FileItem> fileItemList = upload.parseRequest(request);
		              // 迭代list集合
		              for (FileItem fileItem : fileItemList) {
		                  if (fileItem.isFormField()) {
		                      // 普通字段
		                     String name = fileItem.getName();
		                      // 调用getString重载方法, 解决上传数据的中文乱码问题
		                      String value = fileItem.getString("UTF-8");
		                     System.out.println(name + "=" + value);
		                  } else {
		                      // 上传文件
		                      // 获取上传文件名
		                       String name = fileItem.getName();
		                     
		                      // input:file没有指定上传文件时, 结束本次循环并继续下一次循环
		                      if(name == null && name.trim().equals("")) {
		                          continue;
		                      }
		                      //获得图片类型
		                      String suffix = name.substring(name.lastIndexOf("."));
		                      fileName=fileName+suffix;
		                      System.out.println(fileName);
		                      //fileName = fileName.substring(fileName.lastIndexOf("\\")+1);
		                      // 使用UUID作为上传文件的名称
		                      // fileName = makeFileName(fileName);
		                      // 获取输入流
		                      in = fileItem.getInputStream();
		                   //   System.out.println("fileName"+fileName);
		                      // 上传文件名若不存在, 则先创建
		                      File savePathDir = new File(savePath);
		                      if (!savePathDir.exists()) {
		                          savePathDir.mkdir();
		                      }
		                     
		  
		                      // 获取输出流
		                      out = new FileOutputStream(savePath + "\\" + fileName);
		                      int len = 0;
		                      byte[] buffer = new byte[1024];
		                      while((len=in.read(buffer)) > 0) {
		                          out.write(buffer, 0, len);
		                      }
		                  }
		              }
		          //    System.out.println("success");
		          } catch (Exception e) {
		              e.printStackTrace();
		          } finally {
		              if (in != null) {
		                  in.close();
		              }
		              if (out != null) {
		                  out.close();
		             }
		         }		  
		      }
	
	public static void writeFile(String fileName,HttpServletRequest request,String path) throws ServletException, IOException 
	{
	
       InputStream in = null;
       OutputStream out = null;
       // 获取上传文件目录
      String savePath = "images/advertise/"+path;
      File file =new File(savePath);
      System.out.println(file.getAbsolutePath());
          try {
              // 使用默认配置创建解析器工厂
          DiskFileItemFactory factory = new DiskFileItemFactory();
          // 获取解析器
          ServletFileUpload upload = new ServletFileUpload(factory);
          upload.setProgressListener(new ProgressListener() {
              @Override
              public void update(long l, long l1, int i) {
                  System.out.println("文件大小为：" + l1 + ",当前已处理：" + l);
              }
          });
          // 解决上传文件名的中文乱码问题
          upload.setHeaderEncoding("UTF-8");
          // 上传表单是否为multipart/form-data类型
          if (!ServletFileUpload.isMultipartContent(request)) {
              return;
          }
          // 解析request的输入流
          List<FileItem> fileItemList = upload.parseRequest(request);
          // 迭代list集合
          for (FileItem fileItem : fileItemList) {
              if (fileItem.isFormField()) {
                  // 普通字段
                 String name = fileItem.getName();
                  // 调用getString重载方法, 解决上传数据的中文乱码问题
                  String value = fileItem.getString("UTF-8");
                 System.out.println(name + "=" + value);
              } else {
                  // 上传文件
                  // 获取上传文件名
                   String name = fileItem.getName();
                 
                  // input:file没有指定上传文件时, 结束本次循环并继续下一次循环
                  if(name == null && name.trim().equals("")) {
                      continue;
                  }
                  //获得图片类型
                  String suffix = name.substring(name.lastIndexOf("."));
                  fileName=fileName+suffix;
                  System.out.println(fileName);
                  //fileName = fileName.substring(fileName.lastIndexOf("\\")+1);
                  // 使用UUID作为上传文件的名称
                  // fileName = makeFileName(fileName);
                  // 获取输入流
                  in = fileItem.getInputStream();
               //   System.out.println("fileName"+fileName);
                  // 上传文件名若不存在, 则先创建
                      File savePathDir = new File(savePath);
                      if (!savePathDir.exists()) {
                          savePathDir.mkdir();
                      }
                     
  
                      // 获取输出流
                  out = new FileOutputStream(savePath + "\\" + fileName);
                  int len = 0;
                  byte[] buffer = new byte[1024];
                  while((len=in.read(buffer)) > 0) {
                      out.write(buffer, 0, len);
                  }
              }
          }
      //    System.out.println("success");
      } catch (Exception e) {
          e.printStackTrace();
      } finally {
          if (in != null) {
              in.close();
          }
          if (out != null) {
              out.close();
         }
     }		  
  }
}
