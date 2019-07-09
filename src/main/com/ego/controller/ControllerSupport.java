package com.ego.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.ego.services.BaseServices;

public abstract class ControllerSupport implements Controller 
{
	/*****************************************
	 * ҵ���߼�������ܹ�ע��
	 *****************************************/
	private BaseServices services = null;

	/**
	 * ����ͨ���÷���,ΪServices�����������õľ��������
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
	 * ����ҵ�����̷�װ
	 *****************************************/
	/**
	 * ����������ѯ
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
			this.saveAttribute("msg", "û�з�������������!");
		}
	}

	/**
	 * ��һʵ�� ��ѯ
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
			this.saveAttribute("msg", "��ʾ:��������ɾ�����ֹ����!");
		}
	}

	/**
	 * ������Ϊ���ܿ��� < ����Ϣ��ʾ >
	 * 
	 * @param utype
	 * @param msgText
	 * @throws Exception
	 */
	protected final void update(String utype, String msgText) throws Exception 
	{
		String msg = this.services.update(utype) ? "�ɹ�!" : "ʧ��!";
		this.saveAttribute("msg", msgText + msg);
	}

	/**
	 * ���б�ŵ���Ϣ��ʾ�ĸ�����Ϊ
	 * 
	 * @param utype
	 * @param typeText
	 * @param msgText
	 * @param key
	 * @throws Exception
	 */
	protected final void update(String utype, String typeText, String msgText, String key) throws Exception 
	{
		String msg = typeText + "ʧ��!";
		if (this.services.update(utype))
		{
			msg = msgText + "[ <msg> " + this.dto.get(key) + " </msg> ]";
		}
		// Servlet��ҳ���������
		this.saveAttribute("msg", msg);
	}

	/**
	 * ɾ��������ݼ���
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
	 * ����������
	 *****************************************/
	private Map<String, Object> dto = null;

	//���Ըı�sevice
	protected void changeService(BaseServices service) {
		this.setServices(service);
		this.getServices().setMapDto(dto);
	}
	
	@Override
	public final void setMapDto(Map<String, Object> dto) 
	{
		this.dto = dto;
		// ͬ��ΪServices����DTO
		this.services.setMapDto(dto);
	}

	protected final void showDto() 
	{
		System.out.println(this.dto);
	}

	/*****************************************
	 * ���������
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
	 * �������ṩ�Ļ�ȡdto�����ݵķ���
	 *****************************************/
	protected Object get(String key) {
		return dto.get(key);
	}
}
