package com.ego.controller.impl;

import com.ego.controller.ControllerSupport;
import com.ego.services.impl.Ae02ServicesImpl;

/**
 * 初始化聊天窗口
 */
public class InitChat extends ControllerSupport {
    public InitChat()
    {
        this.setServices(new Ae02ServicesImpl());
    }

    @Override
    public String execute() throws Exception
    {
        String msg=this.getServices().update("insert")?"成功":"失败";
        this.saveAttribute("mag",msg);
        return "message/bbb.jsp";
    }
}
