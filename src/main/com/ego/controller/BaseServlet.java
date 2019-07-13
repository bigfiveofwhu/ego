package com.ego.controller;

import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.util.Collections;
import java.util.Enumeration;
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
import javax.servlet.http.HttpSession;



@WebServlet("*.html")
public class BaseServlet extends HttpServlet 
{
	
	private static final long serialVersionUID = 3420016669290706542L;
	
	public static final String prefix="WEB-INF/views/";
	//����ӳ���ļ�
	private static Properties mapping=new Properties();
	static 
	{
		try 
		{
			mapping.load(new FileInputStream("src/resources/urlMapping.properties"));
			
		} catch (FileNotFoundException e) 
		{
			e.printStackTrace();
		} catch (IOException e) 
		{
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
			String basePackage="com.ego.controller.impl.";
			String className=basePackage+mapping.getProperty(mappingURL);
			Controller controller = getController(className);

			/***********************************************************
			 * ��ҵ�������,���ҳ������ i
			 ***********************************************************/
			// Ϊҵ�������֯��DTO��Ƭ
			controller.setMapDto(this.createDto(request));

			/***********************************************************
			 * ����ҵ������������̿��Ʒ���
			 ***********************************************************/
			// �������̿��Ʒ���
			toPath = controller.execute();

			/***********************************************************
			 * �����������ҳ����������� o
			 ***********************************************************/
			// ��������
			Map<String, Object> rueqestAttribute = controller.getAttribute();
			// ֯�����Դ�����Ƭ
			this.parseRueqestAttribute(request, rueqestAttribute);
		}
		catch (Exception ex)
		{
			request.setAttribute("msg", ex.getMessage());
			ex.printStackTrace();
			toPath=BaseServlet.prefix+"error";
		}
		
		request.getRequestDispatcher("/" + toPath + ".jsp").forward(request, response);
	}
	/**
	 * attribute��Ƭ
	 * @param request
	 * @param rueqestAttribute
	 */
	private void parseRueqestAttribute(HttpServletRequest request, Map<String, Object> rueqestAttribute) 
	{
		// 1.��ԭ���еļ�ֵ��,�γɼ���
		Set<Map.Entry<String, Object>> entrySet = rueqestAttribute.entrySet();
		// 2.ѭ������
		for (Map.Entry<String, Object> entry : entrySet)
		{
			// 3.��map��ÿ����ֵ��,ת����request������
			request.setAttribute(entry.getKey(), entry.getValue());
		}
		// ������е�request����������
		rueqestAttribute.clear();
	}

	/**
	 * DTO��Ƭ
	 * 
	 * @param request
	 * @return
	 */
	private Map<String, Object> createDto(HttpServletRequest request) 
	{
		// 1.��ȡҳ������
		Map<String, String[]> tem = request.getParameterMap();
		
		int initSize = ((int) (tem.size() / 0.75)) + 1;
		// 2.�������м�ֵ��,�γɼ�ֵ�Լ���
		Set<Entry<String, String[]>> entrySet = tem.entrySet();
		// 3.��������,��ʾEnetry��value����
		String value[] = null;

		// 4.����DTO����
		Map<String, Object> dto = new HashMap<>(initSize);
		// 5.ѭ����ȡentrySet,��ȡÿ����ֵ��
		for (Entry<String, String[]> entry : entrySet) 
		{
			// ��ȡvalue���ֵ�����
			value = entry.getValue();
			// ���ݳ����ж�ҳ��ؼ������
			if (value.length == 1) // ��checkbox��ؼ�
			{
				// ���˵�ҳ��δ�����Ŀ
				if (value[0] != null && !value[0].equals(""))
				{
					dto.put(entry.getKey(), value[0]);
				}
			}
			else // checkbox��ؼ�
			{
				dto.put(entry.getKey(), value);
			}
		}
		HttpSession session=request.getSession();
		Enumeration<String> attributes=session.getAttributeNames();
		while (attributes.hasMoreElements()) {
			String name = attributes.nextElement();
			dto.put(name, session.getAttribute(name));
		}
		//����request����
		dto.put("request", request);
		// System.out.println(dto);
		return dto;
	}
	
	
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException 
	{
		this.doGet(request, response);
	}
}
