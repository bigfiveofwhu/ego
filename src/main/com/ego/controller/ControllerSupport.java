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
	// * ҵ���߼�������ܹ�ע��
	// *****************************************/
	private BaseServices services = null;

	/**
	 * ����ͨ���÷���,ΪServices�����������õľ��������
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
	//* ����Controllerҵ�����̷�װ
	// *****************************************
	/**
	 * �������ݲ�ѯ
	 * @param ftype --������ѯ�ľ������
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
			this.saveAttribute("msg", "û�з�������������!");
		}
	}

	/**
	 * ��һʵ����ѯ
	 * @param ftype --��һʵ����ѯ�ľ����ѯ����(����ҵ��)
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
			this.saveAttribute("msg", "��ʾ:��������ɾ�����ֹ����!");
		}
	}

	/**
	 * ����(�޸�,ɾ��,����)��Ϊ���ܿ��� < ����Ϣ��ʾ >
	 * 
	 * @param utype --������Ϊ�ľ������
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
	 * ɾ��֮����������ݲ�ѯ
	 * @param ftype --������ѯ�ľ�������
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
	 * ��dto�����ݷ���ҳ��
	 * @param dto
	 */
	protected final  void saveMap(Map<String, String> dto) {
		for (Entry<String, String> entry
				: dto.entrySet()) {
			saveAttribute(entry.getKey(), entry.getValue());
		}
	}
	
	//*****************************************
	// * ����������(������д��dto)
	// *****************************************
	protected Map<String, Object> dto = null;

	/**
	 * ͬʱΪthis��this.serviceע��dto
	 */
	@Override
	public void setMapDto(Map<String, Object> dto) 
	{
		this.dto = dto;
		// ͬ��ΪServices����DTO
		//this.services.setMapDto(dto);
	}
	
	/**
	 * �л�this.service����,ͬʱΪ��serviceע��Servlet��ԭdto
	 */
	protected void changeService(BaseServices service) 
	{
		this.setServices(service);
		this.getServices().setMapDto(dto);
	}
	

	//*****************************************
	// * ���������(��controller.attributeд������,���Դ����ҳ��)
	// *****************************************/
	private Map<String, Object> attribute = new HashMap<>();
	
	/**
	 * ��attribute��������
	 * @param key
	 * @param value
	 */
	protected final void saveAttribute(String key, Object value)
	{
		this.attribute.put(key, value);
	}
	
	/**
	 * attribute��get����
	 */
	@Override
	public final Map<String, Object> getAttribute()
	{
		return this.attribute;
	}

	
	//*****************************************
	// * �������ṩ�Ļ�ȡdto�����ݵķ���
	// *****************************************/
	protected Object get(String key)
	{
		return dto.get(key);
	}
	
	/**
	 * ��ȡsession����
	 * @return
	 */
	protected HttpSession getSession()
	{
		return ((HttpServletRequest)this.get("request")).getSession();
	}
	
	/**
	 * �����Ӧ���û��Ƿ��¼
	 * @param uid  --�ӿͻ��˴�����uid
	 * @return  --true  �ѵ�¼    --false  δ��¼
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
	// *           ��������
	//*********************************************
	/**
	 * ��ӡdto
	 */
	protected final void showDto() 
	{
		System.out.println(this.dto);
	}
}
