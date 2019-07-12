package com.ego.controller.impl;

import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStreamWriter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.ego.controller.ControllerSupport;
import com.ego.services.impl.SyscodeServiceImpl;
import com.ego.system.utils.GeneJSP;

public class HomeController extends ControllerSupport
{
	public HomeController()
	{
		this.setServices(new SyscodeServiceImpl());
	}

	@Override
	public String execute() throws Exception 
	{
		//��ʼ���û���Ϣ
		//��ʼ����Ʒ����
		//File file=new File("WebContent/home/productType.jsp");
		//GeneJSP.geneJSP(this.getServices());
		//��ʼ���ֲ�ͼƬ
		//��ʼ����Ʒ�Ƽ�
		//��ʼ�����Ż
		//��ʼ�����
		this.saveAttribute("isSendRedirect", false);
		return "home/home";
	}
}
