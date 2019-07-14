package com.ego.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import com.ego.services.BaseServices;

public abstract class ControllerSupport implements Controller 
{
	//*****************************************
	// * 业务逻辑组件及架构注入
	// *****************************************/
	private BaseServices services = null;

	/**
	 * 子类通过该方法,为Services变量传递引用的具体类对象
	 * 
	 * @param services
	 */
	protected void setServices(BaseServices services)
	{
		this.services = services;
		this.services.setMapDto(this.dto);
	}

	protected BaseServices getServices()
	{
		return this.services;
	}
	
	
	//*****************************************
	//* 具体Controller业务流程封装
	// *****************************************
	/**
	 * 批量数据查询
	 * @param ftype --批量查询的具体分类
	 * @throws Exception
	 */
	protected final void savePageData(String qtype) throws Exception
	{
		List<Map<String, String>> rows = this.services.query(qtype);
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
	 * 单一实例查询
	 * @param ftype --单一实例查询的具体查询类型(基于业务)
	 * @throws Exception
	 */
	protected final void savePageInstance(String qtype) throws Exception
	{
		Map<String, String> ins = this.services.findById(qtype);
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
	 * 更新(修改,删除,插入)行为的总开关 < 简单消息提示 >
	 * 
	 * @param utype --更新行为的具体分类
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
	 * 删除之后的批量数据查询
	 * @param ftype --批量查询的具体类型
	 * @throws Exception
	 */
	protected final void savePageDataForDelete(String qtype) throws Exception
	{
		List<Map<String, String>> rows = this.services.query(qtype);
		if (rows.size() > 0)
		{
			this.saveAttribute("rows", rows);
		}
	}

	/**
	 * 将dto的数据放入页面
	 * @param dto
	 */
	protected final  void saveMap(Map<String, String> dto) {
		for (Entry<String, String> entry
				: dto.entrySet()) {
			saveAttribute(entry.getKey(), entry.getValue());
		}
	}
	
	//*****************************************
	// * 数据输入流(将数据写入dto)
	// *****************************************
	protected Map<String, Object> dto = null;

	/**
	 * 同时为this和this.service注入dto
	 */
	@Override
	public void setMapDto(Map<String, Object> dto) 
	{
		this.dto = dto;
		// 同步为Services传递DTO
		//this.services.setMapDto(dto);
	}
	
	/**
	 * 切换this.service对象,同时为新service注入Servlet的原dto
	 */
	protected void changeService(BaseServices service) 
	{
		this.setServices(service);
		this.getServices().setMapDto(dto);
	}
	

	//*****************************************
	// * 数据输出流(向controller.attribute写入数据,用以传输给页面)
	// *****************************************/
	private Map<String, Object> attribute = new HashMap<>();
	
	/**
	 * 向attribute存入数据
	 * @param key
	 * @param value
	 */
	protected final void saveAttribute(String key, Object value)
	{
		this.attribute.put(key, value);
	}
	
	/**
	 * attribute的get方法
	 */
	@Override
	public final Map<String, Object> getAttribute()
	{
		return this.attribute;
	}

	
	//*****************************************
	// * 给子类提供的获取dto中数据的方法
	// *****************************************/
	protected Object get(String key)
	{
		return dto.get(key);
	}
	
	/**
	 * 获取session对象
	 * @return
	 */
	protected HttpSession getSession()
	{
		return ((HttpServletRequest)this.get("request")).getSession();
	}
	
	/**
	 * 检测相应的用户是否登录
	 * @param uid  --从客户端传来的uid
	 * @return  --true  已登录    --false  未登录
	 */
	protected boolean detectionLogin(String uid)
	{
		String session_uid=(String)this.getSession().getAttribute("session_uid");
		if(session_uid!=null && session_uid.equals(uid))
		{
			return true;
		}
		return false;
	}
	
	
	//****************************************************
	// *           辅助方法
	//*********************************************
	/**
	 * 打印dto
	 */
	protected final void showDto() 
	{
		System.out.println(this.dto);
	}
}
