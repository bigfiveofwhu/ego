package com.ego.system.tools;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServlet;

import com.ego.system.db.DBUtils;

@WebFilter("/*")
public class ConnectionFilter extends HttpServlet implements Filter 
{
	private static final long serialVersionUID = 6549708767239323680L;

	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException 
	{
		try 
		{
			request.setCharacterEncoding("GBK");
			response.setCharacterEncoding("UTF-8");
			chain.doFilter(request, response);
		} 
		finally
		{
			DBUtils.close();
		}
	}

	public void init(FilterConfig fConfig) throws ServletException 
	{
	}
}
