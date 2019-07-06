package com.ego.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.nio.file.Path;
import java.util.Collections;
import java.util.HashMap;
import java.util.Map;
import java.util.Map.Entry;
import java.util.Properties;
import java.util.Set;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;



@WebServlet("*.html")
public class BaseServlet extends HttpServlet 
{
	
	private static final long serialVersionUID = 3420016669290706542L;
	
	
	//加载映射文件
	private static Properties mapping=new Properties();
	static {
		try {
			mapping.load(new FileInputStream("src/resources/urlMapping.properties"));
			
		} catch (FileNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	//controller的容器，管理所有controller
	Map<String,Controller > container= Collections.synchronizedMap(new HashMap<String, Controller>());
	
	private Controller getController(String className) throws Exception
	{
		Controller controller=container.get(className);
		if (controller==null) {
			controller=(Controller)Class.forName(className).newInstance();
			container.put(className, controller);
		}
		return controller;
	}
	
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException 
	{
		System.out.println("base servlet is called");
		String toPath = null; // 跳转的目标页面
		try 
		{
			/************************************************************
			 * 解析访问路径,获取目标类的名称
			 ************************************************************/
			// 拦截请求的访问路径
			String url = request.getServletPath();
			int endpos=url.indexOf(".html",url.lastIndexOf("/"));
			String mappingURL=url.substring(1, endpos);
			/***********************************************************
			 * 实例化目标类---业务控制器
			 ***********************************************************/
			// 实例化业务控制器
			String basePackage="com.ego.controller.";
			String className=basePackage+mapping.getProperty(mappingURL);
			Controller controller = getController(className);


			/***********************************************************
			 * 调用业务控制器的流程控制方法
			 ***********************************************************/
			// 调用流程控制方法
			toPath = controller.execute(request,response);
			if (toPath==null) {
				return;
			}
		} 
		catch (Exception ex)//此处添加404页面
		{
			request.setAttribute("msg", "提示:网络故障!");
			ex.printStackTrace();
		}
		request.getRequestDispatcher("/WEB-INF/views/" + toPath + ".jsp").forward(request, response);
	}


	
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException 
	{
		this.doGet(request, response);
	}
}
