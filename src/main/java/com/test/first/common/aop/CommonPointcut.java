package com.test.first.common.aop;

import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Pointcut;

@Aspect //aop를 의미함
public class CommonPointcut {
	//포인트컷 설정 메소드들만 따로 모아서 작성한 케이스임
	
	//포인트컷 설정
	//execution(접근제어자 패키지명.타겟클래스명.타겟메소드명(파라미터))
	//패키지.. : 모든 하위 패키지를 의미함
	//메소드(..): 모든 형식의 매개변수를 의미함
	@Pointcut("execution(* com.test.first..*Impl.*(..))")
	public void serviceAllPointcut() {}
	
	@Pointcut("execution(* com.test.first..*Impl.select*(..))")
	public void getPointcut() {}
	
	@Pointcut("execution(* com.test.first..*Impl.insert*(..))")
	public void setPointcut() {}
}
