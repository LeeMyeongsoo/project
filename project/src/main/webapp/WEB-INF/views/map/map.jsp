<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!doctype html>
<html lang="en">
  <head>
  <!-- Required meta tags -->
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="megakit,business,company,agency,multipurpose,modern,bootstrap4">
  
  <meta name="author" content="themefisher.com">

  <title>Megakit| Html5 Agency template</title>

  <!-- bootstrap.min css -->
  <link rel="stylesheet" href="plugins/bootstrap/css/bootstrap.min.css">
  <!-- Icon Font Css -->
  <link rel="stylesheet" href="plugins/themify/css/themify-icons.css">
  <link rel="stylesheet" href="plugins/fontawesome/css/all.css">
  <link rel="stylesheet" href="plugins/magnific-popup/dist/magnific-popup.css">
  <!-- Owl Carousel CSS -->
  <link rel="stylesheet" href="plugins/slick-carousel/slick/slick.css">
  <link rel="stylesheet" href="plugins/slick-carousel/slick/slick-theme.css">

  <!-- Main Stylesheet -->
  <link rel="stylesheet" href="css/style.css">
  <script  src="http://code.jquery.com/jquery-latest.min.js"></script>
  <style type="text/css">
  	table,th,td{border: 1px solid #F75757; border-collapse: collapse;}
  	div.mapDiv{}
  </style>
  
  <script  src="http://code.jquery.com/jquery-latest.min.js"></script>
</head>

<body>

<!-- Header Start --> 
<jsp:include page="../layout/header.jsp"></jsp:include>
<!-- Header Close --> 

<div class="main-wrapper ">
<section class="page-title bg-1">
  <div class="container">
    <div class="row">
      <div class="col-md-12">
        <div class="block text-center">
          <span class="text-white">About Us</span>
          <h1 class="text-capitalize mb-4 text-lg">매장 지도</h1>
          <ul class="list-inline">
            <li class="list-inline-item"><a href="index.html" class="text-white">Home</a></li>
            <li class="list-inline-item"><span class="text-white">/</span></li>
            <li class="list-inline-item"><a href="#" class="text-white-50">Map</a></li>
          </ul>
        </div>
      </div>
    </div>
  </div>
</section>


<!-- Section About Start -->
<section class="section about-2 position-relative">
	<div class="container">
			<div class="">
				<div class="about-item pr-3 mb-5 mb-lg-0">
					<button type="button" onclick="getCurrentPosBtn()" class="btn btn-main btn-round-full" style="">현재위치 불러오기</button>
					<br><br>
					<div id="kakomap" style="width:100%;height:100vh;"></div>
				</div>
			</div>
				<!-- 지도 api start -->
				<!-- 지도를 표시할 div 입니다 -->
				
				<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=8b1491207034a830c5367e6e4be01729&libraries=services"></script>
				<script>
					var mapContainer = document.getElementById('kakomap'), // 지도를 표시할 div 
					    mapOption = { 
					        center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
					        level: 3 // 지도의 확대 레벨
					    };
					
					// 지도를 표시할 div와  지도 옵션으로  지도를 생성합니다
					var map = new kakao.maps.Map(mapContainer, mapOption);
					var geocoder = new kakao.maps.services.Geocoder();
					
					$(function(){
						<c:forEach items="${list}" var="item">
							geocoder.addressSearch('${item.store_addr}', function(result, status) {
				                // 정상적으로 검색이 완료됐으면 
				                 if (status === kakao.maps.services.Status.OK) {

				                    var coords = new kakao.maps.LatLng(result[0].y, result[0].x);

				                    // 결과값으로 받은 위치를 마커로 표시합니다
				                    var marker = new kakao.maps.Marker({
				                        map: map,
				                        position: coords,
				                        clickable: true
				                    });
				                    
				                    var strContent ='';
				                    
				                    var iwContent = '<div id="mapDiv" style="padding:5px;"><a href="/product/product_list?category=store_name&searchWord=${item.store_name}">${item.store_name}</a></div>', // 인포윈도우에 표출될 내용으로 HTML 문자열이나 document element가 가능합니다
				                    iwRemoveable = true; // removeable 속성을 ture 로 설정하면 인포윈도우를 닫을 수 있는 x버튼이 표시됩니다

				                    // 인포윈도우로 장소에 대한 설명을 표시합니다
				                    var infowindow = new kakao.maps.InfoWindow({
				                        content: iwContent,
				                        removable : iwRemoveable
				                    });
				                    
				                    // 마커에 클릭이벤트를 등록합니다
				                    kakao.maps.event.addListener(marker, 'click', function() {
				                        // 마커 위에 인포윈도우를 표시합니다
				                        infowindow.open(map, marker);
				                 	});

				                    // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
				                    //map.setCenter(coords);
				                } 
				                
				                /* $("#btn").click(funtion(){
				                	$.ajax(){
				                		
				                	}
				                }); */
				                
				                
				            });
				   	 	</c:forEach>
						navigator.geolocation.getCurrentPosition(locationLoadSuccess,locationLoadError);
					});
					
					
		        	
					//경기도 좌표이동
					function setCenter() {            
					    // 이동할 위도 경도 위치를 생성합니다 
					    var moveLatLon = new kakao.maps.LatLng(37.567167, 127.190292);
					    
					    // 지도 중심을 이동 시킵니다
					    map.setCenter(moveLatLon);
					}
					
					//강원도 좌표이동
					function setCenter1() {            
					    // 이동할 위도 경도 위치를 생성합니다 
					    var moveLatLon = new kakao.maps.LatLng(37.555837, 128.209315);
					    
					    // 지도 중심을 이동 시킵니다
					    map.setCenter(moveLatLon);
					}
					
					//현재위치 가져오기
					function locationLoadSuccess(pos){
					    // 현재 위치 받아오기
					    var currentPos = new kakao.maps.LatLng(pos.coords.latitude,pos.coords.longitude);
					
					    // 지도 이동(기존 위치와 가깝다면 부드럽게 이동)
					    map.panTo(currentPos);
					
					    // 마커 생성
					    var marker = new kakao.maps.Marker({
					        position: currentPos
					    });
					
					    // 기존에 마커가 있다면 제거
					    marker.setMap(null);
					    marker.setMap(map);
					};
					
					function locationLoadError(pos){
					    alert('위치 정보를 가져오는데 실패했습니다.');
					};
					
					// 위치 가져오기 버튼 클릭시
					function getCurrentPosBtn(){
						//현재위치 불러오는 메소드
					    navigator.geolocation.getCurrentPosition(locationLoadSuccess,locationLoadError);
					};
					
					
				</script>
				<!-- 지도 api end -->
	</div>
</section>

<!-- Section About End -->
 


<!-- footer Start -->
<jsp:include page="../layout/footer.jsp"></jsp:include>
<!-- footer end -->
   
    </div>

    <!-- 
    Essential Scripts
    =====================================-->

    
    <!-- Main jQuery -->
    <script src="plugins/jquery/jquery.js"></script>
    <script src="js/contact.js"></script>
    <!-- Bootstrap 4.3.1 -->
    <script src="plugins/bootstrap/js/popper.js"></script>
    <script src="plugins/bootstrap/js/bootstrap.min.js"></script>
   <!--  Magnific Popup-->
    <script src="plugins/magnific-popup/dist/jquery.magnific-popup.min.js"></script>
    <!-- Slick Slider -->
    <script src="plugins/slick-carousel/slick/slick.min.js"></script>
    <!-- Counterup -->
    <script src="plugins/counterup/jquery.waypoints.min.js"></script>
    <script src="plugins/counterup/jquery.counterup.min.js"></script>

    <!-- Google Map -->
    <script src="plugins/google-map/map.js"></script>
    <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyAkeLMlsiwzp6b3Gnaxd86lvakimwGA6UA&callback=initMap"></script>    
    
    <script src="js/script.js"></script>

  </body>
  </html>