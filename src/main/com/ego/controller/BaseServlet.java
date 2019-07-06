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
	
	
	//����ӳ���ļ�
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
	//controller����������������controller
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
		String toPath = null; // ��ת��Ŀ��ҳ��
		try 
		{
			/************************************************************
			 * ��������·��,��ȡĿ���������
			 ************************************************************/
			// ��������ķ���·��
			String url = request.getServletPath();
			int endpos=url.indexOf(".html",url.lastIndexOf("/"));
			String mappingURL=url.substring(1, endpos);
			/***********************************************************
			 * ʵ����Ŀ����---ҵ�������
			 ***********************************************************/
			// ʵ����ҵ�������
			String basePackage="com.ego.controller.";
			String className=basePackage+mapping.getProperty(mappingURL);
			Controller controller = getController(className);


			/***********************************************************
			 * ����ҵ������������̿��Ʒ���
			 ***********************************************************/
			// �������̿��Ʒ���
			toPath = controller.execute(request,response);
			if (toPath==null) {
				return;
			}
		} 
		catch (Exception ex)//�˴����404ҳ��
		{
			request.setAttribute("msg", "��ʾ:�������!");
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
