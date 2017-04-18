package com.spring.grouping.common.aop;
import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Component;
@Aspect
@Component
public class LoggerAspect {
	 Logger logger = LoggerFactory.getLogger(getClass());
	static String name ="";
	static String type ="";
	/**
     * Method 정상 실행 시
     * @param joinPoint
     * @throws Exception
     */
/*	@Pointcut("com.spring.grouping..*Controller.*(..)")
	private void pointcutMethod(){
		
	}*/
	
	
/*	@Around("pointcutMethod()")*/
/*	@Around("execution(* com.spring.grouping..*Controller.*(..))")
	public Object logPrint(ProceedingJoinPoint joinPoint) throws Throwable {
		System.out.println("여기안오나");
		logger.info("##### " + joinPoint.getSignature() + " Function approach #####");
		type = joinPoint.getSignature().getDeclaringTypeName();
		logger.debug(name + type + "." + joinPoint.getSignature().getName() + "()");
		 return joinPoint.proceed();
	}	*/
/*	
	@Pointcut("within(com.spring.grouping.*)")
	private void pointcutMethod() {
	}*/
	
	
	@Around("execution(* com..*Controller.*(..))" 
            + "execution(* com..*Service.*(..))")
	 public Object loggingAdvice(ProceedingJoinPoint joinPoint)throws Throwable {
		 logger.info("method path : \t" + joinPoint.getSignature());
		 type = joinPoint.getSignature().getDeclaringTypeName();     
	        if (type.indexOf("Controller") > -1) {
	            name = "Controller  \t:  ";
	        }
	        else if (type.indexOf("Service") > -1) {
	            name = "ServiceImpl  \t:  ";
	        }
	        logger.info(name + type + "." + joinPoint.getSignature().getName() + "()");
	        return joinPoint.proceed();
	}

	
}
