package com.ego.controller.ajaxServlet.impl;

import com.ego.controller.ajaxServlet.AjaxControllerSupport;
import com.ego.services.BaseServices;
import com.ego.services.impl.Ad08ServicesImpl;
import com.ego.services.impl.Ae01ServicesImpl;

import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class AdminReviewController extends AjaxControllerSupport {

	/**
	 * type:Ҫִ�в���������
	 *    1:��ѯ������ϸ��Ϣ
	 *    2:�޸��������״̬
	 *    3:��ѯ��Ʒ��ϸ��Ϣ
	 *    4:�޸���Ʒ���״̬
	 *    5:��ѯ��������ϸ��Ϣ
	 *    6:�޸ķ��������״̬
	 *    7:��ѯ������ϸ��Ϣ
	 *    8:�޸ķ������״̬
	 *    9:��ѯ�������ʷ��˼�¼
	 */
	@Override
	public void execute(HttpSession session) throws Exception
	{
		BaseServices services=new Ad08ServicesImpl();
		services.setMapDto(this.dto);
		int type=Integer.valueOf((String) this.dto.get("type"));
		System.out.println(type);
		Map<String,String> map=null;
		String msg;
		BaseServices services2=new Ae01ServicesImpl();
		Map<String, Object> dto2=new HashMap<>();
		services2.setMapDto(dto2);
		switch (type)
		{
		case 1:
			map=services.findById("findAb01ById");
			this.put("map", map);
			break;
		case 2:
			msg=services.update("modifyAb01")?"�޸ĳɹ�":"�޸�ʧ��";
			dto2.put("to","1" + this.get("aaa102"));
			dto2.put("aae102",this.get("aaa103") + "��ã������������[" + this.get("aab103") + "]����˽���ǣ�" + this.get("val"));
			dto2.put("aae103","0");
			dto2.put("aae105","�̼�ע�����");
			services2.update("insert");
			this.put("msg",msg);
			break;
		case 3:
			map=services.findById("findAb02ById");
			this.put("map", map);
			break;
		case 4:
			msg=services.update("modifyAb02")?"�޸ĳɹ�":"�޸�ʧ��";
			this.put("msg",msg);
			break;
		case 5:
			map=services.findById("findAc01ById");
			this.put("map", map);
			break;
		case 6:
			msg=services.update("modifyAc01")?"�޸ĳɹ�":"�޸�ʧ��";
			dto2.put("to","1" + this.get("aaa102"));
			dto2.put("aae102",this.get("aaa103") + "��ã�������ķ�����[" + this.get("aac103") + "]����˽���ǣ�" + this.get("val"));
			dto2.put("aae103","0");
			dto2.put("aae105","������ע�����");
			services2.update("insert");
			this.put("msg",msg);
			break;
		case 7:
			map=services.findById("findAc02ById");
			this.put("map", map);
			break;
		case 8:
			msg=services.update("modifyAc02")?"�޸ĳɹ�":"�޸�ʧ��";
			this.put("msg",msg);
			break;
		case 9:
			List<Map<String, String>> lists=services.query("queryAd08");
			this.put("lists", lists);
			break;
		default:
			throw new Exception("δ֧��type: "+type);
		}
		System.out.println(map);
	}
}
