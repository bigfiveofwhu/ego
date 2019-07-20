package com.ego.controller.impl.localCity;

import java.util.List;
import java.util.Map;

import com.ego.controller.ControllerSupport;
import com.ego.services.impl.Ac01ServiceImpl;

public class HomeController extends ControllerSupport 
{

	@Override
	public String execute() throws Exception 
	{
		if(this.get("aaa102")!=null)     //����¼.������Ƿ�ע���������
		{
			this.setServices(new Ac01ServiceImpl());
			Map<String,String> ins=this.getServices().findById("login");
			if(ins!=null)
			{
				this.getSession().setAttribute("aac102", ins.get("aac102"));   //���������id
			}
		}
		this.saveAttribute("isSendRedirect", false);
		return "localCity/home";
	}

}
