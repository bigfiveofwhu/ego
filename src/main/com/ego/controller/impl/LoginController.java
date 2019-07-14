package com.ego.controller.impl;

import java.util.Map;

import javax.servlet.http.HttpSession;

import com.ego.controller.ControllerSupport;
import com.ego.services.impl.Aa01ServiceImpl;
import com.ego.services.impl.Ab01ServiceImpl;

public class LoginController extends ControllerSupport {
	
	@Override
	public String execute() throws Exception 
	{
		//前后端字段名转换
		this.setServices(new Aa01ServiceImpl());
		this.dto.put("aaa104", this.get("email"));
		this.dto.put("aaa107", this.get("pwd"));
		System.out.println(this.get("email").toString()+",  "+this.get("pwd").toString());
		//用email进行查找
		Map<String,String> ins=this.getServices().findById("loginByEmail");
		if(ins==null)
		{
			this.saveAttribute("msg", "账户或密码错误,请重新登录!");
			return "home/login";
		}
		HttpSession session=this.getSession();
		session.setAttribute("aaa102", ins.get("aaa102"));  //用户id
		session.setAttribute("aaa103", ins.get("aaa103"));  //用户名
		session.setAttribute("aaa104", ins.get("aaa104"));  //邮箱地址
		session.setAttribute("aaa106", ins.get("aaa106"));  //积分
		session.setAttribute("aaa108", ins.get("aaa108"));  //电话号码
		String addr=(String)ins.get("aaa111");
		String[] addrs=addr.split(" ");
		//存入四级地址
		session.setAttribute("addr_1", addrs[0]);
		session.setAttribute("addr_2", addrs[1]);
		session.setAttribute("addr_3", addrs[2]);
		session.setAttribute("addr_4", addrs[3]);
		//是否拥有店铺
		this.setServices(new Ab01ServiceImpl());
		this.dto.put("aaa102", ins.get("aaa102"));
		ins=this.getServices().findById("loginByAaa102");
		System.out.println(ins);
		if(ins!=null)
		{
			session.setAttribute("aab102", ins.get("aab102"));  //店铺id
		}
		return "home/home";
	}
}
