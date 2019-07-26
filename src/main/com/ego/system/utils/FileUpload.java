package com.ego.system.utils;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.List;
import java.util.Map;
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

import sun.misc.BASE64Decoder;



public class FileUpload 
{
   
	public static void writeFile(String fileName,String savePath,HttpServletRequest request) throws ServletException, IOException 
	{
	

                   InputStream in = null;
		           OutputStream out = null;
                   FileOutputStream out1=null;
		         
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
		                      if(name == null || name.trim().equals("")) {
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
		                     
		                      System.out.println(savePathDir.getAbsolutePath());
		                      //在eclipse中输出图片
		                      String ecliPath=SetDefaultImg.getBasePath(savePath.substring(savePath.lastIndexOf("\\")+1));
		                      if(ecliPath!=null)
		                      {
			                      out1 = new FileOutputStream(ecliPath+fileName.substring(fileName.indexOf("_")+1));
			                      System.out.println(ecliPath+"\\"+fileName.substring(fileName.indexOf("_")+1));
		                      }
		                      // 获取输出流
		                      out = new FileOutputStream(savePath + "\\" + fileName);
		                      int len = 0;
		                      byte[] buffer = new byte[1024];
		                      if(out1==null)
		                      {
			                      while((len=in.read(buffer)) > 0) {
			                          out.write(buffer, 0, len);
			                      }
		                      }else    //在eclipse中写入图片
		                      {
			                      while((len=in.read(buffer)) > 0) {
			                          out.write(buffer, 0, len);
			                          out1.write(buffer, 0, len);
			                      }
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
		              if(out1 != null) {
		            	  out1.close();
		              }
		         }		  
		      }

	
	
	/**
	 * 
	 * @param fileName 文件名字，不包括后缀
	 * @param request
	 * @param dto
	 * @throws ServletException
	 * @throws IOException
	 */
	public static void writeFile(String fileName,HttpServletRequest request,Map<String, Object> dto) throws ServletException, IOException 
	{
       InputStream in = null;
       OutputStream out = null;
       String realName=null;
       // 获取上传文件目录
       //String savePath = request.getServletContext().getRealPath("/images/advertise");
       String savePath="WebContent/images/advertise";
       System.out.println(savePath);
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
              return ;
          }
          // 解析request的输入流
          List<FileItem> fileItemList = upload.parseRequest(request);
          // 迭代list集合
          for (FileItem fileItem : fileItemList) {
              if (fileItem.isFormField()) {
                  // 普通字段
                 String name = fileItem.getFieldName();
                 
                  // 调用getString重载方法, 解决上传数据的中文乱码问题
                  String value = fileItem.getString("UTF-8");
                  dto.put(name, value);
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
                  realName=fileName+suffix;
                  dto.put("aad307",realName);
                  System.out.println("文件名为："+realName);
                  //fileName = fileName.substring(fileName.lastIndexOf("\\")+1);
                  // 使用UUID作为上传文件的名称
                  // fileName = makeFileName(fileName);
                  // 获取输入流
                  in = fileItem.getInputStream();
                  //System.out.println("fileName"+fileName);
                  // 上传文件名若不存在, 则先创建
                      File savePathDir = new File(savePath);
                      System.out.println(savePathDir.getAbsolutePath());
                      if (!savePathDir.exists()) {
                          savePathDir.mkdir();
                      }
                     
  
                      // 获取输出流
                      String outPath=savePath + "\\" + realName;
                      System.out.println(outPath);
                  out = new FileOutputStream(outPath);
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
    
	public static String BASE64CodeToBeImage(String BASE64str,String path,String ext){
		File fileDir = new File(path);
		if (!fileDir.exists()) {
			fileDir.setWritable(true);
			fileDir.mkdirs();
		}
        //文件名称

		String uploadFileName = UUID.randomUUID().toString() + "."+ext;
		File targetFile = new File(path, uploadFileName);
		BASE64Decoder decoder = new BASE64Decoder();
		try(OutputStream out = new FileOutputStream(targetFile)){
			byte[] b = decoder.decodeBuffer(BASE64str);
			for (int i = 0; i <b.length ; i++) {
				if (b[i] <0) {
					b[i]+=256;
				}
			}
			out.write(b);
			out.flush();
			return  uploadFileName;
		}catch (Exception e){
			e.printStackTrace();
			return null;
		}

    }
	
	/**
	 * 
	 * @param fileName 文件名字，不包括后缀
	 * @param request
	 * @param dto
	 * @throws ServletException
	 * @throws IOException
	 */
	public static void writeFile2(String savePath,String fileName,HttpServletRequest request,Map<String, Object> dto) throws ServletException, IOException 
	{
       InputStream in = null;
       OutputStream out = null;
       String realName=null;
       // 获取上传文件目录
       //String savePath = request.getServletContext().getRealPath("/images/advertise");
       System.out.println(savePath);
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
              return ;
          }
          // 解析request的输入流
          List<FileItem> fileItemList = upload.parseRequest(request);
          // 迭代list集合
          for (FileItem fileItem : fileItemList) {
              if (fileItem.isFormField()) {
                  // 普通字段
                 String name = fileItem.getFieldName();
                 
                  // 调用getString重载方法, 解决上传数据的中文乱码问题
                  String value = fileItem.getString("UTF-8");
                  dto.put(name, value);
                 System.out.println(name + "=" + value);
              } else {
            	  dto.put("aab412", "01");//01有图
                  // 上传文件
                  // 获取上传文件名
                   String name = fileItem.getName();
                  // input:file没有指定上传文件时, 结束本次循环并继续下一次循环
                  if(name == null && name.trim().equals("")) {
                      continue;
                  }
                  //获得图片类型
                  realName=fileName;
                  System.out.println("文件名为："+realName);
                  //fileName = fileName.substring(fileName.lastIndexOf("\\")+1);
                  // 使用UUID作为上传文件的名称
                  // fileName = makeFileName(fileName);
                  // 获取输入流
                  in = fileItem.getInputStream();
                  //System.out.println("fileName"+fileName);
                  // 上传文件名若不存在, 则先创建
                      File savePathDir = new File(savePath);
                      System.out.println(savePathDir.getAbsolutePath());
                      if (!savePathDir.exists()) {
                          savePathDir.mkdir();
                      }
                      // 获取输出流
                      String outPath=savePath + "\\" + realName;
                      System.out.println(outPath);
                  out = new FileOutputStream(outPath);
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
