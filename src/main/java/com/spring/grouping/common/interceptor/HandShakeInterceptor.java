package com.spring.grouping.common.interceptor;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.server.ServerHttpRequest;
import org.springframework.http.server.ServerHttpResponse;
import org.springframework.http.server.ServletServerHttpRequest;
import org.springframework.web.socket.WebSocketHandler;
import org.springframework.web.socket.server.support.HttpSessionHandshakeInterceptor;

public class HandShakeInterceptor extends HttpSessionHandshakeInterceptor{
	
	/*
	 * 소켓 연결 되기 전 요청 처리, 소켓이 연결 될 때마다 user_id, user_name, seq_grp_number를 웹소켓 세션의 attributes에 넣어준다.
	 * (non-Javadoc)
	 * @see org.springframework.web.socket.server.support.HttpSessionHandshakeInterceptor#beforeHandshake(org.springframework.http.server.ServerHttpRequest, org.springframework.http.server.ServerHttpResponse, org.springframework.web.socket.WebSocketHandler, java.util.Map)
	 */
	@Override
    public boolean beforeHandshake(ServerHttpRequest request,ServerHttpResponse response, WebSocketHandler wsHandler,
        Map<String, Object> attributes) throws Exception {    		
		Logger logger = LoggerFactory.getLogger(getClass());
		logger.info("before handshake");
		logger.info("URI:"+request.getURI());     
        ServletServerHttpRequest ssreq = (ServletServerHttpRequest) request;
        HttpServletRequest req =  ssreq.getServletRequest();
        String user_id = (String)req.getSession().getAttribute("user_id");
        String seq_grp_number = (String)req.getSession().getAttribute("user_id");
        String user_name = (String)req.getSession().getAttribute("user_name");
        attributes.put("user_id", user_id);
        attributes.put("user_name", user_name);
        attributes.put("seq_grp_number", seq_grp_number);
        logger.info("HttpSession에 저장된 id:"+user_id);    
        return super.beforeHandshake(request, response, wsHandler, attributes);
    }
}
