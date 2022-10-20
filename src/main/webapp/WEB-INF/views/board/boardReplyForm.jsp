<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:set var="board_num" value="${ requestScope.board_num }" />
<c:set var="currentPage" value="${ requestScope.currentPage }" />

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<!-- 절대경로로 대상 파일의 위치를 지정한 경우 -->
<c:import url="/WEB-INF/views/common/menubar.jsp"/>
<hr>
<h2 align="center">${ board_num }번 게시글의 댓글 등록 페이지</h2>
<form action="breply.do" method="post" >
	<!-- 원글 번호를 숨겨서 전송 -->
	<input type="hidden" name="board_ref" value="${ board_num }">
	<input type="hidden" name="page" value="${ currentPage }">
	<table align="center" width="500" border="1" cellspacing="0" cellpadding="5">
		<tr><th>제 목</th><td><input type="text" name="board_title"></td></tr>
		<tr><th>작성자</th><td><input type="text" name="board_writer" readonly value="${ loginMember.userid }"></td></tr>
		<tr><th>내 용</th><td><textarea rows="5" cols="50" name="board_content"></textarea></td></tr>
		<tr><th colspan="2">
			<input type="submit" value="댓글등록하기"> &nbsp;
	      	<input type="reset" value="작성취소"> &nbsp;
			<input type="button" onclick="javascript:history.go(-1)" value="이전페이지로 이동">
		</th></tr>
	</table>
</form>
<hr>
<c:import url="/WEB-INF/views/common/footer.jsp" />
</body>
</html>