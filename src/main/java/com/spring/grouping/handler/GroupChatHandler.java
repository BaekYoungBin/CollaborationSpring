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
import com.spring.grouping.mypage.domain.UserVO;


public class GroupChatHandler extends TextWebSocketHandler {
	
	private static final Logger logger = LoggerFactory.getLogger(ChatHandler.class);

	/**
	 *WebSocketSession 접속한 사용자 리스트
	 */
	private List<WebSocketSession> connectedUsers;

	/**
	 * 그룹정보와 세션을담고 있는 map//
	 * key = group번호
	 * data = 그룹에 접속한 사용자 웹소켓 세션 리스트
	 */
	private static Map<String, Object> groupmap;
	
	/**
	 * 생성자 초기화
	 */
	public GroupChatHandler(){
		groupmap = new HashMap<String, Object>();
		connectedUsers = new ArrayList<WebSocketSession>();
	}
	
	/**
	 * 현재 그룹에 접속한 유저 리스트 선택
	 * @return
	 */
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
	
	/**
	 * 소켓 접속 설정
	 * groupmap에서 key(seq_grp_number)를 통해 connectedUser 리스트 불러온 후
	 * 접속한 사용자 WebSocketSession을 connectedUser(접속유저세션리스트)에 세션 추가
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		// TODO Auto-generated method stub
		Map<String, Object> map = session.getAttributes();
		String user_id = (String)map.get("user_id");
		String seq_grp_number = (String)map.get("seq_grp_number");
		logger.info("----------유저 접속-------------");
		logger.info("접속 ID: "+user_id);
		logger.info("연결 IP:" + session.getRemoteAddress().getHostName());	
		logger.info("연결 그룹 : " +seq_grp_number);		
		logger.info("----------------------------");
		if(!groupmap.containsKey(seq_grp_number)){
			groupmap.put(seq_grp_number, new ArrayList<WebSocketSession>());
		}
			List<WebSocketSession> conn = (List<WebSocketSession>) groupmap.get(seq_grp_number);
			conn.add(session);
			groupmap.put(seq_grp_number, conn);
		}
	
	
	/**
	 * 소켓 메시지 이벤트 왔을 시 처리 
	 * @param WebSocketSession 메시지를 보낸 클라이언트 
	 * @param TextMessage 메시지의 내용
	 * sendMessage : jsonType의 유저 정보+메시지
	 */
	@SuppressWarnings("unchecked")
	@Override
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
		// TODO Auto-generated method stub
		Map<String, Object> map = session.getAttributes();
		String user_name = (String)map.get("user_name");
		String user_id = (String)map.get("user_id");
		String seq_grp_number = (String)map.get("seq_grp_number");
		logger.info("----------그룹 채팅방-------------");
		logger.info("user 이름 : "+user_name);
		logger.info("Group 번호 : "+seq_grp_number);
		logger.info("메시지 : "+message.getPayload());		
		logger.info("------------------------------");
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
	 * 연결 종료 이벤트 함수
	 * connectedUser(접속유저세션리스트)에서 해당 세션 제거
	 * @return
	 * @throws Exception
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
	
		
		conn.remove(session);
		session.close();
		groupmap.remove(seq_grp_number);
		groupmap.put(seq_grp_number, conn);
		
		for(WebSocketSession webSocketSession : conn){
			Map<String, Object> amap = webSocketSession.getAttributes();
			logger.info("남은 유저 : "+(String)map.get("user_name"));		
		}
		
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
		
	
	}
}
