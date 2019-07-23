package com.ego.controller.impl;

import com.ego.controller.ControllerSupport;
import com.ego.services.impl.Ae01ServicesImpl;

import javax.servlet.http.HttpServletRequest;
import java.util.List;
import java.util.Map;

public class MessageServlet extends ControllerSupport
{
    public MessageServlet() {
        this.setServices(new Ae01ServicesImpl());
    }

    @Override
    public String execute() throws Exception
    {
        String path;
        String servletPath = ((HttpServletRequest) this.dto.get("request")).getServletPath();
        String mapping = servletPath.substring(servletPath.lastIndexOf('/') + 1
                , servletPath.indexOf('.'));

        List<Map<String, String>> list;
        switch (mapping)
        {
            case "initMessage":
                list = this.getServices().query("getUserList");
                Object aab102 = this.get("aab102") == null ? this.get("aac102") : this.get("aab102");
                aab102 = aab102 == null ? 0 : aab102;
                this.saveAttribute("aae103", aab102);
                this.saveAttribute("list", list);
                path = "message/sendMessage";
                break;

            case "sendMessage":
                String msg;
                try
                {
                    msg = this.getServices().update("insert") ? "发送成功！" : "发送失败！";
                }
                catch (Exception e)
                {
                    msg = "发送失败：" + e.getMessage();
                }
                this.saveAttribute("msg", msg);
                path = "message/sendMessage";
                break;

            case "readMessage":
                list = this.getServices().query("getAllMessages");
                this.saveAttribute("messages", list);
                path = "message/readMessage";
                break;

            case "listMessage":
                list = this.getServices().query("queryPastSentMessage");
                this.saveAttribute("messageList", list);
                path = "message/listMessage";
                break;
            default:
                throw new Exception("MessageServlet无法处理此类请求:" + mapping);
        }
        return path;
    }
}
