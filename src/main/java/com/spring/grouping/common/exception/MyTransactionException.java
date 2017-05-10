package com.spring.grouping.common.exception;
import org.springframework.transaction.interceptor.TransactionAspectSupport;
public class MyTransactionException extends Exception{
	private final int ERR_CODE;// 생성자를 통해 초기화 한다.
	private static final long serialVersionUID = 6911015649157021782L;
	public MyTransactionException(String msg, int errcode){ //생성자
		super(msg);
		ERR_CODE=errcode;
		TransactionAspectSupport.currentTransactionStatus().setRollbackOnly();
	}
	
	public int getErrCode(){// 에러 코드를 얻을 수 있는 메서드도 추가한다.
		return ERR_CODE;// 이 메서드는 주로 getMessage()와 함께 사용될 것이다.
	}

	@Override
	public String getMessage() {
		// TODO Auto-generated method stub
		return super.getMessage();
	}

	
}
