package com.ego.controller.impl;

import java.util.Map;

import javax.servlet.http.HttpSession;

import com.ego.controller.ControllerSupport;
import com.ego.services.impl.Aa01ServiceImpl;
import com.ego.services.impl.Ab01ServiceImpl;

public class LoginController extends ControllerSupport {

	public LoginController() 
	{
		this.setServices(new Aa01ServiceImpl());
	}
	
	@Override
	public String execute() throws Exception 
	{
		//ǰ����ֶ���ת��
		this.dto.put("aaa104", this.get("email"));
		String pwd=(String)this.get("pwd");
		System.out.println(this.get("email").toString()+",  "+this.get("pwd").toString());
		//��email���в���
		Map<String,String> ins=this.getServices().findById("aaa104");
		if(ins==null || !ins.get("aaa107").equals(pwd))
		{
			this.saveAttribute("msg", "��¼ʧ��,�����µ�¼!");
			return "home/login";
		}
		HttpSession session=this.getSession();
		session.setAttribute("session_uid", ins.get("aaa102"));
		session.setAttribute("session_aaa106", ins.get("aaa106"));  //����
		session.setAttribute("session_username", ins.get("aaa103"));
		session.setAttribute("session_email", ins.get("aaa104"));
		session.setAttribute("session_phone", ins.get("aaa108"));
		session.setAttribute("aaa102", ins.get("aaa102"));  //�û�id
		session.setAttribute("aaa103", ins.get("aaa103"));  //�û���
		session.setAttribute("aaa104", ins.get("aaa104"));  //�����ַ
		session.setAttribute("aaa106", ins.get("aaa106"));  //����
		session.setAttribute("aaa108", ins.get("aaa108"));  //�绰����
		this.setServices(new Ab01ServiceImpl());
		ins=null;
		try 
		{
			ins=this.getServices().findById("aaa102");
		} catch (Exception e) 
		{
			e.printStackTrace();
		}
		if(ins!=null)
		{
			session.setAttribute("session_shopId", ins.get("aab102"));
		}
		return "home/home";
	}
}
