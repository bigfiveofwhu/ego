package com.ego.controller.impl.localCity;

import java.util.Map;

import com.ego.controller.ControllerSupport;
import com.ego.services.impl.Ac01ServiceImpl;
import com.ego.services.impl.Ad08ServicesImpl;
import com.ego.services.impl.T_AreaService;

public class RegisteredController extends ControllerSupport
{

	@Override
	public String execute() throws Exception
	{
		if(this.get("aaa102")==null)   //检测有没有登录啊
		{
			return "home/home";
		}
		this.dto.put("aac103", this.get("username"));
		String addr_1=(String)this.get("addr_1");
		String addr_2=(String)this.get("addr_2");
		String addr_3=(String)this.get("addr_3");
		String addr_4=(String)this.get("addr_4");
		this.dto.put("addr_1", addr_1.trim());
		this.dto.put("addr_2", addr_2.trim());
		this.dto.put("addr_3", addr_3.trim());
		String addr=addr_1.trim()+" "+addr_2.trim()+" "+addr_3.trim()+" "+addr_4.trim();
		this.dto.put("aac104", addr);    //地址
		//城市名转换成编码
		this.setServices(new T_AreaService());
		Map<String,String> ins=this.getServices().findById("findBy3Level");
		this.dto.put("aac105", ins.get("code"));    //城市
		this.dto.put("aac106", this.get("serviceSort"));  //服务类型
		this.dto.put("aac107", this.get("describe"));     //认证信息
		this.dto.put("aac109", this.get("amount"));
		this.dto.put("aac111", this.get("phone"));     //服务商电话
		//在服务商表中插入数据,并在dto中返回服务商id --aac102
		this.setServices(new Ac01ServiceImpl());
		this.getServices().update("insertAc01");
		
		//在审核表中插入服务商审核数据
		this.dto.put("aad802", this.get("describe"));
		this.dto.put("aad805", this.get("aac102"));   //审核对象id
		this.dto.put("aad803", "03");   //审核类型 03--服务商注册
		this.setServices(new Ad08ServicesImpl());
		this.getServices().update("insertAd08");
		this.getSession().setAttribute("aac102", this.get("aac102"));  //已放入dto的服务商id
		return "localCity/home";
	}

}
