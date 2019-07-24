/**
 * @author hug
 */
package com.ego.controller.impl.localCity;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import com.ego.controller.ControllerSupport;
import com.ego.services.impl.Ac02ServiceImpl;
import com.ego.services.impl.Ac04ServicesImpl;
import com.ego.services.impl.Ac05ServicesImpl;

public class ServiceDetailController extends ControllerSupport
{

	@Override
	public String execute() throws Exception
	{
		this.dto.put("aac202", this.get("serviceId"));   //����id
		this.saveAttribute("serviceId", this.get("serviceId"));
		//��ѯ������ϸ��Ϣ
		this.setServices(new Ac02ServiceImpl());
		Map<String,String> ins=this.getServices().findById("findByAac202");
		this.saveAttribute("info", ins);
		this.saveAttribute("from_id", ins.get("aaa102"));  //��ҳ����뷢����id
		this.saveAttribute("from_name", ins.get("aac103"));  //��ҳ��������������
		 //��������ͼƬ·��
		String imgs=(String)ins.get("aac210");
		List<String> imgList=new ArrayList<>();
		for(String img:imgs.split(";"))
		{
			imgList.add(img);
		}
		this.saveAttribute("imgList", imgList);
		//��������
		this.setServices(new Ac04ServicesImpl());
		//������������
		ins=this.getServices().findById("countLastSell");
		this.saveAttribute("lastSell", ins.get("lastsell"));
		//�����ۻ�����
		ins=this.getServices().findById("countAllSell");
		this.saveAttribute("allSell", ins.get("allsell"));
		
		//���������
		this.setServices(new Ac05ServicesImpl());
		ins=this.getServices().findById("compute5Comment");
		int g=Integer.parseInt(ins.get("grade").toString());
		int m=Integer.parseInt(ins.get("mid").toString());
		int b=Integer.parseInt(ins.get("bad").toString());
		this.saveAttribute("goodComment", g);
		this.saveAttribute("midComment", m);
		this.saveAttribute("badComment", b);
		this.saveAttribute("AllComment", g+m+b);
		//��ѯ�����������Ϣ
		List<Map<String,String>> rows=this.getServices().query("queryCommentForAac202");
		this.saveAttribute("comments", rows);
		return "localCity/serviceDetail";
	}
}
