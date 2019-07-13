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
	 * DTO切片
	 * 
	 * @param request
	 * @return
	 */
	private Map<String, Object> createDto(HttpServletRequest request) 
	{
		// 1.获取页面数据
		Map<String, String[]> tem = request.getParameterMap();
		int initSize = ((int) (tem.size() / 0.75)) + 1;
		// 2.导出所有键值对,形成键值对集合
		Set<Entry<String, String[]>> entrySet = tem.entrySet();
		// 3.定义数组,表示Enetry的value部分
		String value[] = null;

		// 4.定义DTO容器
		Map<String, Object> dto = new HashMap<>(initSize);
		// 5.循环读取entrySet,获取每个键值对
		for (Entry<String, String[]> entry : entrySet) 
		{
			// 获取value部分的数组
			value = entry.getValue();
			// 依据长度判断页面控件的类别
			if (value.length == 1) // 非checkbox类控件
			{
				// 过滤掉页面未填充项目
				if (value[0] != null && !value[0].equals(""))
				{
					dto.put(entry.getKey(), value[0]);
				}
			}
			else // checkbox类控件
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
