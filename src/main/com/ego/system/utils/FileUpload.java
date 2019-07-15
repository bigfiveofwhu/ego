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
		           // ��ȡ�ϴ��ļ�Ŀ¼
		          String savePath = request.getServletContext().getRealPath("/upload");

		 
		          try {
		              // ʹ��Ĭ�����ô�������������
		              DiskFileItemFactory factory = new DiskFileItemFactory();
		              // ��ȡ������
		              ServletFileUpload upload = new ServletFileUpload(factory);
		              upload.setProgressListener(new ProgressListener() {
		                  @Override
		                  public void update(long l, long l1, int i) {
		                      System.out.println("�ļ���СΪ��" + l1 + ",��ǰ�Ѵ���" + l);
		                  }
		              });
		              // ����ϴ��ļ�����������������
		              upload.setHeaderEncoding("UTF-8");
		              // �ϴ����Ƿ�Ϊmultipart/form-data����
		              if (!ServletFileUpload.isMultipartContent(request)) {
		                  return;
		              }
		              // ����request��������
		              List<FileItem> fileItemList = upload.parseRequest(request);
		              // ����list����
		              for (FileItem fileItem : fileItemList) {
		                  if (fileItem.isFormField()) {
		                      // ��ͨ�ֶ�
		                     String name = fileItem.getName();
		                      // ����getString���ط���, ����ϴ����ݵ�������������
		                      String value = fileItem.getString("UTF-8");
		                     System.out.println(name + "=" + value);
		                  } else {
		                      // �ϴ��ļ�
		                      // ��ȡ�ϴ��ļ���
		                       String name = fileItem.getName();
		                     
		                      // input:fileû��ָ���ϴ��ļ�ʱ, ��������ѭ����������һ��ѭ��
		                      if(name == null && name.trim().equals("")) {
		                          continue;
		                      }
		                      //���ͼƬ����
		                      String suffix = name.substring(name.lastIndexOf("."));
		                      fileName=fileName+suffix;
		                      System.out.println(fileName);
		                      //fileName = fileName.substring(fileName.lastIndexOf("\\")+1);
		                      // ʹ��UUID��Ϊ�ϴ��ļ�������
		                      // fileName = makeFileName(fileName);
		                      // ��ȡ������
		                      in = fileItem.getInputStream();
		                   //   System.out.println("fileName"+fileName);
		                      // �ϴ��ļ�����������, ���ȴ���
		                      File savePathDir = new File(savePath);
		                      if (!savePathDir.exists()) {
		                          savePathDir.mkdir();
		                      }
		                     
		  
		                      // ��ȡ�����
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
       // ��ȡ�ϴ��ļ�Ŀ¼
      String savePath = "images/advertise/"+path;
      File file =new File(savePath);
      System.out.println(file.getAbsolutePath());
          try {
              // ʹ��Ĭ�����ô�������������
          DiskFileItemFactory factory = new DiskFileItemFactory();
          // ��ȡ������
          ServletFileUpload upload = new ServletFileUpload(factory);
          upload.setProgressListener(new ProgressListener() {
              @Override
              public void update(long l, long l1, int i) {
                  System.out.println("�ļ���СΪ��" + l1 + ",��ǰ�Ѵ���" + l);
              }
          });
          // ����ϴ��ļ�����������������
          upload.setHeaderEncoding("UTF-8");
          // �ϴ����Ƿ�Ϊmultipart/form-data����
          if (!ServletFileUpload.isMultipartContent(request)) {
              return;
          }
          // ����request��������
          List<FileItem> fileItemList = upload.parseRequest(request);
          // ����list����
          for (FileItem fileItem : fileItemList) {
              if (fileItem.isFormField()) {
                  // ��ͨ�ֶ�
                 String name = fileItem.getName();
                  // ����getString���ط���, ����ϴ����ݵ�������������
                  String value = fileItem.getString("UTF-8");
                 System.out.println(name + "=" + value);
              } else {
                  // �ϴ��ļ�
                  // ��ȡ�ϴ��ļ���
                   String name = fileItem.getName();
                 
                  // input:fileû��ָ���ϴ��ļ�ʱ, ��������ѭ����������һ��ѭ��
                  if(name == null && name.trim().equals("")) {
                      continue;
                  }
                  //���ͼƬ����
                  String suffix = name.substring(name.lastIndexOf("."));
                  fileName=fileName+suffix;
                  System.out.println(fileName);
                  //fileName = fileName.substring(fileName.lastIndexOf("\\")+1);
                  // ʹ��UUID��Ϊ�ϴ��ļ�������
                  // fileName = makeFileName(fileName);
                  // ��ȡ������
                  in = fileItem.getInputStream();
               //   System.out.println("fileName"+fileName);
                  // �ϴ��ļ�����������, ���ȴ���
                      File savePathDir = new File(savePath);
                      if (!savePathDir.exists()) {
                          savePathDir.mkdir();
                      }
                     
  
                      // ��ȡ�����
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
