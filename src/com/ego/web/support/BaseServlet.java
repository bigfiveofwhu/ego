package com.ego.web.support;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;
import java.util.Map.Entry;
import java.util.Set;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("*.html")
public class BaseServlet extends HttpServlet 
{
	private static final long serialVersionUID = -8551599489947913320L;

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException 
	{
		String toPath = null; // ��ת��Ŀ��ҳ��
		try 
		{
			/************************************************************
			 * ��������·��,��ȡĿ���������
			 ************************************************************/
			// ��������ķ���·��
			String uri = request.getRequestURI();
			// ��ȡ������Դ�����ļ���
			String baseName = uri.substring(uri.lastIndexOf("/") + 1).replace(".html", "");

			// �������,��������ҵ��������Ļ���������
			String basePackageName = "com.ego.web.impl.";
			// ��ȡ��������ǰ׺��
			String controllerFirstName = baseName.substring(0, 1).toUpperCase() + baseName.substring(1);

			/***********************************************************
			 * ʵ����Ŀ����---ҵ�������
			 ***********************************************************/
			// ʵ����ҵ�������
			BaseController controller = (BaseController) Class
					.forName(basePackageName + controllerFirstName + "Servlet").newInstance();

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
			request.setAttribute("msg", "��ʾ:�������!");
			ex.printStackTrace();
		}
		request.getRequestDispatcher("/" + toPath + ".jsp").forward(request, response);
	}

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
