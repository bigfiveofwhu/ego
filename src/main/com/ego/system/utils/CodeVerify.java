package com.ego.system.utils;

import javax.servlet.http.HttpSession;
import java.util.Date;

public class CodeVerify
{
	public static boolean verify(HttpSession session,String code)
	{
		 String oldCode=(String)session.getAttribute("regVerCode");
		 if(session.getAttribute("regVerCodeTime")==null)
		 	return false;
		 long time=(long)session.getAttribute("regVerCodeTime");
		 long internal=(long)session.getAttribute("internel");
		 long now=new Date().getTime();
		 if((now-time)>internal)
	    {
	    	return false;
	    }
		 else
	    {
	    	if(code.equalsIgnoreCase(oldCode))   //在此处验证, 通过后移除相应属性
	    	{
	    		session.removeAttribute("regVerCode");
	    		session.removeAttribute("regVerCodeTime");
	    		session.removeAttribute("internel");
		    	return true;
	    	}
	    	else
	    	{
	    		return false;
	    	}
	    }
	}
}
