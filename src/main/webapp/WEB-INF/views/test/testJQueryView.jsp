<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>testJQueryView</title>
<script type="text/javascript" src="${ pageContext.servletContext.contextPath }/resources/js/jquery-3.6.1.min.js"></script>
</head>
<body>
<h1>jQuery로 ajax 테스트</h1>
<hr>
<h2>1. 서버로 전송값 없고, 결과로 문자열 받아 출력 : get 방식</h2>
<p id="p1" style="width:300px; height:50px; border:1px solid red;"></p>
<button id="test1">테스트</button>

<script type="text/javascript">
$(function(){
	//jQuery('selector').method([arg]);
	$('#test1').click(function(){
		//컨트롤러로 서비스를 요청하고,
		//결과로 문자열을 받는 경우에는
		//jQuery.get("요청url", {전송이름: 전송값}, 
		//		function(data){요청 성공시 리턴값 받아 처리});
		
		//get()요청
		$.get("test1.do", function(data){
			$('#p1').text(data);
		});
		
		//ajax() 요청
		$.ajax({
			url: "test1.do",
			type: "get",
			success: function(data){
				$('#p1').text($('#p1').text() + ", " + data);
			}
		});
	}); //click
}); //document ready
</script>
<hr>

<h2>2. 서버로 전송값 있고, 결과로 문자열 받아 출력</h2>
이름 : <input type="text" id="name"><br>
나이 : <input type="number" id="age"><br>
<p id="p2" style="width:300px; height:50px; border:1px solid red;"></p>
<button id="test2">테스트</button>

<script type="text/javascript">
$(function(){
	//서비스 요청시 post 전송일때는
	//jQuery.post() 또는 jQuery.ajax() 사용할 수 있음
	//메소드 안 인자의 사용형식은 같음
	
	$('#test2').on('click', function(){
		//$.post({
		$.ajax({
			url: "test2.do",
			data: { name: $('#name').val(), age: $('#age').val() },
			type: "post",
			success: function(result){
				if(result == "ok"){
					$('#p2').html("<h5>" + result + "</h5>");
				} else{
						alert("서버측 실패 답변 : " + result);
				}
			},
			error: function(request, status, errorData){
				console.log("error code : " + request.status + 
						"\nMessage : " + request.responseText + 
						"\nError : " + errorData);
			}
		}); //ajax
	}); //on click
	
}); //document.ready
</script>
<hr>

<h2>3. 서버로 전송값 없고, 결과로 json 받아 출력 : get 방식</h2>
<p id="p3" style="width:300px; height:150px; border:1px solid red;"></p>
<button id="test3">테스트</button>

<script type="text/javascript">
$(function(){
	$('#test3').on('click', function(){
		$.ajax({
			url: "test3.do",
			type: "post", //json을 받을 때는 post 지정해야 함
			dataType: "json", //전송받는 값의 종류 지정(기본 : "text")
			success: function(jsonData){
				//json 객체 한 개를 받을 때는 바로 출력 처리할 수 있음
				console.log("jsonData : " + jsonData);
				
				//응답 온 값에 인코딩된 글자가 없으면 자바스크립트가 제공하는 decodeURIComponent(응답값)
				//사용해서 반드시 디코딩 처리해야 함
				//참고 : 디코딩 시 '+'가 공백으로 변환 안 될 수 있음
				// => replace('원래문자', '바꿀문자')
				$('#p3').html("<b>최신 공지글</b><br>"
						+ "번호 : " + jsonData.noticeno
						+ "<br>제목 : " + decodeURIComponent(jsonData.noticetitle).replace(/\+/gi, " ")
						+ "<br>작성자 : " + jsonData.noticewriter
						+ "<br>날짜 : " + jsonData.noticedate
						+ "<br>내용 : " + decodeURIComponent(jsonData.noticecontent).replace(/\+/gi, " "));
			},
			error: function(request, status, errorData){
				console.log("error code : " + request.status + 
						"\nMessage : " + request.responseText + 
						"\nError : " + errorData);
			}
		}); //ajax
	}); //document.ready
});
</script>
<hr>

<h2>4. 서버로 전송값 없고, 결과로 문자열 받아 출력 : get 방식</h2>
<p id="p4" style="width:300px; height:50px; border:1px solid red;"></p>
<button id="test4">테스트</button>

<script type="text/javascript">
</script>
<hr>

<h2>5. 서버로 전송값 없고, 결과로 문자열 받아 출력 : get 방식</h2>
<p id="p5" style="width:300px; height:50px; border:1px solid red;"></p>
<button id="test5">테스트</button>

<script type="text/javascript">
</script>
<hr>

<h2>6. 서버로 전송값 없고, 결과로 문자열 받아 출력 : get 방식</h2>
<p id="p6" style="width:300px; height:50px; border:1px solid red;"></p>
<button id="test6">테스트</button>

<script type="text/javascript">
</script>
<hr>

<h2>7. 서버로 전송값 없고, 결과로 문자열 받아 출력 : get 방식</h2>
<p id="p7" style="width:300px; height:50px; border:1px solid red;"></p>
<button id="test7">테스트</button>

<script type="text/javascript">
</script>
<hr>

</body>
</html>