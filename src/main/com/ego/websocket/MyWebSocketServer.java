package com.ego.websocket;

import com.alibaba.fastjson.JSON;
import com.ego.services.impl.Ae02ServicesImpl;

import javax.websocket.*;
import javax.websocket.server.PathParam;
import javax.websocket.server.ServerEndpoint;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

/**
 * websocket服务端，处理各种websocket请求
 *
 * @author zyf
 */
@ServerEndpoint(value = "/websocket/{uid}")
public class MyWebSocketServer {
    private static ConcurrentHashMap<String, Session> webSocketMap = new ConcurrentHashMap<>();
    private static Ae02ServicesImpl ae02Services = new Ae02ServicesImpl();

    @OnOpen
    public void onOpen(@PathParam("uid") String uid, Session session) throws Exception
    {
        webSocketMap.put(uid, session);
        dealWithPastMessage(uid);
        System.out.println("onOpen " + webSocketMap);
    }

    @OnClose
    public void onClose(@PathParam("uid") String uid)
    {
        webSocketMap.remove(uid);
        System.out.println("onClose " + webSocketMap);
    }

    @OnMessage
    public void onMessage(String message) throws Exception
    {
        parseMessage(message);
        System.out.println("onMessage " + message + " " + webSocketMap);
    }

    @OnError
    public void onError(Throwable error)
    {
        error.printStackTrace();
        System.out.println("onError " + webSocketMap);
    }

    /**
     * 处理未读聊天信息
     *
     * @param uid 用户id
     * @throws Exception
     */
    private void dealWithPastMessage(String uid) throws Exception
    {
        Map<String, Object> dto = new HashMap<>();
        dto.put("to", uid);
        //未读一对一消息
        List<Map<String, String>> list1 = ae02Services.query(dto);
        for (Map<String, String> ins : list1)
        {
            ins.put("from", ins.remove("aae202"));
            ins.put("to", ins.remove("aae203"));
            ins.put("content", ins.remove("aae205"));
            ins.put("date",ins.remove("aae204"));
            sendText(webSocketMap.get(uid), JSON.toJSONString(ins));
        }
    }

    /**
     * 解析客户端发来消息，并转发给对应用户，同时将消息存入数据库
     *
     * @param message 客户端发来的消息，为json格式字符串
     * @throws Exception
     */
    private void parseMessage(String message) throws Exception
    {
        Map<String, Object> dto = JSON.parseObject(message, Map.class);
        //修改消息状态的消息
        if(dto.get("type")!=null&& dto.get("type").equals("01"))
        {
            ae02Services.modify(dto);
            return;
        }

        String to = String.valueOf(dto.get("to"));
        Session session = webSocketMap.get(to);
        if (session != null)
        {
            sendText(session, message);
            dto.put("state", "02");
            ae02Services.insert(dto);
        }
        else
        {
            dto.put("state", "01");
            ae02Services.insert(dto);
        }
    }

    private void sendText(Session session, String message) throws Exception
    {
        session.getBasicRemote().sendText(message);
    }
}
