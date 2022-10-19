<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>testAOPPage</title>
</head>
<body>
<h1>Spring framework 특징</h1>
<ul>
	<li>POJO(Plain Object Java Object) 기반으로 구성</li>
	<li>DI(Dependency Injection : 의존성 주입)</li>
	<li>트랜잭션 지원 : 필요한 경우 xml로 설정할 수 있다</li>
	<li>IOC(Invert of Control) : 제어권 반전</li>
	<li>AOP(Aspect Oriented Programming : 관점 지향 프로그래밍)
</ul>
<hr>
<h2>AOP란?</h2>
<p>
<b>Aspect에 대한 Advice를 Target Object의 Join Point에 해당하는
pointcut에 weaving 되게 설정하는 것</b><br>
주로 비즈니스 로직을 처리하는 클래스(Serivce, Repository : dAO)에 
적용됨<br>
</p>
<h4>
OOP 에서는 클래스별로 중복되는 공통 기능을 하나의 클래스로 분리하여
작성하고, 사용이 필요한 클래스는 코드를 가진 클래스를 상속받거나
또는 의존관계(사용이 필요한 다른 클래스의 메소드를 객체 생성해서
호출하는 방식)를 맺는다.
</h4>
<h4>스프링에서는 AOP로 해결함</h4>
<h4>
스프링에서의 AOP는 분리한 공통 기능을 직접적으로 호출하지 않는다.
분리한 공통 기능의 호출을 관점(Aspect)으로 다룬다.
즉, 각 모듈(클래스)에 호출 코드를 횡단 관점이라고 하고, AOP에서는
횡단관점까지 분리하는 것이 목표이다. =>
즉, 모듈에 분리된 공통 기능에 대한 호출 코드를 완전히 제거하는 것이
스프링 AOP임.
</h4>
<ol>
	<li><h5>JoinPoint</h5></li>
	<li><h5>Advice</h5></li>
	<li><h5>Pointcut</h5></li>
	<li><h5>Weaving</h5></li>
	<li><h5>Target Object</h5>
		<ul>
			<li>핵심 로직을 가진 클래스를 말함 : Service | Dao 클래스</li>
			<li>어드바이스 위빙 대상 객체</li>
			<li>스프링에서는 런타임 프록시를 사용해서 위빙 처리함</li>
		</ul>
	</li>
	<li><h5>Aspect</h5>
		<ul>
			<li>공통 기능을 분리 작성해 놓은 클래스</li>
			<li>분리 작성된 공통 기능(메소드)</li>
			<li>여러 객체에 공통으로 사용되는 공통 관점 지향</li>
			<li>로깅, 트랜잭션, 보안코드 등이 Aspect 의 좋은 사용 예임</li>
		</ul>
	</li>
</ol>
</body>
</html>