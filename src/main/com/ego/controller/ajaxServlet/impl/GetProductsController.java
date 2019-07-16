/**
 * @author hug
 */
package com.ego.controller.ajaxServlet.impl;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import com.ego.controller.ajaxServlet.AjaxControllerSupport;
import com.ego.services.BaseServices;
import com.ego.services.impl.Ab02ServiceImpl;

public class GetProductsController extends AjaxControllerSupport
{

	@Override
	public void execute(HttpSession session) throws Exception
	{
		int type=Integer.parseInt((String)this.dto.get("type"));
		this.dtoPut("aab102", this.get("id"));
		this.setService(new Ab02ServiceImpl());
		List<Map<String,String>> rows=null;
		switch(type)
		{
		//ȫ����Ʒ
		case 1:
			rows=this.getService().query("findProductsByAab102");
			this.put("products", rows);
			break;
		//������Ʒ
		case 2:
			rows=this.getService().query("findProductsByAab102");
			this.put("products", rows);
			break;
		//������Ʒ
		case 3:
			rows=this.getService().query("findByUpToDate");
			this.put("products", rows);
			break;
		//�Ż���Ʒ
		case 4:
			rows=this.getService().query("findProductsByAab102");
			this.put("products", rows);
			break;
		default:
		}
	}

}
