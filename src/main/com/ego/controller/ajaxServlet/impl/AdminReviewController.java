package com.ego.controller.ajaxServlet.impl;

import com.ego.controller.ajaxServlet.AjaxControllerSupport;
import com.ego.services.BaseServices;
import com.ego.services.impl.Ad08ServicesImpl;

import javax.servlet.http.HttpSession;
import java.util.List;
import java.util.Map;

public class AdminReviewController extends AjaxControllerSupport {

	/**
	 * type:要执行操作的类型
	 *    1:查询商铺详细信息
	 *    2:修改商铺审核状态
	 *    3:查询商品详细信息
	 *    4:修改商品审核状态
	 *    5:查询服务商详细信息
	 *    6:修改服务商审核状态
	 *    7:查询服务详细信息
	 *    8:修改服务审核状态
	 *    9:查询审核人历史审核记录
	 */
	@Override
	public void execute(HttpSession session) throws Exception
	{
		BaseServices services=new Ad08ServicesImpl();
		services.setMapDto(this.dto);
		int type=Integer.valueOf((String) this.dto.get("type"));
		System.out.println(type);
		Map<String,String> map=null;
		switch (type)
		{
		case 1:
			map=services.findById("findAb01ById");
			this.put("map", map);
			break;
		case 2:
			services.update("modifyAb01");
			break;
		case 3:
			map=services.findById("findAb02ById");
			this.put("map", map);
			break;
		case 4:
			services.update("modifyAb02");
			break;
		case 5:
			map=services.findById("findAc01ById");
			this.put("map", map);
			break;
		case 6:
			services.update("modifyAc01");
			break;
		case 7:
			map=services.findById("findAc02ById");
			this.put("map", map);
			break;
		case 8:
			services.update("modifyAc02");
			break;
		case 9:
			List<Map<String, String>> lists=services.query("queryAd08");
			this.put("lists", lists);
			break;
		default:
			throw new Exception("未支持type: "+type);
		}
		System.out.println(map);
	}
}
