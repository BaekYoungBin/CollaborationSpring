package com.spring.grouping.handler;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import com.fasterxml.jackson.databind.ObjectMapper;

public class ChatHandler extends TextWebSocketHandler {
	private static final Logger logger = LoggerFactory.getLogger(ChatHandler.class);
	
	/**
	 *WebSocketSession 접속한 사용자 리스트
	 */
	private List<WebSocketSession> connectedUsers;

	/**
	 * 채팅 핸들러 생성자
	 *	접속유저 리스트에 웹소켓 리스트 초기화
	 */
	public ChatHandler() {
		connectedUsers = new ArrayList<WebSocketSession>();
	}

	/**
	 * 소켓 접속 설정
	 * 접속한 사용자 WebSocketSession을 connectedUser(접속유저세션리스트)에 세션 추가
	 * @throws Exception
	 */
	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		// TODO Auto-generated method stub
		logger.info(session.getId() + "님 접속");
		logger.info("연결 IP:" + session.getRemoteAddress().getHostName());
		connectedUsers.add(session);

	}

	/**
	 * 소켓 메시지 이벤트 왔을 시 처리 
	 * @param WebSocketSession 메시지를 보낸 클라이언트 
	 * @param TextMessage 메시지의 내용
	 * sendMessage : jsonType의 유저 정보+메시지
	 */
	@Override
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
		// TODO Auto-generated method stub

		Map<String, Object> map = session.getAttributes();
		String user_name = (String) map.get("user_name");
		String user_id = (String) map.get("user_id");
		logger.info("-----------전체 채팅방------------");
		logger.info("user 이름 : " + user_name);
		logger.info("메시지 : " + message.getPayload());
		logger.info("------------------------------");
		Map<String, Object> data = new HashMap<String, Object>();
		data.put("user_name", user_name);
		data.put("user_id", user_id);
		data.put("message", message.getPayload());
		ObjectMapper om = new ObjectMapper();
		String jsonStr = om.writeValueAsString(data);
		for (WebSocketSession webSocketSession : connectedUsers) {
			if (!session.getId().equals(webSocketSession)) {
				webSocketSession.sendMessage(new TextMessage(jsonStr));
			}
		}
	}

	/**
	 * 연결 종료 이벤트 함수
	 * connectedUser(접속유저세션리스트)에서 해당 세션 제거
	 * @return
	 * @throws Exception
	 */
	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
		// TODO Auto-generated method stub
		logger.info(session.getId() + "님 접속 종료");
		connectedUsers.remove(session);
	}

}
