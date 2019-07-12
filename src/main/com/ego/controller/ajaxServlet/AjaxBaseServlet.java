package com.ego.controller.ajaxServlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.Map;
import java.util.Set;
import java.util.Map.Entry;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("*.ajax")
public class AjaxBaseServlet extends HttpServlet 
{
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		try
		{
			String url=request.getServletPath();
			
			String name=url.substring(url.lastIndexOf("/")+1).replace(".ajax", "");
			
			name=Character.toUpperCase(name.charAt(0))+name.substring(1);
			
			String className="com.ego.controller.ajaxServlet.impl."+name+"Controller";
			
			AjaxController controller=(AjaxController)Class.forName(className).newInstance();
			
			Map<String,Object> dto=this.createDto(request);
			
			dto.put("request", request);
			
			controller.setMap(dto);
			
			controller.execute(request.getSession());
			
			PrintWriter out=response.getWriter();
			
			out.print(controller.getJSON().toJSONString());
		}
		catch (InstantiationException e) 
		{
			e.printStackTrace();
		}
		catch (IllegalAccessException e) 
		{
			e.printStackTrace();
		}
		catch (ClassNotFoundException e) 
		{
			e.printStackTrace();
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
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
		// System.out.println(dto);
		return dto;
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		this.doGet(request, response);
	}

}
