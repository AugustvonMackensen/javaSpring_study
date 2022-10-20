<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>kakaoLoginView</title>
<style type="text/css">
h1 {
	font-size: 48pt;
	font-color: navy;
}
div {
	width: 500px;
	height: 200px;
	border: 2px solid navy;
	position: relative; /* 본래 표시될 위치기준 상대적 위치로 지정 */
	left: 400px;
}
div form {
	font-size: 16pt;
	font-color: navy;
	font-weight: bold;
	margin: 10px;
	padding: 10px;
}
div#loginForm form input.pos {
	position: absolute;	/* 절대좌표로 위치 지정 */
	left: 120px;
	width: 300px;
	height: 25px;
}
div#loginForm form input[type=submit]{
	margin: 10px;
	width:	250px;
	height:	40px;
	position:	absolute;
	left: 120px;
	background-color: navy;
	color: white;
	font-size: 16pt;
	font-weight: bold;
}
</style>
<script type="text/javascript" src="${ pageContext.servletContext.contextPath }/resources/js/jquery-3.6.1.min.js"></script>
<script type="text/javascript" src="${ pageContext.servletContext.contextPath }/resources/js/kakao.min.js"></script>
<script src="//d1p7wdleee1q2z.cloudfront.net/post/search.min.js"></script>
</head>
<body>
<h1>카카오 로그인 api 애플리케이션 설정</h1>
<pre>
1. 회원가입 : https://developers.kakao.com/
2. 또는 카카오계정으로 로그인
3. '내 어플리케이션' 선택
	- 애플리케이션 추가하기(임의대로 작성)
	- 저장
4. 저장된 앱 클릭
- 플랫폼 클릭
<!-- 본인 서버 포트번호에 맞출 것, 본인의 경우 강의장 톰캣서버 포트번호 8888이라 8888이라 함.  -->
- web : 사이트 도메인에 url 등록 (http://localhost:포트번호)
5. url 등록 후 Redirect URI 등록 : 등록하러 가기(필수 : 등록해야 사용할 수 있음)
- 활성화 설정 ON
- redirect uri : http://localhost:포트번호/context-root명/로그인url-mapping
- 로그아웃 uri 도 같이 추가 등록함
6. (선택사항)제품설정
- 동의항목 선택
- 필요한 동의항목 지정함 (컨트롤러로 전달되는 값이 됨)
7. 앱키에서 javascript 키를 복사함
</pre>

<h1>뷰 페이지 작성</h1>
<pre>
1. 카카오 로그인 버튼 만들기 (이미지 다운받아 사용해도 됨)
2. 자바스크립트용으로 사용할 카카오 로그인용 자바스크립트 소스 추가함.
cdn 방식(제공된 url로 연결) : 
	https://developers.kakao.com/sdk/js/kakao.js
sdk 다운받기 (자바스크립트 소스 js 파일 다운받기) :
	https://developers.kakao.com/docs/latest/ko/sdk-download/js
	- webapp/resources/js 폴더 아래에 복사해 넣기함
	- script 태그 src="경로/resources/js/kakao.min.js"
</pre>
<br>
<hr>
<a href="https://developers.kakao.com/docs/latest/ko/kakaologin/common" target="_blank">카카오 로그인 설명 페이지로 이동</a>

<h1 align="center">first 로그인</h1>
<div id="loginForm">
<form action="login.do" method="post">
	<label>아이디 : <input type="text" name="userid" class="pos"></label> <br>
	<label>암 호 : <input type="password" name="userpwd" class="pos"></label><br>	
	<input type="submit" value="로그인">
</form>
</div>
<hr>
<center>
	<h3>카카오 로그인 버튼 이미지 클릭시에 전송온 토큰과 정보 확인</h3>
	<img src="${ pageContext.servletContext.contextPath }/resources/images/kakao_login.png" onclick="kakaoLogin();"><br>
	<button onclick="kakaoLogout();">카카오 로그아웃</button>
</center>

<script type="text/javascript">
function kakaoLogin(){
	
}
function kakaoLogout(){
	
}
</script>
</body>
</html>