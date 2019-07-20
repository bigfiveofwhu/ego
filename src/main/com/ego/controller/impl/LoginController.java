package com.ego.controller.impl;

import java.util.Map;

import javax.servlet.http.HttpSession;

import com.ego.controller.ControllerSupport;
import com.ego.services.impl.Aa01ServiceImpl;
import com.ego.services.impl.Aa02ServiceImpl;
import com.ego.services.impl.Ab01ServiceImpl;
import com.ego.system.tools.Tools;

public class LoginController extends ControllerSupport {
	
	@Override
	public String execute() throws Exception 
	{
		//ǰ����ֶ���ת��
		this.setServices(new Aa01ServiceImpl());
		this.dto.put("aaa104", this.get("email"));
		this.dto.put("aaa107", Tools.getMd5(this.get("pwd")));
		System.out.println(this.get("email").toString()+",  "+this.get("pwd").toString()+";"+Tools.getMd5(this.get("pwd"))+"(�Ѽ���)");
		//��email���в���
		Map<String,String> ins=this.getServices().findById("loginByEmail");
		if(ins==null)
		{
			this.saveAttribute("msg", "�˻����������,�����µ�¼!");
			return "home/login";
		}
		HttpSession session=this.getSession();
		session.setAttribute("aaa102", ins.get("aaa102"));  //�û�id
		session.setAttribute("aaa103", ins.get("aaa103"));  //�û���
		session.setAttribute("aaa104", ins.get("aaa104"));  //�����ַ
		session.setAttribute("aaa106", ins.get("aaa106"));  //����
		session.setAttribute("aaa108", ins.get("aaa108"));  //�绰����
		String addr=(String)ins.get("aaa111");
		String[] addrs=addr.split(" ");
		//�����ļ���ַ
		session.setAttribute("addr_1", addrs[0]);
		session.setAttribute("addr_2", addrs[1]);
		session.setAttribute("addr_3", addrs[2]);
		session.setAttribute("addr_4", addrs[3]);
		//�������ﳵ
		this.dto.put("aaa102", ins.get("aaa102"));
		this.setServices(new Aa02ServiceImpl());
		ins=this.getServices().findById("countByAaa102");
		session.setAttribute("shopCartCount", "0");
		if(ins!=null) {
			session.setAttribute("shopCartCount", ins.get("sum"));
		}
		//�Ƿ�ӵ�е���
		this.setServices(new Ab01ServiceImpl());
		ins=this.getServices().findById("loginByAaa102");
		System.out.println(ins);
		if(ins!=null)
		{
			session.setAttribute("aab102", ins.get("aab102"));  //����id
		}
		return "home/home";
	}
}
