<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>testJSView</title>
<script type="text/javascript">
//html 태그에 on 이벤트 속성으로 동작 실행함수를 연결할 수도 있지만,
// on이벤트명 = "실행할 함수명();"
// 이벤트 설정을 태그에 직접 작성하지 않고,
//자바스크립트 쪽에서 연결할 수도 있음
// => 페이지가 로딩이 완료되면 작동되게 함(window.onload)
function test(){
	alert("페이지 로딩 완료됨.");
}
/* window.onload = function(){
	
}; */
</script>
</head>
<body onload="test();">

</body>
</html>