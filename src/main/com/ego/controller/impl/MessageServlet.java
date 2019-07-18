package com.ego.controller.impl;

import com.ego.controller.ControllerSupport;
import com.ego.services.impl.Ae01ServicesImpl;

import javax.servlet.http.HttpServletRequest;
import java.util.List;
import java.util.Map;

public class MessageServlet extends ControllerSupport
{
    public MessageServlet()
    {
        this.setServices(new Ae01ServicesImpl());
    }

    @Override
    public String execute() throws Exception
    {
        String path;
        String servletPath=((HttpServletRequest)this.dto.get("request")).getServletPath();
        String mapping=servletPath.substring(servletPath.lastIndexOf('/')+1
                ,servletPath.indexOf('.'));

        switch (mapping)
        {
            case "sendMessage":
                String msg=this.getServices().update("insert")?"发送成功！":"发送失败！";
                this.saveAttribute("msg", msg);
                path="message/send";
                break;

            case "readMessage":
                List<Map<String,String>> list =this.getServices().query();
                this.saveAttribute("messages", list);
                path="message/read";
                break;

            default:
                throw new Exception("MessageServlet无法处理此类请求:"+mapping);
        }
        return path;
    }
}
