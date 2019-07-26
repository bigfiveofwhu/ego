package com.ego.controller.ajaxServlet.impl;

import java.util.Map;

import javax.servlet.http.HttpSession;

import com.ego.controller.ajaxServlet.AjaxControllerSupport;
import com.ego.services.impl.ProductManageServicesImpl;
import com.ego.services.impl.ShopManageServicesImpl;
import com.ego.services.impl.seller.SPManageServicesImpl;
import com.ego.system.tools.Tools;

public class PutOffGoodsController extends AjaxControllerSupport {

	@Override
	public void execute(HttpSession session) throws Exception {
         this.setService(new ProductManageServicesImpl());
         switch ((String)this.get("type"))
         {
			case "putoff"://�¼�
				if( this.getService().update("putOffSale"))
		        	 this.put("tag", 1);
		         else
		        	 this.put("tag", 0);
				break;
			case "serputoff"://�����¼�
				this.setService(new SPManageServicesImpl());
				if( this.getService().update("putOffSale"))
		        	 this.put("tag", 1);
		         else
		        	 this.put("tag", 0);
				break;
			case "puton"://�ϼ�
				if( this.getService().update("putOn2"))
		        	 this.put("tag", 1);
		         else
		        	 this.put("tag", 0);
				break;
			case "serputon"://�����ϼ�
				this.setService(new SPManageServicesImpl());
				if( this.getService().update("putOn2"))
		        	 this.put("tag", 1);
		         else
		        	 this.put("tag", 0);
				break;
			case "del"://ɾ��
				if( this.getService().update("deleteById"))
		        	 this.put("tag", 1);
		         else
		        	 this.put("tag", 0);
				break;
			case "serdel"://����ɾ��
				this.setService(new SPManageServicesImpl());
				if( this.getService().update("deleteById"))
		        	 this.put("tag", 1);
		         else
		        	 this.put("tag", 0);
				break;
			case "pro"://����
				Map<String,String> map = this.getService().findById();
				//String code = map.get("aab204");
				//map.put("acnaab204", Tools.getTriSort(code));
				this.put("map", map);
				this.put("tag", 1);
				break;
			case "img"://ͼƬ
				Map<String,String> map1 = this.getService().findById("getProImgPath");
				String proPath = map1.get("aab208");
				String specPath = map1.get("aab207");
				specPath = specPath.substring(specPath.indexOf("&")+1);
				String[]  specimgs = specPath.split(";");
				
				if(proPath == null)
					this.put("proimgUrl", "");
				else
				{
					String [] proimgs = proPath.split(";");
					this.put("proimgUrl", proimgs);
				}
				this.put("specimgUrl", specimgs);
				break;
			case "serimg"://����ͼƬ
				this.setService(new SPManageServicesImpl());
				Map<String,String> map3 = this.getService().findById("getProImgPath");
				String proPath1 = map3.get("aac210");
				if(proPath1 == null)
					this.put("proimgUrl", "");
				else
				{
					String [] proimgs1 = proPath1.split(";");
					this.put("proimgUrl", proimgs1);
				}
				break;
			case "update"://�޸�
				if( this.getService().update("updateById"))
		        	 this.put("tag", 1);
		         else
		        	 this.put("tag", 0);
				break;
			case "ser"://��������
				this.setService(new SPManageServicesImpl());
				Map<String,String> map2 = this.getService().findById("service");
				this.put("map", map2);
				this.put("tag", 1);
				break;
			case "order"://��������
				this.setService(new ShopManageServicesImpl());
				Map<String,String> map4 = this.getService().findById();
				this.put("map", map4);
				this.put("tag", 1);
				break;
			default:
				break;
		}
        
	}

}
