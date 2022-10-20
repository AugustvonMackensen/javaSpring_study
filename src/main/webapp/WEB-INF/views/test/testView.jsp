<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
</head>
<body>
<!-- a 태그(get 전송임)로 서버측에 request 요청을 하는 방법은 2가지 있음 
	방법 1 : href="${ pageContext.servletContext.contextPath }/요청url"
	방법 2 : href="javascript:location.href='${ pageContext.servletContext.contextPath }/요청url';"
	추가적으로 요청 url과 함깨 서버측으로 전송할 값(parameter)이 있다면
	쿼리스트링을 추가하면 됨 : ?전송이름=전송할값&전송이름=전송할값......
	"요청url?전송이름=전송할값&전송이름=전송할값"

-->

<h2><a href="${ pageContext.servletContext.contextPath }/testJSON.do">테스트 JSON</a></h2>
<h2><a href="${ pageContext.servletContext.contextPath }/testJS.do">javascript ajax</a></h2>
<h2><a href="${ pageContext.servletContext.contextPath }/testJQuery.do">jquery ajax</a></h2>
<h2><a href="${ pageContext.servletContext.contextPath }/testAjaxFile.do">ajax fileup/download</a></h2>

<h2><a href="${ pageContext.servletContext.contextPath }/movePOST.do">주소, 우편번호 검색 api</a></h2>
<h2><a href="${ pageContext.servletContext.contextPath }/moveKakao.do">카카오 로그인 api</a></h2>
<h2><a href="${ pageContext.servletContext.contextPath }/moveMap.do">카카오 Map api</a></h2>

</body>
</html>