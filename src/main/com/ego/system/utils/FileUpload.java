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
		                      if(name == null || name.trim().equals("")) {
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
		                     
		                      System.out.println(savePathDir.getAbsolutePath());
		                      //��eclipse�����ͼƬ
		                      String ecliPath=SetDefaultImg.getBasePath(savePath.substring(savePath.lastIndexOf("\\")+1));
		                      if(ecliPath!=null)
		                      {
			                      out1 = new FileOutputStream(ecliPath+fileName.substring(fileName.indexOf("_")+1));
			                      System.out.println(ecliPath+"\\"+fileName.substring(fileName.indexOf("_")+1));
		                      }
		                      // ��ȡ�����
		                      out = new FileOutputStream(savePath + "\\" + fileName);
		                      int len = 0;
		                      byte[] buffer = new byte[1024];
		                      if(out1==null)
		                      {
			                      while((len=in.read(buffer)) > 0) {
			                          out.write(buffer, 0, len);
			                      }
		                      }else    //��eclipse��д��ͼƬ
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
	 * @param fileName �ļ����֣���������׺
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
       // ��ȡ�ϴ��ļ�Ŀ¼
       //String savePath = request.getServletContext().getRealPath("/images/advertise");
       String savePath="WebContent/images/advertise";
       System.out.println(savePath);
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
              return ;
          }
          // ����request��������
          List<FileItem> fileItemList = upload.parseRequest(request);
          // ����list����
          for (FileItem fileItem : fileItemList) {
              if (fileItem.isFormField()) {
                  // ��ͨ�ֶ�
                 String name = fileItem.getFieldName();
                 
                  // ����getString���ط���, ����ϴ����ݵ�������������
                  String value = fileItem.getString("UTF-8");
                  dto.put(name, value);
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
                  realName=fileName+suffix;
                  dto.put("aad307",realName);
                  System.out.println("�ļ���Ϊ��"+realName);
                  //fileName = fileName.substring(fileName.lastIndexOf("\\")+1);
                  // ʹ��UUID��Ϊ�ϴ��ļ�������
                  // fileName = makeFileName(fileName);
                  // ��ȡ������
                  in = fileItem.getInputStream();
                  //System.out.println("fileName"+fileName);
                  // �ϴ��ļ�����������, ���ȴ���
                      File savePathDir = new File(savePath);
                      System.out.println(savePathDir.getAbsolutePath());
                      if (!savePathDir.exists()) {
                          savePathDir.mkdir();
                      }
                     
  
                      // ��ȡ�����
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
        //�ļ�����

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
	 * @param fileName �ļ����֣���������׺
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
       // ��ȡ�ϴ��ļ�Ŀ¼
       //String savePath = request.getServletContext().getRealPath("/images/advertise");
       System.out.println(savePath);
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
              return ;
          }
          // ����request��������
          List<FileItem> fileItemList = upload.parseRequest(request);
          // ����list����
          for (FileItem fileItem : fileItemList) {
              if (fileItem.isFormField()) {
                  // ��ͨ�ֶ�
                 String name = fileItem.getFieldName();
                 
                  // ����getString���ط���, ����ϴ����ݵ�������������
                  String value = fileItem.getString("UTF-8");
                  dto.put(name, value);
                 System.out.println(name + "=" + value);
              } else {
            	  dto.put("aab412", "01");//01��ͼ
                  // �ϴ��ļ�
                  // ��ȡ�ϴ��ļ���
                   String name = fileItem.getName();
                  // input:fileû��ָ���ϴ��ļ�ʱ, ��������ѭ����������һ��ѭ��
                  if(name == null && name.trim().equals("")) {
                      continue;
                  }
                  //���ͼƬ����
                  realName=fileName;
                  System.out.println("�ļ���Ϊ��"+realName);
                  //fileName = fileName.substring(fileName.lastIndexOf("\\")+1);
                  // ʹ��UUID��Ϊ�ϴ��ļ�������
                  // fileName = makeFileName(fileName);
                  // ��ȡ������
                  in = fileItem.getInputStream();
                  //System.out.println("fileName"+fileName);
                  // �ϴ��ļ�����������, ���ȴ���
                      File savePathDir = new File(savePath);
                      System.out.println(savePathDir.getAbsolutePath());
                      if (!savePathDir.exists()) {
                          savePathDir.mkdir();
                      }
                      // ��ȡ�����
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
