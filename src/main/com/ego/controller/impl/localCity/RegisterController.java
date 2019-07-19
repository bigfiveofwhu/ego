package com.ego.controller.impl.localCity;

import java.util.Map;

import com.ego.controller.ControllerSupport;
import com.ego.services.impl.Ac01ServiceImpl;

public class RegisterController extends ControllerSupport
{

	@Override
	public String execute() throws Exception 
	{
		if(this.get("aaa102")!=null)     //����¼.������Ƿ�ע���������
		{
			this.setServices(new Ac01ServiceImpl());
			Map<String,String> ins=this.getServices().findById("login");
			if(ins!=null)   //�Ѵ��ڷ�����id
			{
				return "localCity/home";
			}
		}
		return "WEB-INF/views/localCity/register";
	}

}
