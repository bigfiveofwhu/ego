package com.ego.controller.impl;

import com.ego.controller.ControllerSupport;
import com.ego.services.impl.Aa01ServiceImpl;
import com.ego.services.impl.Aa02ServiceImpl;
import com.ego.services.impl.Ab01ServiceImpl;
import com.ego.system.tools.Tools;
import com.ego.system.utils.CodeVerify;

import javax.servlet.http.HttpSession;
import java.util.Map;

public class LoginController extends ControllerSupport {
	
	@Override
	public String execute() throws Exception 
	{
		HttpSession session=this.getSession();
		//验证验证码
		String verifyCode=null;
		try{
			verifyCode=(String)this.get("verifyCode");
		}catch (Exception e){
			e.printStackTrace();
		}
		if(verifyCode==null || !CodeVerify.verify(session, verifyCode))
		{
			this.saveAttribute("msg", "验证码无效!");
			return "home/login";
		}
		//前后端字段名转换
		this.setServices(new Aa01ServiceImpl());
		this.dto.put("aaa104", this.get("email"));
		this.dto.put("aaa107", Tools.getMd5(this.get("pwd")));
		System.out.println(this.get("email").toString()+",  "+this.get("pwd").toString()+";"+Tools.getMd5(this.get("pwd"))+"(已加密)");
		//用email进行查找
		Map<String,String> ins=this.getServices().findById("loginByEmail");
		if(ins==null)
		{
			this.saveAttribute("msg", "账户或密码错误,请重新登录!");
			return "home/login";
		}
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
		//计数购物车
		this.dto.put("aaa102", ins.get("aaa102"));
		this.setServices(new Aa02ServiceImpl());
		ins=this.getServices().findById("countByAaa102");
		session.setAttribute("shopCartCount", "0");
		if(ins!=null) {
			session.setAttribute("shopCartCount", ins.get("sum"));
		}
		//是否拥有店铺
		this.setServices(new Ab01ServiceImpl());
		ins=this.getServices().findById("loginByAaa102");
		System.out.println(ins);
		if(ins!=null)
		{
			session.setAttribute("aab102", ins.get("aab102"));  //店铺id
			session.setAttribute("aab103", ins.get("aab103"));  //店铺名称
		}
		return "home/home";
	}
}
