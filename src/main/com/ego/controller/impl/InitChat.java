package com.ego.controller.impl;

import com.ego.controller.ControllerSupport;
import com.ego.services.impl.Ae02ServicesImpl;

/**
 * ��ʼ�����촰��
 */
public class InitChat extends ControllerSupport {
    public InitChat()
    {
        this.setServices(new Ae02ServicesImpl());
    }

    @Override
    public String execute() throws Exception
    {
        String msg=this.getServices().update("insert")?"�ɹ�":"ʧ��";
        this.saveAttribute("mag",msg);
        return "message/bbb.jsp";
    }
}
