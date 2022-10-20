<%@ page language="java" contentType="text/html; charset=UTF-8" 
		pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:set var="currentPage" value="${ requestScope.page }"/>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
</head>
<body>
<!-- 절대경로로 대상 파일의 위치를 지정한 경우 -->
<c:import url="/WEB-INF/views/common/menubar.jsp"/>
<hr>
<h2 align="center">${ board.board_num }번 게시글 수정 페이지</h2>
<br>
<!-- 원글 수정 폼 -->
<c:if test="${ board.board_lev eq 1 }" >
<!-- form 태그에서 입력된 값들(문자열)과 첨부파일을 같이 전송하려면,
	반드시 enctype 속성을 form 태그에 추가해야 됨
	enctype = "multipart/form-data" 값을 지정해야 함
	method ="post" 로 지정해야 함
 -->
<form action="boriginup.do" method="post" enctype="multipart/form-data">
	<input type="hidden" name="board_num" value='${ board.board_num }'>
	<input type="hidden" name="page" value='${ currentPage }'>
	<c:if test="${ !empty board.board_original_filename }">
	<!-- 첨부파일이 있는 게시글이라면 -->
		<input type="hidden" name="board_original_filename" value="${ board.board_original_filename }">
		<input type="hidden" name="board_rename_filename" value="${ board.board_rename_filename }">
	</c:if>
	<table align="center" width="500" border="1" cellspacing="0" cellpadding="5">
		<tr><th>제 목</th><td><input type="text" name="board_title" value="${ board.board_title }"></td></tr>
		<tr><th>작성자</th><td><input type="text" name="board_writer" readonly value="${ board.board_writer }"></td></tr>
		<tr><th>첨부파일</th>
			<td>
				<!-- 원래 첨부파일이 있는 경우 -->
				<c:if test="${ !empty board.board_original_filename }">
					${ board.board_original_filename } &nbsp;
					<input type="checkbox" name="delFlag" value="yes"> 파일삭제 <br>
				</c:if>
				<br>
				새로 첨부 : <input type="file" name="upfile">
			</td>
		</tr>
		<tr><th>내 용</th><td><textarea rows="5" cols="50" name="board_content">${ board.board_content }</textarea></td></tr>
		<tr><th colspan="2">
			<input type="submit" value="수정하기"> &nbsp;
	      	<input type="reset" value="수정취소"> &nbsp;
			<button onclick="javascript:history.go(-1); return false;">이전페이지로 이동</button>
		</th></tr>
	</table>
</form>
</c:if>
<!-- 댓글/대댓글 수정 폼 -->
<c:if test="${ board.board_lev ne 1 }">
<form action="breplyup.do" method="post" >
	<input type="hidden" name="board_num" value="${ board.board_num }">
	<input type="hidden" name="page" value="${ currentPage }">
	<table align="center" width="500" border="1" cellspacing="0" cellpadding="5">
		<tr><th>제 목</th><td><input type="text" name="board_title" value="${ board.board_title }"></td></tr>
		<tr><th>작성자</th><td><input type="text" name="board_writer" readonly value="${ board.board_writer }"></td></tr>
		<tr><th>내 용</th><td><textarea rows="5" cols="50" name="board_content">${ board.board_content }</textarea></td></tr>
		<tr><th colspan="2">
			<input type="submit" value="댓글 수정"> &nbsp;
	      	<input type="reset" value="작성취소"> &nbsp;
			<input type="button" onclick="javascript:history.go(-1); return false;" value="이전페이지로 이동">
		</th></tr>
	</table>
</form>
</c:if>
<br>
<hr>
<c:import url="/WEB-INF/views/common/footer.jsp" />
</body>
</html>