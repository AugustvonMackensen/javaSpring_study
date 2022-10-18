<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>testAjaxFileView</title>
<script type="text/javascript" src="${ pageContext.servletContext.contextPath }/resources/js/jquery-3.6.1.min.js"></script>
<script type="text/javascript">
function uploadFile(){
	var form = $('#fileForm')[0];
	//form 태그 안의 모든 입력정보를 담을 FormData 객체 생성
	var formData = new FormData(form);
	
	$.ajax({
		url: "testFileUp.do",
		processData: false,	//multipart 전송은 false로 지정
		contentType: false,
		data: formData,
		type: "post",
		success: function(data, jqXHR, textStatus){
			alert("파일업로드 성공 : " + data);
		},
		error: function(jqXHR, textStatus, errorThrown){
			console.log(jqXHR + ", " + textStatus + ", " + errorThrown);
		}
	});
}
function uploadFile2(){
	//자바스크립트 ajax 로 파일업로드 처리
	var form = document.getElementById('fileForm2');
	var formData = new FormData(form);
	
	var xhrequest;	//브라우저별로 ajax를 위한 객체 생성
	if(window.XMLHttpRequest){
		xhrequest = new XMLHttpRequest(); //firefox, opera, safari, chrome, IE7 이상
	} else{	//IE5, IE6
		xhrequest = new ActiveXObject("Microsoft.XMLHTTP");
	}
	
	//ajax 요청
	//1. 요청 처리에 대한 상태코드가 변경되면, 작동할 내용을 미리 지정함.
	xhrequest.onreadystatechange = function(){
		if(xhrequest.readyState == 4 && xhrequest.status == 200){
			alert(xhrequest.responseText);
		} //요청이 성공하면 alert 창에 응답온 문자를 출력해라. 로 지정
	};
	
	//2. url 요청하고, 전송값 보내기함
	xhrequest.open("POST", "testFileUp.do", true);
	xhrequest.send(formData);
}
</script>
</head>
<body>
<h1>Ajax로 파일 업로드 / 다운로드 처리(form 전송)</h1>
<hr>
<h2>jQuery 기반 Ajax 파일업로드</h2>
<form id="fileForm">
	메세지 : <input type="text" name="message"> <br>
	첨부파일 : <input type="file" name="upfile" multiple> <br>
	<input type="button" value="업로드" onclick="uploadFile();">
</form>

<!-- ********************************************** -->
<hr>
<h2>javascript 기반 Ajax 파일업로드</h2>
<form id="fileForm2">
	메세지 : <input type="text" name="message"> <br>
	첨부파일 : <input type="file" name="upfile"> <br>
	<input type="button" value="업로드" onclick="uploadFile2();">
</form>
<!-- ********************************************** -->
<hr style="">
<h2>jQuery 기반 Ajax 파일다운로드</h2>

<hr>
<h2>javascript 기반 Ajax 파일다운로드</h2>
</body>
</html>