package com.ego.controller.ajaxServlet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.Map;
import java.util.Map.Entry;
import java.util.Set;

@WebServlet("*.ajax")
public class AjaxBaseServlet extends HttpServlet 
{
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		try
		{
			request.setCharacterEncoding("UTF-8");
			String url=request.getServletPath();
			
			String name=url.substring(url.lastIndexOf("/")+1).replace(".ajax", "");
			
			name=Character.toUpperCase(name.charAt(0))+name.substring(1);
			
			String className="com.ego.controller.ajaxServlet.impl."+name+"Controller";
			
			AjaxController controller=(AjaxController)Class.forName(className).newInstance();
			
			Map<String,Object> dto=this.createDto(request);
			
			dto.put("request", request);
			
			controller.setMap(dto);
			
			controller.execute(request.getSession());

			response.setCharacterEncoding("UTF-8");

			PrintWriter out=response.getWriter();
			
			out.print(controller.getJSON().toJSONString());
		}
		catch (Exception e)
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

		HttpSession session = request.getSession();
        Enumeration<String> attributes = session.getAttributeNames();
        while (attributes.hasMoreElements())
        {
            String name = attributes.nextElement();
            dto.put(name, session.getAttribute(name));
        }
		// System.out.println(dto);
		return dto;
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		this.doGet(request, response);
	}

}
