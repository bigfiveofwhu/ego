package com.ego.system.utils;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.util.ResourceBundle;

import com.ego.system.tools.Tools;

public class SetDefaultImg
{
	private static String userPre="/WebContent/images/upload/user_";
	
	private static String shopPre="/WebContent/images/shop/shop_";
	
	private static String servicePre="/WebContent/images/service/service_";
	
	private static String advertiseImg="/WebContent/images/advertise";
	
	private static String defaultImg="/WebContent/images/no-img_mid_.jpg";
	
	private static String commentImg="/WebContent/images/comments";
	static {
		ResourceBundle mapping = ResourceBundle.getBundle("urlMapping");
		String basepath=mapping.getString("basePath");
		userPre=basepath+userPre;
		shopPre=basepath+shopPre;
		servicePre=basepath+servicePre;
		defaultImg=basepath+defaultImg;
		advertiseImg=basepath+advertiseImg;
		commentImg=basepath+commentImg;
	}
	
	public static String getBasePath(String roleName)
	{
		switch(roleName)
		{
		case "user":
		case "upload":
			return userPre;
		case "shop":
			return shopPre;
		case "service":
			return servicePre;
		case "advertise":
			return advertiseImg;
		case "comments":
			return commentImg;
		}
		return null;
	}
	
	public static void setDefImg(String id,String roleName,String savePath) throws Exception
	{
		String path="";
		switch(roleName)
		{
		case "user":
			path=userPre;
			break;
		case "shop":
			path=shopPre;
			break;
		case "service":
			path=servicePre;
			break;
		}
		if(path=="") throw new Exception("请选择正确的角色名称");
		path=path+id+".jpg";
		File file=new File(defaultImg);
		System.out.println(defaultImg);
		FileInputStream inputStream=new FileInputStream(file);
		File defImg=new File(path);
		FileOutputStream output=new FileOutputStream(defImg),
				output1=new FileOutputStream(savePath+"\\"+path.substring(path.lastIndexOf("/")+1));
		System.out.println(savePath+"\\"+path.substring(path.lastIndexOf("/")+1));
		byte[] buff=new byte[1024];
		int len;
		while((len=inputStream.read(buff))!=-1)
		{
			output.write(buff, 0, len);
			output1.write(buff, 0, len);
		}
		output1.close();
		output.close();
		inputStream.close();
	}
}
