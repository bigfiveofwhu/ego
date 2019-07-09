package com.ego.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.ego.services.BaseServices;

public abstract class ControllerSupport implements Controller 
{
	/*****************************************
	 * 业务逻辑组件及架构注入
	 *****************************************/
	private BaseServices services = null;

	/**
	 * 子类通过该方法,为Services变量传递引用的具体类对象
	 * 
	 * @param services
	 */
	protected void setServices(BaseServices services)
	{
		this.services = services;
	}

	protected BaseServices getServices()
	{
		return this.services;
	}

	
	
	/*****************************************
	 * 子类业务流程封装
	 *****************************************/
	/**
	 * 数据批量查询
	 * 
	 * @throws Exception
	 */
	protected final void savePageData() throws Exception
	{
		List<Map<String, String>> rows = this.services.query();
		if (rows.size() > 0) 
		{
			this.saveAttribute("rows", rows);
		} 
		else
		{
			this.saveAttribute("msg", "没有符合条件的数据!");
		}
	}

	/**
	 * 单一实例 查询
	 * 
	 * @throws Exception
	 */
	protected final void savePageInstance() throws Exception
	{
		Map<String, String> ins = this.services.findById();
		if (ins != null) 
		{
			this.saveAttribute("ins", ins);
		} 
		else 
		{
			this.saveAttribute("msg", "提示:该数据已删除或禁止访问!");
		}
	}

	/**
	 * 更新行为的总开关 < 简单消息提示 >
	 * 
	 * @param utype
	 * @param msgText
	 * @throws Exception
	 */
	protected final void update(String utype, String msgText) throws Exception 
	{
		String msg = this.services.update(utype) ? "成功!" : "失败!";
		this.saveAttribute("msg", msgText + msg);
	}

	/**
	 * 带有编号的消息提示的更新行为
	 * 
	 * @param utype
	 * @param typeText
	 * @param msgText
	 * @param key
	 * @throws Exception
	 */
	protected final void update(String utype, String typeText, String msgText, String key) throws Exception 
	{
		String msg = typeText + "失败!";
		if (this.services.update(utype))
		{
			msg = msgText + "[ <msg> " + this.dto.get(key) + " </msg> ]";
		}
		// Servlet向页面输出数据
		this.saveAttribute("msg", msg);
	}

	/**
	 * 删除后的数据检索
	 * 
	 * @throws Exception
	 */
	protected final void savePageDataForDelete() throws Exception
	{
		List<Map<String, String>> rows = this.services.query();
		if (rows.size() > 0)
		{
			this.saveAttribute("rows", rows);
		}
	}

	/*****************************************
	 * 数据输入流
	 *****************************************/
	private Map<String, Object> dto = null;

	//可以改变sevice
	protected void changeService(BaseServices service) {
		this.setServices(service);
		this.getServices().setMapDto(dto);
	}
	
	@Override
	public final void setMapDto(Map<String, Object> dto) 
	{
		this.dto = dto;
		// 同步为Services传递DTO
		this.services.setMapDto(dto);
	}

	protected final void showDto() 
	{
		System.out.println(this.dto);
	}

	/*****************************************
	 * 数据输出流
	 *****************************************/
	private Map<String, Object> attribute = new HashMap<>();

	protected final void saveAttribute(String key, Object value)
	{
		this.attribute.put(key, value);
	}

	@Override
	public final Map<String, Object> getAttribute()
	{
		return this.attribute;
	}

	/*****************************************
	 * 给子类提供的获取dto中数据的方法
	 *****************************************/
	protected Object get(String key) {
		return dto.get(key);
	}
}
