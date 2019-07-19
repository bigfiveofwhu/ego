/**
 * @author hug
 * �������첽���ݷ���
 */
package com.ego.controller.ajaxServlet.impl;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import com.ego.controller.ajaxServlet.AjaxControllerSupport;
import com.ego.services.impl.Ac01ServiceImpl;

public class ServiceController extends AjaxControllerSupport
{

	@Override
	public void execute(HttpSession session) throws Exception
	{
		String type=(String)this.get("type");
		String location=(String)this.get("location");
		System.out.println(type+", ��ַ ,"+location);
		this.dto.put("location", "%"+location.substring(0, location.length()-1)+"%");
		this.setService(new Ac01ServiceImpl());
		if(type.equals("1"))  //������������������
		{
			//��������������
			List<Map<String,String>> rows=this.getService().query("queryByUpToDate");
			this.put("services", rows);
		}
	}

}
