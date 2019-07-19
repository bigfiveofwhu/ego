package com.ego.controller.impl.advertise;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import com.ego.controller.BaseServlet;
import com.ego.controller.ControllerSupport;
import com.ego.services.impl.AdvertiseService;
import com.ego.system.utils.FileUpload;

public class AdvertiseController extends ControllerSupport{
	
	AdvertiseService service=new AdvertiseService();
	
	@Override
	public void setMapDto(Map<String,Object> dto) {
		// TODO Auto-generated method stub
		this.dto=dto;
		service.setMapDto(dto);
	}
	
	static final  String prefix=BaseServlet.prefix+"advertise/";
	@Override
	public String execute() throws Exception {
		// TODO Auto-generated method stub
		String servletPath=((HttpServletRequest)this.dto.get("request")).getServletPath();
		String mapping=servletPath.substring(servletPath.lastIndexOf('/')+1
				,servletPath.indexOf('.'));
		switch (mapping) { 
		case "applyAccount":
			dto.put("aad802",joinAad802());
			boolean isSuccess=service.update("addAdAudit");
			if (!isSuccess) {
				throw new Exception("操作失败");
			}
			return prefix+"applySuccess";
		case "showAccount"://获取广告账户页面
			String aad402= service.getAccountId();//查询该用户有没有广告账户
			saveAttribute("aaa102", this.get("aaa102"));
			if (aad402!=null) {//如果有账户
				getSession().setAttribute("aad402", aad402);
				dto.put("aad402",aad402);
				saveMap(service.findById("getAccountById"));
				List<Map<String, String>> adList=service.query("queryAdsByAccountId");//获取账户的所有广告
				for (Map<String, String> map : adList) {
					//通过类型和id获得推广品的名称
					map.put("refName",service.getName(map.get("aad303"), map.get("aad306")));//reName为推广品名称
					map.put("adType",service.getAdType(map.get("aad305")));//广告类型的名字，因为aad305里存的是code
				}
				saveAttribute("shop", service.findById("getShop"));
				saveAttribute("products", service.query("getProducts"));
				saveAttribute("services", service.query("getServices"));
				saveAttribute("ads", adList);
				return prefix+"advertiseHome"; 
			}else {
				switch (service.getAuditStatus()) {
				case "01"://未审核
					return prefix+"waitForAudit";
				case "03"://冷冻期
					saveAttribute("frozenDay", dto.get("frozenDay"));
					return prefix+"frozen";
				case "00"://未申请
					return prefix+"application";
				}
			}
		default:
			throw new Exception("不支持的类型");
		}
	}
	
	private String joinAad802() {
		StringBuffer aad802=new StringBuffer();
		aad802.append("userName="+dto.get("aaa103")+"&");
		aad802.append("realName="+dto.get("realName")+"&");
		aad802.append("identity="+dto.get("identity")+"&");
		aad802.append("bankAccount="+dto.get("bankAccount")+"&");
		aad802.append("phoneNumber="+dto.get("phoneNumber")+"&");
		aad802.append("targetType="+dto.get("targetType")+"&");
		return aad802.toString();
	}

}
