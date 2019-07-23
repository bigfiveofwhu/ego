package com.ego.controller.ajaxServlet.impl;

import com.ego.controller.ajaxServlet.AjaxControllerSupport;
import com.ego.services.impl.Ae02ServicesImpl;

import javax.servlet.http.HttpSession;

public class InitChatController extends AjaxControllerSupport {

    @Override
    public void execute(HttpSession session) throws Exception {
        this.setService(new Ae02ServicesImpl());
        //����ҳĬ�Ϸ����б�
        if (this.get("from_id") == null)
        {
            this.put("status", "200");
            return;
        }

        //�������֮�������Ϣ��¼����Ĭ�Ϸ����б�
        if(this.getService().update("exist"))
        {
            this.put("status", "200");
            return;
        }

        if (this.getService().update("insert"))
        {
            this.put("status", "200");
        }
        else
       {
            this.put("status", "201");  //ʧ��
        }
    }
}
