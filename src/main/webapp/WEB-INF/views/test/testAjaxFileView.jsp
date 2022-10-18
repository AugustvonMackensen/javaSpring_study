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

function fileDown(){
	//a 태그(파일명) 클릭하면 다운받을 파일명을 서버로 전송함
	var downfile = $('#fdown').text();
	
	$.ajax({
		url: "filedown.do",
		type: "get",
		data: { "fname": downfile },
		xhrFields: {
			responseType: 'blob'
		}, //response 데이터를 바이너리로 처리해야 함
		success: function(data){
			console.log("완료.");
			
			//응답온 파일 데이터를 Blob 객체로 만듦
			var blob = new Blob([data]);
			//클라이언트쪽에 파일 저장 : 다운로드
			if(navigator.msSaveBlob){
				return navigator.msSaveBlob(blob, downfile);
			} else{
				var link = document.createElement('a');
				link.href = window.URL.createObjectURL(blob);
				link.download = downfile;
				link.click();
			}
		},
		error: function(jqXHR, textStatus, errorThrown){
			console.log(jqXHR + ", " + textStatus + ", " + errorThrown);
		}
	});
}
function fileDown2(){
	//javascript ajax로 파일다운로드 처리
	var filedownURL = "filedown.do";
	var downfile = document.getElementById('fdown2').innerHTML;
	
	//if(window.XMLHttpRequest || "XMLHttpRequest" in window){ //해당 객체가 있다면 }
	//해당 객체가 없다면으로 조건 처리할 수도 있을 것임
	if(!(window.ActiveXObject || "ActiveXObject" in window)){
		//chrome, firefox, opera, safari, IE7+
		var link = document.createElement('a');
		link.href = filedownURL + "?fname=" + downfile;
		link.target = '_blank'; //생략해도 됨
		link.download = downfile || filedownURL;
		
		//link.click();과 같은 동작 처리 코드임
		var event = document.createEvent("MouseEvents");
		event.initMouseEvent('click', true, true, window, 1, 0, 0, 0, 0, false, false, false, false, 0, null);
		link.dispatchEvent(event);
		(window.URL || window.webkitURL).revokeObjectURL(link.href);
		
	} else{	//IE5, IE6
		var _window = window.open(fileURL, downfile);
		_window.document.close();
		_window.document.execCommand('SaveAs', true, fileName || fileURL)
		_window.close();
		removeiframe();
	}
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
<hr>
<h2>jQuery 기반 Ajax 파일다운로드</h2>
<a id="fdown" onclick="fileDown();">sample.txt</a>
<hr>
<h2>javascript 기반 Ajax 파일다운로드</h2>
<a id="fdown2" onclick="fileDown2();">sample.txt</a>
</body>
</html>