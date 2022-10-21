<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>first</title>
</head>
<body>
<h1>지도 마커에 정보창 표시하기</h1>
	위도 :
	<span id="lat"></span>, 경도 :
	<span id="lng"></span>
	<script type="text/javascript">
		var lat = 0;
		var lng = 0;
		navigator.geolocation.getCurrentPosition(function(position) {
			lat = position.coords.latitude;
			lng = position.coords.longitude;
		});
		document.getElementById("lat").innerHTML = lat;
		document.getElementById("lng").innerHTML = lng;
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
		
		// 인포윈도우에 표출될 내용으로 HTML 문자열이나 document element가 가능합니다
		var iwContent = '<div style="padding:5px;">Hello World!</div>',
		
		//인포윈도우 표시 위치입니다
	    iwPosition = new kakao.maps.LatLng(lat, lng),
	  
	    // removeable 속성을 ture 로 설정하면 인포윈도우를 닫을 수 있는 x버튼이 표시됩니다
	    iwRemoveable = true; 

	
		// 인포윈도우를 생성하고 지도에 표시합니다
		 /*
		var infowindow = new kakao.maps.InfoWindow({
	   	 	map: map, // 인포윈도우가 표시될 지도
	    	position : iwPosition, 
	    	content : iwContent,
	    	removable : iwRemoveable
	    });
		*/
		var infowindow = new kakao.maps.InfoWindow({
	    	position : iwPosition, 
	    	content : iwContent,
	    	removable : iwRemoveable
	    });
		// infowindow.open(map);
		 infowindow.open(map,marker);
		
		
		
	</script>
</body>
</html>