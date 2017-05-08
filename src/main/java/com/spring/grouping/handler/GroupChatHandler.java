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
import com.spring.grouping.user.domain.UserVO;


public class GroupChatHandler extends TextWebSocketHandler {
	
	private static final Logger logger = LoggerFactory.getLogger(ChatHandler.class);
	/**
	 * 접속관련 Event Method
	 * param WebSocketSession 접속한 사용자
	 */
	private List<WebSocketSession> connectedUsers;
	private static Map<String, Object> groupmap;
	
	public GroupChatHandler(){
		System.out.println("에코핸들러가 불립니다.");
		groupmap = new HashMap<String, Object>();
		connectedUsers = new ArrayList<WebSocketSession>();
	}
	
	@SuppressWarnings("unchecked")
	public static List<UserVO> getCurrentUser(String seq_grp_number){
		List<UserVO> userlist = new ArrayList<UserVO>();
		List<WebSocketSession> conn = (List<WebSocketSession>) groupmap.get(seq_grp_number);
		for(WebSocketSession usersession : conn){
			Map<String, Object> map = usersession.getAttributes();
			String user_id = (String) map.get("user_id");
			String user_name = (String) map.get("user_name");
			UserVO user = new UserVO(user_id, user_name);
			userlist.add(user);
		}
		
		
		return userlist;
	}
	
	@SuppressWarnings("unchecked")
	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		// TODO Auto-generated method stub
		Map<String, Object> map = session.getAttributes();
		String user_id = (String)map.get("user_id");
		String seq_grp_number = (String)map.get("seq_grp_number");
		logger.info("접속 ID: "+user_id);
		logger.info("연결 IP:" + session.getRemoteAddress().getHostName());	
		logger.info("연결 그룹 : " +seq_grp_number);		
	if(!groupmap.containsKey(seq_grp_number)){
		groupmap.put(seq_grp_number, new ArrayList<WebSocketSession>());
	}
		List<WebSocketSession> conn = (List<WebSocketSession>) groupmap.get(seq_grp_number);
		conn.add(session);
		groupmap.put(seq_grp_number, conn);
	}
	
	
	/**
	 * 2가지 이벤트 처리
	 * 1. Send : 클라이언트 서버에게 메시지 보냄
	 * 2. Emit : 서버에 연결되어 있는 클라이언트들에게 메시지 보냄
	 * 
	 * param WebSocketSession 메시지를 보낸 클라이언트
	 * param TextMessage 메시지의 내용
	 */
	@SuppressWarnings("unchecked")
	@Override
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
		// TODO Auto-generated method stub
		Map<String, Object> map = session.getAttributes();
		String user_name = (String)map.get("user_name");
		String user_id = (String)map.get("user_id");
		String seq_grp_number = (String)map.get("seq_grp_number");
		logger.info("-----------------------");
		logger.info("user 이름 : "+user_name);
		logger.info("Group 번호 : "+seq_grp_number);
		logger.info("메시지 : "+message.getPayload());			
		List<WebSocketSession> conn = (List<WebSocketSession>) groupmap.get(seq_grp_number);
		Map<String, Object> data = new HashMap<String, Object>();
		data.put("user_name", user_name);
		data.put("user_id", user_id);
		data.put("message", message.getPayload());
		data.put("join_user_count", conn.size());
		ObjectMapper om = new ObjectMapper();
		 String jsonStr = om.writeValueAsString(data);
		for(WebSocketSession webSocketSession : conn){
			if(!session.getId().equals(webSocketSession)){
				webSocketSession.sendMessage(new TextMessage(jsonStr));
				
				
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
		String user_name = (String)map.get("user_name");
		
		String seq_grp_number = (String)map.get("seq_grp_number");
		logger.info(user_name + "님 접속 종료");		
		List<WebSocketSession> conn = (List<WebSocketSession>) groupmap.get(seq_grp_number);
		Map<String, Object> data = new HashMap<String, Object>();
		data.put("user_name", user_name);
		data.put("message", "님이 접속을 종료하였습니다.");
		data.put("join_user_count", conn.size());
		ObjectMapper om = new ObjectMapper();
		 String jsonStr = om.writeValueAsString(data);
		for(WebSocketSession webSocketSession : conn){
			if(!session.getId().equals(webSocketSession)){
				webSocketSession.sendMessage(new TextMessage(jsonStr));		
			}
		}
		conn.remove(session);
	}

	
	

}
