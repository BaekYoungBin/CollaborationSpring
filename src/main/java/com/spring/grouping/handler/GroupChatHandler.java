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


public class GroupChatHandler extends TextWebSocketHandler {
	
	private static final Logger logger = LoggerFactory.getLogger(ChatHandler.class);
	/**
	 * 접속관련 Event Method
	 * param WebSocketSession 접속한 사용자
	 */
	private List<WebSocketSession> connectedUsers;
	private Map<String, Object> groupmap;
	
	public GroupChatHandler(){
		System.out.println("에코핸들러가 불립니다.");
		groupmap = new HashMap<String, Object>();
		connectedUsers = new ArrayList<WebSocketSession>();
	}
	
	
	@SuppressWarnings("unchecked")
	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		// TODO Auto-generated method stub
		Map<String, Object> map = session.getAttributes();
		String user_id = (String)map.get("user_id");
		String seq_grp_number = (String)map.get("seq_grp_number");
		logger.info(user_id + "님 접속");
		logger.info("연결 IP:" + session.getRemoteAddress().getHostName());	
		logger.info("연결 그룹 : " +seq_grp_number);
	if(!groupmap.containsKey(seq_grp_number)){
		groupmap.put(seq_grp_number, new ArrayList<WebSocketSession>());
	}
		List<WebSocketSession> conn = (List<WebSocketSession>) groupmap.get(seq_grp_number);
		conn.add(session);
		groupmap.put(seq_grp_number, conn);
		
/*		connectedUsers.add(session);	*/	
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

		Map<String, Object> map = session.getAttributes();
		String user_id = (String)map.get("user_id");
		String seq_grp_number = (String)map.get("seq_grp_number");
		logger.info(user_id + "님이 "+seq_grp_number+"그룹에 메시지 전송 : " + message.getPayload());
		
		List<WebSocketSession> conn = (List<WebSocketSession>) groupmap.get(seq_grp_number);
		for(WebSocketSession webSocketSession : conn){
			if(!session.getId().equals(webSocketSession)){
				webSocketSession.sendMessage(new TextMessage(user_id+" "+message.getPayload()));
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
		Map<String, Object> map = session.getAttributes();
		String user_id = (String)map.get("user_id");
		String seq_grp_number = (String)map.get("seq_grp_number");
		
		logger.info(user_id + "님 접속 종료");
		List<WebSocketSession> conn = (List<WebSocketSession>) groupmap.get(seq_grp_number);
		conn.remove(session);
	}

	
	

}
