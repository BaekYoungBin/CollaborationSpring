package com.spring.grouping.handler;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.dao.DataAccessException;
import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ResponseStatus;

import com.spring.grouping.common.exception.MyTransactionException;

/*
 * Exception 글로벌 처리
 */
/*@ControllerAdvice*/
public class AnnotationExceptionHandler {
	private static final Logger logger = LoggerFactory.getLogger(AnnotationExceptionHandler.class);
	
	/*
	 * check 예외 처리
	 * 
	 */
	@ExceptionHandler(Exception.class)	
    public void handleException(HttpServletRequest request, Exception e) {
		logger.error("Request: "+request.getRequestURL()+ "raised "+e);
		logger.error("Request: "+request.getParameterNames());
    }
     
	/*
	 * uncheck 예외 처리
	 * 
	 */
    @ExceptionHandler(RuntimeException.class)
    @ResponseStatus(HttpStatus.INTERNAL_SERVER_ERROR)
    public void handleRuntimeException(HttpServletRequest request, RuntimeException e) {  	
    	logger.error("Request: "+request.getRequestURL()+ "raised "+e);
    	logger.error("Request: "+request.getAttribute("javax.servlet.error.status_code"));   	
    }
    
    /*
	 * sql 예외 처리
	 * 
	 */
    @ExceptionHandler({SQLException.class, DataAccessException.class}) 
    public void handleDBException() {
    	logger.error("database Exception");
    }
    
    /*
	 * 트랜잭션 예외 처리
	 * 
	 */
    @ExceptionHandler({MyTransactionException.class}) 
    public void handleMyTransactionException(HttpServletRequest request, MyTransactionException e) {
    	logger.error("error message :"+e.getMessage()+ "error code : "+e.getErrCode()+"Request url: "+request.getRequestURL());
    }
   
    @ExceptionHandler({IOException.class}) 
    public void handleMIOException(HttpServletRequest request, Exception e) {
    	logger.error("error message :"+e.getMessage()+ "error code : "+e.getMessage()+"Request url: "+request.getRequestURL());
    }
}
