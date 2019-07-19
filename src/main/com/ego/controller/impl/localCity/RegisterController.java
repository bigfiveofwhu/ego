package com.ego.controller.impl.localCity;

import java.util.Map;

import com.ego.controller.ControllerSupport;
import com.ego.services.impl.Ac01ServiceImpl;

public class RegisterController extends ControllerSupport
{

	@Override
	public String execute() throws Exception 
	{
		if(this.get("aaa102")!=null)     //若登录.则查找是否注册过服务商
		{
			this.setServices(new Ac01ServiceImpl());
			Map<String,String> ins=this.getServices().findById("login");
			if(ins!=null)   //已存在服务商id
			{
				return "localCity/home";
			}
		}
		return "WEB-INF/views/localCity/register";
	}

}
