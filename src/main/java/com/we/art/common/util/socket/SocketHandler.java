package com.we.art.common.util.socket;

import java.util.List;
import java.util.concurrent.CopyOnWriteArrayList;

import org.springframework.stereotype.Component;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

@Component
public class SocketHandler extends TextWebSocketHandler{
	
	// 연결된 유저들을 저장하는 배열
	List<WebSocketSession> sessions = new CopyOnWriteArrayList<>();
	
	@Override
	public void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
		for (WebSocketSession webSocketSession : sessions) { // 메세지가 온다면
            if (webSocketSession.isOpen() && !session.getId().equals(webSocketSession.getId())) { // 세션이열려있고, 보낸사람이 아니라면
                webSocketSession.sendMessage(message); // 메세지 전송
            }
        }
	}
	
	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		sessions.add(session); // 수신된 세션을 세션 목록에 저장
	}
	
}
