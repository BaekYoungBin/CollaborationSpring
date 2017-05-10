package com.spring.grouping.common.aop;

import javax.servlet.http.HttpServletRequest;

import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartHttpServletRequest;

@Aspect
@Component
public class LoggerAspect {
	Logger logger = LoggerFactory.getLogger(getClass());
	static String name = "";
	static String type = "";

	/**
	 * Method 정상 실행 시
	 * 
	 * @param joinPoint
	 * @throws Exception
	 */
	@Around("execution(* com..*Controller.*(..))")
	public Object loggingControllerAdvice(ProceedingJoinPoint joinPoint) throws Throwable {
		logger.info("method path : \t" + joinPoint.getSignature());
		type = joinPoint.getSignature().getDeclaringTypeName();
		name = "Controller : \t";
		logger.info(name + type + "." + joinPoint.getSignature().getName() + "()");
		for(Object ob :joinPoint.getArgs()){
			logger.info("parameter : "+ ob.toString());			
		}	
		return joinPoint.proceed();
	}

	@Around("execution(* com..*Service.*(..))")
	public Object loggingServiceAdvice(ProceedingJoinPoint joinPoint) throws Throwable {
		logger.info("method path : \t" + joinPoint.getSignature());
		type = joinPoint.getSignature().getDeclaringTypeName();
		name = "Service  \t:  ";
		logger.info(name + type + "." + joinPoint.getSignature().getName() + "()");
		for(Object ob :joinPoint.getArgs()){
			logger.info("parameter : "+ ob.toString());			
		}
		return joinPoint.proceed();
	}
}
