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
 * websocket����ˣ��������websocket����
 *
 * @author zyf
 */
@ServerEndpoint(value = "/websocket/{uid}")
public class WebSocketServer {
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
     * ����δ��������Ϣ
     *
     * @param uid �û�id
     * @throws Exception
     */
    private void dealWithPastMessage(String uid) throws Exception
    {
        Map<String, Object> dto = new HashMap<>();
        dto.put("from_id", uid);
        dto.put("to_id", uid);
        List<Map<String, String>> list = ae02Services.query(dto);
        for (Map<String, String> ins : list)
        {
            sendText(webSocketMap.get(uid), JSON.toJSONString(ins));
        }
    }

    /**
     * �����ͻ��˷�����Ϣ����ת������Ӧ�û���ͬʱ����Ϣ�������ݿ�
     *
     * @param message �ͻ��˷�������Ϣ��Ϊjson��ʽ�ַ���
     * @throws Exception
     */
    private void parseMessage(String message) throws Exception
    {
        Map<String, Object> dto = JSON.parseObject(message, Map.class);
        //���type=01,�޸���Ϣ״̬����Ϣ
        if(dto.get("type")!=null&& dto.get("type").equals("01"))
        {
            ae02Services.modify(dto);
            return;
        }

        String to = String.valueOf(dto.get("to_id"));
        Session session = webSocketMap.get(to);
        if (session != null)
        {
            sendText(session, message);
        }
        ae02Services.insert(dto);
    }

    private void sendText(Session session, String message) throws Exception
    {
        session.getBasicRemote().sendText(message);
    }
}
