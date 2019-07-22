package com.ego.controller.impl.localCity;

import java.util.Map;

import javax.servlet.http.HttpSession;

import com.ego.controller.ControllerSupport;
import com.ego.services.impl.Ac01ServiceImpl;

public class HomeController extends ControllerSupport 
{

	@Override
	public String execute() throws Exception 
	{
		HttpSession session=this.getSession();
		if(this.get("aaa102")!=null)     //若登录.则查找是否注册过服务商
		{
			this.setServices(new Ac01ServiceImpl());
			Map<String,String> ins=this.getServices().findById("login");
			if(ins!=null)
			{
				session.setAttribute("aac102", ins.get("aac102"));   //存入服务商id
				session.setAttribute("aac103", ins.get("aac103"));   //存入服务商名称
			}
		}
		this.saveAttribute("isSendRedirect", false);
		return "localCity/home";
	}

}
