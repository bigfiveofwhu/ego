package com.ego.controller.impl.advertise;

import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import com.alipay.api.internal.util.AlipaySignature;
import com.alipay.config.AlipayConfig;
import com.ego.controller.BaseServlet;
import com.ego.controller.ControllerSupport;
import com.ego.services.BaseServices;
import com.ego.services.impl.AdvertiseService;

public class NoticeController extends ControllerSupport{

	
	BaseServices service=new AdvertiseService();
	@Override
	public void setMapDto(Map<String, Object> dto) {
		// TODO Auto-generated method stub
		super.setMapDto(dto);
		service.setMapDto(dto);
	}
	@Override
	public String execute() throws Exception {
		// TODO Auto-generated method stub
		HttpServletRequest request=(HttpServletRequest) dto.get("request");
		//��ȡ֧����POST����������Ϣ
		Map<String,String> params = new HashMap<String,String>();
		Map requestParams = request.getParameterMap();
		for (Iterator iter = requestParams.keySet().iterator(); iter.hasNext();) {
			String name = (String) iter.next();
			String[] values = (String[]) requestParams.get(name);
			String valueStr = "";
			for (int i = 0; i < values.length; i++) {
				valueStr = (i == values.length - 1) ? valueStr + values[i]
						: valueStr + values[i] + ",";
			}
			;
			//����������δ����ڳ�������ʱʹ�á����mysign��sign�����Ҳ����ʹ����δ���ת��
			//valueStr = new String(valueStr.getBytes("ISO-8859-1"), "gbk");
			params.put(name, valueStr);
		}
		//��ȡ֧������֪ͨ���ز������ɲο������ĵ���ҳ����תͬ��֪ͨ�����б�(���½����ο�)//
			//�̻�������

			String out_trade_no = new String(request.getParameter("out_trade_no").getBytes("ISO-8859-1"),"UTF-8");
			//֧�������׺�

			String trade_no = new String(request.getParameter("trade_no").getBytes("ISO-8859-1"),"UTF-8");

			//����״̬
			//String trade_status = new String(request.getParameter("trade_status").getBytes("ISO-8859-1"),"UTF-8");

			//��ȡ֧������֪ͨ���ز������ɲο������ĵ���ҳ����תͬ��֪ͨ�����б�(���Ͻ����ο�)//
			//����ó�֪ͨ��֤���
			//boolean AlipaySignature.rsaCheckV1(Map<String, String> params, String publicKey, String charset, String sign_type)
			boolean verify_result = AlipaySignature.rsaCheckV1(params, AlipayConfig.ALIPAY_PUBLIC_KEY, AlipayConfig.CHARSET, "RSA2");
			
			//�޸����ݿ�
			dto.put("increment", request.getParameter("total_amount"));
			service.update("rechargeMoney");
			
			if(verify_result){//��֤�ɹ�
				//////////////////////////////////////////////////////////////////////////////////////////
				//������������̻���ҵ���߼��������
				
				//�������������ҵ���߼�����д�������´�������ο�������
				
//				if(trade_status.equals("TRADE_FINISHED")){
//					//�жϸñʶ����Ƿ����̻���վ���Ѿ���������
//						//���û�������������ݶ����ţ�out_trade_no�����̻���վ�Ķ���ϵͳ�в鵽�ñʶ�������ϸ����ִ���̻���ҵ�����
//						//������ж�����ʱ��total_fee��seller_id��֪ͨʱ��ȡ��total_fee��seller_idΪһ�µ�
//						//���������������ִ���̻���ҵ�����
//						
//					//ע�⣺
//					//���ǩԼ���ǿ��˿�Э�飬�˿����ڳ������˿����޺��������¿��˿��֧����ϵͳ���͸ý���״̬֪ͨ
//					//���û��ǩԼ���˿�Э�飬��ô������ɺ�֧����ϵͳ���͸ý���״̬֪ͨ��
//				} else if (trade_status.equals("TRADE_SUCCESS")){
//					//�жϸñʶ����Ƿ����̻���վ���Ѿ���������
//						//���û�������������ݶ����ţ�out_trade_no�����̻���վ�Ķ���ϵͳ�в鵽�ñʶ�������ϸ����ִ���̻���ҵ�����
//						//������ж�����ʱ��total_fee��seller_id��֪ͨʱ��ȡ��total_fee��seller_idΪһ�µ�
//						//���������������ִ���̻���ҵ�����
//					String increment= request.getParameter("total_amount");
//					dto.put("increment", increment);
//					service.update("recharge");
//					//ע�⣺
//					//���ǩԼ���ǿ��˿�Э�飬��ô������ɺ�֧����ϵͳ���͸ý���״̬֪ͨ��
//				}

				//�������������ҵ���߼�����д�������ϴ�������ο�������
//				out.clear();
//				out.println("success");	//�벻Ҫ�޸Ļ�ɾ��

				//////////////////////////////////////////////////////////////////////////////////////////
			}else{//��֤ʧ��
//				out.println("fail");
			}
		return BaseServlet.prefix+"advertise/paySuccess";
	}

}
