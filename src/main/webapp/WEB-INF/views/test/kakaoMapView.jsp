<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>kakaoMapView</title>
<style type="text/css">
p { font-size: 12pt; }
</style>
<script type="text/javascript" src="${ pageContext.servletContext.contextPath }/resources/js/jquery-3.6.1.min.js"></script>

</head>
<body>
<h1>카카오 지도 서비스 api 테스트</h1>
<p>
카카오 지도 api 도 사용하려면, 카카오 로그인 api 사용과 동일한 순서로 
카카오 개발자 사이트에 로그인하여, 등록된 앱에 대한 자바스크립트 키를 
복사해서 사용함.<br>
script 태그 src 에 
src="//dapi.kakao.com/v2/maps/sdk.js?appkey=발급받은 APP KEY
를 넣으시면 됩니다."<br>
<br>
Kakao 지도 Javascript API 는 지도와 함께 사용할 수 있는 
라이브러리 를 지원하고 있음.<br>
라이브러리는 추가로 불러와서 사용할 수 있도록 되어있음.<br>
* clusterer: 마커를 클러스터링 할 수 있는 클러스터러 라이브러리임.<br>
* services: 장소 검색과 주소-좌표 변환을 할 수 있는 
services 라이브러리임.<br>
* drawing: 지도 위에 마커와 그래픽스 객체를 
쉽게 그릴 수 있게 그리기 모드를 지원하는 drawing 라이브러리임.<br>
<br>
script 태그에 
src="//dapi.kakao.com/v2/maps/sdk.js?appkey=APIKEY&libraries=LIBRARY이름" <br>
로 작성하여 사용함 <br>
</p>
<a href="https://apis.map.kakao.com/web/guide/" target="_blank">카카오 지도 api 가이드</a>
<br>
<a href="https://apis.map.kakao.com/web/sample/" target="_blank">카카오 지도 샘플 페이지</a>
<br>
<br>
<h4><a href="${ pageContext.servletContext.contextPath }/map1.do">1. div 에 지도 표시하기</a></h4>
<h4><a href="${ pageContext.servletContext.contextPath }/map2.do">2. 내 위치 지도에 표시하기</a></h4>
<h4><a href="${ pageContext.servletContext.contextPath }/map3.do">3. 지도에 위치 마커 표시하기</a></h4>
<h4><a href="${ pageContext.servletContext.contextPath }/map4.do">4. 지도 마커에 정보창 표시하기</a></h4>
<h4><a href="${ pageContext.servletContext.contextPath }/map5.do">5. 지도에 마커 여러 개 표시하기</a></h4>
</body>
</html>