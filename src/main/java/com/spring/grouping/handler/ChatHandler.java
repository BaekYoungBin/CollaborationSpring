package com.spring.grouping.handler;

import java.util.ArrayList;
import java.util.List;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;


public class ChatHandler extends TextWebSocketHandler {
	
	private static final Logger logger = LoggerFactory.getLogger(ChatHandler.class);
	/**
	 * 접속관련 Event Method
	 * param WebSocketSession 접속한 사용자
	 */
	private List<WebSocketSession> connectedUsers;
	
	public ChatHandler(){
		System.out.println("에코핸들러가 불립니다.");
		connectedUsers = new ArrayList<WebSocketSession>();
	}
	
	
	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		// TODO Auto-generated method stub

		logger.info(session.getId() + "님 접속");
		logger.info("연결 IP:" + session.getRemoteAddress().getHostName());
		connectedUsers.add(session);
		
	}
	
	
	/**
	 * 2가지 이벤트 처리
	 * 1. Send : 클라이언트 서버에게 메시지 보냄
	 * 2. Emit : 서버에 연결되어 있는 클라이언트들에게 메시지 보냄
	 * 
	 * param WebSocketSession 메시지를 보낸 클라이언트
	 * param TextMessage 메시지의 내용
	 */
	@Override
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
		// TODO Auto-generated method stub
		System.out.println("여기2번");
		logger.info(session.getId() + "님이 메시지 전송 : " + message.getPayload());
		for(WebSocketSession webSocketSession : connectedUsers){
			if(!session.getId().equals(webSocketSession)){
				webSocketSession.sendMessage(new TextMessage(session.getId()+" "+message.getPayload()));
			}
		}
	}
	
	/**
	 * 클라이언트가 서버와 연결 종료
	 * 
	 * param WebSocketSession 연결을 끊은 클라이언트
	 * CloseStatus 연결 상태(확인 필요)
	 * 
	 */
	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
		// TODO Auto-generated method stub
		logger.info(session.getId() + "님 접속 종료");
		connectedUsers.remove(session);
	}

	
	

}
