package com.ego.controller.impl;

import java.util.List;
import java.util.Map;

import com.ego.controller.ControllerSupport;
import com.ego.services.impl.Ab02ServiceImpl;
import com.ego.services.impl.Ab06ServiceImpl;
import com.ego.services.impl.AdvertiseService;
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
		this.setServices(new AdvertiseService());
		List<Map<String, String>> rows=this.getServices().query("getTopHeadLine");
		this.saveAttribute("loopShow", rows);
		//��ʼ��������Ʒ
		rows=this.getServices().query("gethotProducts");
		this.saveAttribute("hotProduct", rows);
		//��ʼ�����ŵ���
		rows=this.getServices().query("gethotShops");
		this.saveAttribute("hotShop", rows);
		//��ʼ������ϲ��
		if (this.get("aaa102")!=null&&!this.get("aaa102").equals("")) {
			rows=this.getServices().query("getTargetAds");
			this.saveAttribute("guessProduct", rows);
		}
		//��ʼ�����Ż
		this.setServices(new Ab06ServiceImpl());
		rows=this.getServices().query("findByUpToDate");
		this.saveAttribute("activityList", rows);
		
		//��ʼ����Ʒ�Ƽ�
		this.setServices(new Ab02ServiceImpl());
		    /*Ҫ���ض��list,�޷�ʹ��savePageData*/
		rows = this.getServices().query("findByUpToDate");
		this.saveAttribute("productList", rows);
		this.saveAttribute("isSendRedirect", false);
		return "home/home";
	}
}
