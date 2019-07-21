package com.ego.controller.ajaxServlet.impl;

import java.util.Map;

import javax.servlet.http.HttpSession;

import com.ego.controller.ajaxServlet.AjaxControllerSupport;
import com.ego.services.impl.Ac03ServiceImpl;

public class RequireController extends AjaxControllerSupport
{

	@Override
	public void execute(HttpSession session) throws Exception
	{
		String type=(String)this.get("type");
		if(type.equals("1"))   //����id�Ĳ�ѯ  ���ܴ���/������
		{
			this.setService(new Ac03ServiceImpl());
			Map<String,String> ins=this.getService().findById("findAac302ByAac602");
			if(ins==null)
			{
				this.put("status", "00");
			}else
			{
				this.put("status", "01");
				this.put("aac302", ins.get("aac302"));
			}
		}else if(type.equals("2"))  //���ݾ���id��ѯ��������
		{
			this.setService(new Ac03ServiceImpl());
			Map<String,String> ins=this.getService().findById("findByAac302");
			if(ins!=null)
			{
				this.put("status", "200");
				this.put("re", ins);
			}else
			{
				this.put("status", "201");
			}
		}else if(type.equals("3"))   //��������id���뾺��  ���뾺������
		{
			this.setService(new Ac03ServiceImpl());
			if(this.getService().update("insertAc03"))
			{
				this.put("status", "200");
			}else
			{
				this.put("status", "201");
			}
		}
		else if(type.equals("4"))  //�첽������ѯ��������
		{
			
		}
	}

}
