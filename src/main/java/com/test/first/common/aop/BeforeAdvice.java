package com.test.first.common.aop;

import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;
import org.aspectj.lang.annotation.Pointcut;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

@Service //서비스 클래스에 적용하는 
@Aspect //aop를 의미함
public class BeforeAdvice {
	//목적: 로그 출력용 메소드를 사용해서 aop를 구동 테스트해 봄
	//어드바이스 클래스 안에서 포인트컷 설정을 직접 작성하고,
	//바로 위빙할 메소드에 포인트컷을 바로 적용 테스트해 봄
	
	//private Logger logger = LoggerFactory.getLogger(BeforeAdvice.class);
	private Logger logger = LoggerFactory.getLogger(getClass());
	
	//BeforeAdvice 가 사용할 포인트컷 설정 : 메소드 형태로 설정함
	//메소드 안에 내용이 없어야 함
	@Pointcut("execution(* com.test.first..*Controller.*(...))")
	public void allPointcut() {
		
	}
	
	//실행시킬 내용에 대한 코드 작성
	@Before("allPointCut()")
	public void beforeLog(JoinPoint jp) {
		
	}
}
