package com.ego.websocket;

import com.alibaba.fastjson.JSON;
import com.ego.services.impl.Ae01ServicesImpl;
import com.ego.services.impl.Ae02ServicesImpl;

import javax.websocket.*;
import javax.websocket.server.PathParam;
import javax.websocket.server.ServerEndpoint;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;


/**
 * websocket服务端，处理各种websocket请求
 * @author zyf
 *
 */
@ServerEndpoint(value = "/websocket/{uid}")
public class MyWebSocketServer 
{
	private static ConcurrentHashMap<String, Session> webSocketMap = new ConcurrentHashMap<>();
	private static Ae01ServicesImpl ae01Services=new Ae01ServicesImpl();
	private static Ae02ServicesImpl ae02Services=new Ae02ServicesImpl();
	
	@OnOpen
	public void onOpen(@PathParam("uid") String uid, Session session) throws Exception 
	{
		webSocketMap.put(uid, session);
		dealWithUnreadedMessage(uid);
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
	 * @param uid 用户id
	 * @throws Exception
	 */
	private void dealWithUnreadedMessage(String uid) throws Exception 
	{
		Map<String, Object> dto=new HashMap<>();
		dto.put("to", uid);
		//未读一对一消息
		List<Map<String, String>> list1=ae02Services.queryAe02(dto);
		for(int i=0;i<list1.size();i++)
		{
			Map<String, String> ins=list1.get(i);
			ae02Services.modifyAe02(ins.remove("aae201"));
			ins.put("from", ins.remove("aae202"));
			ins.put("to", ins.remove("aae203"));
			ins.put("content", ins.remove("aae205"));
			ins.put("date", ins.remove("aae204"));
			ins.put("type", "1");
			sendText(webSocketMap.get(uid), JSON.toJSONString(ins));
		}
		
		//未读一对多通知消息
		List<Map<String, String>> list2=ae01Services.queryAe01(dto);
		for(int i=0;i<list2.size();i++)
		{
			Map<String, String> ins=list2.get(i);
			ae01Services.modifyAe01(ins.remove("aae301"));
			ins.put("from", ins.remove("aae103"));
			ins.put("to", ins.remove("aae302"));
			ins.put("content", ins.remove("aae102"));
			ins.put("date", ins.remove("aae104"));
			ins.put("type", "2");
			sendText(webSocketMap.get(uid), JSON.toJSONString(ins));
		}
	}
	
	/**
	 * 解析客户端发来消息，并转发给对应用户，同时将消息存入数据库
	 * type 1:一对一聊天
	 * 		2:一对多公告通知
	 * @param message 客户端发来的消息，为json格式字符串
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	private void parseMessage(String message) throws Exception 
	{
	    Map<String,Object> dto= JSON.parseObject(message,Map.class);
        String to = String.valueOf(dto.get("to"));
        String type = String.valueOf(dto.get("type"));
		if (type.equals("1")) 
		{
			Session session = webSocketMap.get(to);
			if (session != null) {
				sendText(session, message);
				dto.put("state", "1");
				ae02Services.addAe02(dto);
			} 
			else 
			{
				dto.put("state", "0");
				ae02Services.addAe02(dto);
			}
		} 
		else if (type.equals("2")) 
		{
			ArrayList<String> users=ae01Services.getUsersToSend(dto);
			ArrayList<String> received=new ArrayList<>();
			ArrayList<String> unreceived=new ArrayList<>();
			for(String user:users)
			{
				Session session = webSocketMap.get(user);
				if(session!=null)
				{
					sendText(session, message);
					received.add(user);
				}
				else 
				{
					unreceived.add(user);
				}
			}
			dto.put("received", received.toArray());
			dto.put("unreceived", unreceived.toArray());
			//向表中一次性添加这次群发消息
			ae01Services.addAe01(dto);
		}
		else
		{
			throw new Exception("type错误");
		}
	}

	private void sendText(Session session, String message) throws Exception 
	{
		session.getBasicRemote().sendText(message);
	}
}