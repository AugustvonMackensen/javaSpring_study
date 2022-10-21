<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>first</title>
</head>
<body>
	<h1>내 위치 지도에 표시하기</h1>
	위도 : <span id="lat"></span>, 
	경도 : <span id="lng"></span>
	<br>
	
	<script type="text/javascript">
		var lat = 0;
		var lng = 0;
		
		//실행시 권한 요청을 수락하여야 함.
		navigator.geolocation.getCurrentPosition(
				function(position) {
			lat = position.coords.latitude;
			lng = position.coords.longitude;
			
			document.getElementById("lat").innerHTML = lat;
			document.getElementById("lng").innerHTML = lng;
		});
		
	</script>
	
	<!-- 지도를 표시할 div 입니다 -->
	<div id="map" style="width:600px;height:400px;"></div>
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=324b64b39cfcbbd4195127e6b989c7fd"></script>
	<script>
		var container = document.getElementById('map'); // 지도를 표시할 div 
		var options = {
			center : new kakao.maps.LatLng(lat, lng), // 지도의 중심좌표
			level : 4 // 지도의 확대 레벨
		};

		// 지도를 표시할 div와  지도 옵션으로  지도를 생성합니다
		var map = new kakao.maps.Map(container, options);
	</script>
</body>
</html>