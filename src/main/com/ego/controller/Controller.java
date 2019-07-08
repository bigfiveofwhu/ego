package com.ego.controller;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public interface Controller 
{
	
	/**
	 * ���ã�����һ�����󣬴���request�е����ݣ��������������ݷ���request��sessiong�У�Ȼ�󷵻���Ӧ����ͼ��
	 * @param request ���������Ҫ�Ĳ����ʹ��������ݶ�������
	 * @param response	��Ӧ����һ�㲻��Ҫ��
	 * @return ������Ӧ����ͼ������ͼȫ����views����
	 * @throws Exception
	 */
    String execute(HttpServletRequest request,HttpServletResponse response)throws Exception;

}
