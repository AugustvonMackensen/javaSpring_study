<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>first</title>
</head>
<body>
<h1>지도에 내 위치 마커 표시하기</h1>
	위도 :
	<span id="lat"></span>, 경도 :
	<span id="lng"></span>
	<script type="text/javascript">
		var lat = 0;
		var lng = 0;
		navigator.geolocation.getCurrentPosition(function(position) {
			lat = position.coords.latitude;
			lng = position.coords.longitude;
			console.log(lat + ", " + lng);
			
			document.getElementById("lat").innerHTML = lat;
			document.getElementById("lng").innerHTML = lng;
		});
		
	</script>
	<!-- 지도를 표시할 div 입니다 -->
	<div id="map" style="width: 600px; height: 400px;"></div>
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=b7b4462620f1ccc2046ae205abc86529"></script>
	<script>
		var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
		mapOption = {
			center : new kakao.maps.LatLng(lat, lng), // 지도의 중심좌표
			level : 4
		// 지도의 확대 레벨
		};

		// 지도를 표시할 div와  지도 옵션으로  지도를 생성합니다
		var map = new kakao.maps.Map(mapContainer, mapOption);

		//마커가 표시될 위치입니다 
		var markerPosition = new kakao.maps.LatLng(lat, lng);

		// 마커를 생성합니다
		var marker = new kakao.maps.Marker({
			position : markerPosition
		});

		// 마커가 지도 위에 표시되도록 설정합니다
		marker.setMap(map);
		
		// 마커가 드래그 가능하도록 설정합니다 
		marker.setDraggable(true); 
	</script>
</body>
</html>