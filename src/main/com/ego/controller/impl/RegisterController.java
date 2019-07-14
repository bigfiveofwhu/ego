package com.ego.controller.impl;

import javax.servlet.http.HttpSession;

import com.ego.controller.ControllerSupport;
import com.ego.services.impl.Aa01ServiceImpl;

public class RegisterController extends ControllerSupport 
{
	@Override
	public String execute() throws Exception 
	{

		String verifyCode=(String)this.get("verifyCode");   //�ǵ�����֤����ٴ���֤
		//ȥ��ǰ��ո�,�Է������ָ�����쳣
		String addr_1=((String)this.get("addr_1")).trim();
		String addr_2=((String)this.get("addr_2")).trim();
		String addr_3=((String)this.get("addr_3")).trim();
		String addr_4=((String)this.get("addr_4")).trim();
		this.dto.put("addr_1", addr_1);
		this.dto.put("addr_2", addr_2);
		this.dto.put("addr_3", addr_3);
		this.dto.put("addr_4", addr_4);
		this.setServices(new Aa01ServiceImpl());
		this.update("insertAa01", "ע��");
		
		saveAttribute("aaa102", this.get("aaa102"));
		HttpSession session=this.getSession();
		/**
		 * aaa102,aaa106��ͨ��dto˫�򴫵�
		 */
		session.setAttribute("aaa102", this.get("aaa102"));  //�û�id
		session.setAttribute("aaa106", this.get("aaa106"));  //����
		session.setAttribute("aaa103", this.get("username"));
		session.setAttribute("aaa104", this.get("email"));
		session.setAttribute("aaa108", this.get("phone"));
		//�����ļ���ַ
		session.setAttribute("addr_1", addr_1);
		session.setAttribute("addr_2", addr_2);
		session.setAttribute("addr_3", addr_3);
		session.setAttribute("addr_4", addr_4);
		return "home/home";
	}
}
