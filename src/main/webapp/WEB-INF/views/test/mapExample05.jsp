<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>first</title>
</head>
<body>
<h1>지도에 여러 개의 마커 표시하기</h1>
	위도 : <span id="lat"></span>, 
	경도 : <span id="lng"></span> <br>
	
	<script type="text/javascript">
		var lat = 0;
		var lng = 0;
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
		var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
		mapOption = {
			center : new kakao.maps.LatLng(lat, lng), // 지도의 중심좌표
			level : 4
		// 지도의 확대 레벨
		};

		// 지도를 표시할 div와  지도 옵션으로  지도를 생성합니다
		var map = new kakao.maps.Map(mapContainer, mapOption);

		//마커가 표시될 위치가 여러개인 경우
		var positions = [ 
		{
			title : '카카오',
			latlng : new kakao.maps.LatLng(lat, lng)
		}, {
			title : '생태연못',
			latlng : new kakao.maps.LatLng(lat+0.0001, lng+0.0003)
		}, {
			title : '텃밭',
			latlng : new kakao.maps.LatLng(lat+0.0003, lng+0.0003)
		}, {
			title : '근린공원',
			latlng : new kakao.maps.LatLng(lat+0.0009, lng+0.0003)
		} ];
		// 마커 이미지의 이미지 주소입니다 (예 : "/first/resources/images/marker.png")
		var imageSrc = "https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/markerStar.png"; 
		for (var i = 0; i < positions.length; i ++) {
		    // 마커 이미지의 이미지 크기 입니다
		    var imageSize = new kakao.maps.Size(24, 35); 
		    
		    // 마커 이미지를 생성합니다    
		    var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize); 
		    
		    // 마커를 생성합니다
		    var marker = new kakao.maps.Marker({
		        map: map, // 마커를 표시할 지도
		        position: positions[i].latlng, // 마커를 표시할 위치
		        title : positions[i].title, // 마커의 타이틀, 마커에 마우스를 올리면 타이틀이 표시됩니다
		        image : markerImage // 마커 이미지 
		    });
		}
	</script>
</body>
</html>













