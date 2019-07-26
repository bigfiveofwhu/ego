package com.ego.system.utils;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.util.ResourceBundle;

public class SetDefaultImg
{
	private static String userPre="/WebContent/images/upload/user_";
	
	private static String shopPre="/WebContent/images/shop/shop_";
	
	private static String servicePre="/WebContent/images/service/service_";
	
	private static String defaultImg="/WebContent/images/no-img_mid_.jpg";
	
	static {
		ResourceBundle mapping = ResourceBundle.getBundle("urlMapping");
		String basepath=mapping.getString("basePath");
		userPre=basepath+userPre;
		shopPre=basepath+shopPre;
		servicePre=basepath+servicePre;
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
		}
		return null;
	}
	
	public static void setDefImg(String id,String roleName) throws Exception
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
		path+=id+".jpg";
		File file=new File(defaultImg);
		FileInputStream inputStream=new FileInputStream(file);
		File defImg=new File(path);
		FileOutputStream output=new FileOutputStream(defImg);
		byte[] buff=new byte[1024];
		int len;
		while((len=inputStream.read(buff))!=-1)
		{
			output.write(buff, 0, len);
		}
		output.close();
		inputStream.close();
	}
}
