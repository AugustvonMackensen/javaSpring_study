<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>postSearchView</title>
<script type="text/javascript" src="${ pageContext.servletContext.contextPath }/resources/js/jquery-3.6.1.min.js"></script>
<script src="//d1p7wdleee1q2z.cloudfront.net/post/search.min.js"></script>
<script>
/*  검색 단추를 누르면 팝업 레이어가 열리도록 설정한다. */
$(function(){
   $("#postcodify_search_button").postcodifyPopUp();
});
</script>
</head>
<body>
<h1>우편번호 검색 api 테스트</h1>
<p>행안부 api는 인증 key를 신청해서 발급받아서, url에 키값을 추가해서 사용함<br>
daum api는 키 발급없이 url만으로 api를 사용할 수 있음</p>
<ol>
	<li>도로명주소 검색 api</li>
	<p>신청시 회사 웹 주소 필요함, https://www.poesis.org/postcodify/</p>
	
	<li>우체국 오픈 api</li>
	<p>https://biz.epost.go.kr/ui/index.jsp 링크로 가서 우측 상단의 OPEN API를 클릭하면 신청 페이지로 이동함<br>
	GET 방식을 사용하고 리턴정보를 XML로 보내줌<br>
	API 신청은 이름, 회사이름, 메일주소, 전화번호만 적으면 됨<br>
	신청하고 나서 바로 '오픈 API 신청 결과'를 클릭하고 조회하면
	바로 확인이 됨<br>
	1일 2만건 정도 검색이 되면 제한이 됨<br>
	연락하면 풀어주는 방법도 있지만, 전문적으로 주소 서비스를 한다면
	문의를 해 보는 것이 좋음</p>
	
	<li>daum 우편번호 서비스</li>
	<p>api 키 발급 필요없음. 화면에 검색결과 리스트까지 뿌려줌<br>
	리스트에서 클릭된 데이터만 oncomplete 함수에서 받아서 사용만 하면 됨<br>
	참고 url : https://postcode.map.daum.net/guide</p>
</ol>
<hr>
<table align="center" width="500" cellspacing="5">
	<tr>
		<td width="150">우편번호</td>
		<td>
			<input type="text" name="post" class="postcodify_postcode5" size="6">
			<button type="button" id="postcodify_search_button">검색</button>
		</td>
	</tr>
	<tr>
		<td>도로명 주소</td>
		<td><input type="text" name="address1" class="postcodify_address" size="50"></td>
	</tr>
	<tr>
		<td>상세 주소</td>
		<td><input type="text" name="address2" class="postcodify_extra_info" size="50"></td>
	</tr>
</table>
</body>
</html>