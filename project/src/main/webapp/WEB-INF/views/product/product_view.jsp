<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!doctype html>
<html lang="ko">

<head>
	<!-- Required meta tags -->
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	<meta name="description" content="megakit,business,company,agency,multipurpose,modern,bootstrap4">

	<meta name="author" content="themefisher.com">

	<title>product_view</title>

	<!-- bootstrap.min css -->
	<link rel="stylesheet" href="/plugins/bootstrap/css/bootstrap.min.css">
	<!-- Icon Font Css -->
	<link rel="stylesheet" href="/plugins/themify/css/themify-icons.css">
	<link rel="stylesheet" href="/plugins/fontawesome/css/all.css">
	<link rel="stylesheet" href="/plugins/magnific-popup/dist/magnific-popup.css">
	<!-- Owl Carousel CSS -->
	<link rel="stylesheet" href="/plugins/slick-carousel/slick/slick.css">
	<link rel="stylesheet" href="/plugins/slick-carousel/slick/slick-theme.css">

	<!-- Main Stylesheet -->
	<link rel="stylesheet" href="/css/style.css">
	
	<style type="text/css">
		.container1{
			width: 60%;
			margin: 0 auto;
		}
	</style>
	
	<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
	<script type="text/javascript">
	function cartGo(target){
		var parentNode = target.parentNode;
		var productId = parentNode.children[0].value;
		var productId_Val = $(parentNode).find("input[name=productid]")[0].value;
		var amounts = parentNode.children[3].value;
		console.log(target);
		$.ajax({
			contentType:"application/x-www-form-urlencoded; charset=UTF-8",//콘텐츠타입
			type:'post',//데이터타입
			url:'/cart/cartInsert',//전송경로
			data:{
				"amount":amounts,//수량
				"product_id": productId_Val,//상품ID
				"status":"N"},//주문상태
			success:function(result){
				if(result == 1){
					if (confirm("장바구니에 담았습니다. 카트를 확인하시겠습니까?")) {
				        // 확인(예) 버튼 클릭 시 이벤트
				        location.href="/cart/memberCartList";
				    } else {
				        // 취소(아니오) 버튼 클릭 시 이벤트
				    }//else
				}
			},//success
			error:function(){
				alert("에러");
			}
		});//ajax
	};//function cartGo
	</script>
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
							<!-- <span class="text-white">News details</span> -->
							<h1 class="text-capitalize mb-4 text-lg">상품</h1>
							<ul class="list-inline">
								<li class="list-inline-item"><a href="index" class="text-white">Home</a></li>
								<li class="list-inline-item"><span class="text-white">/</span></li>
								<li class="list-inline-item"><a href="product_list" class="text-white">Product</a></li>
							</ul>
						</div>
					</div>
				</div>
			</div>
		</section>

		

		<section class="section blog-wrap bg-gray">
			<div class="container1">
						<div class="row">
							<div class="col-lg-12 mb-5">
				<!-- parent --><div class="single-blog-item">
						<!-- 0 --><input type="hidden" name="productid" value="${list[0].pVo.id}">
							<!-- 1 --><img src="/productPicture/${list[0].pVo.picture}" alt="" class="img-fluid rounded" style="width: 100%;">
							<!-- 2 --><div class="blog-item-content bg-white p-5">
										<div class="blog-item-meta bg-gray py-1 px-2" style="text-align: justify;">
												<span class="text-muted text-capitalize mr-3" style="font-family: 'Poppins', sans-serif;"><i
														class="ti-pencil-alt mr-2"></i>${list[0].sVo.store_name }</span>
												<span class="text-muted text-capitalize mr-3" style="font-family: 'Poppins', sans-serif;"><i
														class="ti-comment mr-2"></i>리뷰수</span>
												<span class="text-muted text-capitalize mr-3" style="font-family: 'Poppins', sans-serif;"><i
														class="ti-time mr-1"></i>${list[0].pVo.cook_time }분</span>
												<span class="text-muted text-capitalize mr-3" style="font-family: 'Poppins', sans-serif;">${list[0].pVo.serving}인분</span>
												<!-- <span class="text-black text-capitalize mr-3" style="font-family: 'Poppins', sans-serif;"><i class="ti-time mr-1"></i> 28th January</span> -->
										</div>

										<h2 class="mt-3 mb-4"><a href="blog-single.html">${list[0].pVo.name }</a></h2>
										<!-- 상품설명은 필요한것만 사용 삭제하세용 -->
							<!--  --><div class="blog-item-meta bg-gray py-1 px-2">
											가격 : ${list[0].pVo.price}
										</div>
									<h3 class="quote">${list[0].pVo.content }</h3>
									</div>
						<!-- 3 --><select name="amount">
									<c:forEach begin="1" end="10" var="i">
										<option value="${i}">${i}</option>
									</c:forEach>
								</select>&nbsp;개
								<!--  담기버튼-->
								<input type="button" id="Cart_btn" onclick="cartGo(this)"  value="장바구니에 담기">
				<!-- parent --></div>
							</div>


							<div id="kakomap" class="col-lg-12 mb-5" style="width:730px; height: 365px;">
							</div>
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
									//<c:forEach items="${list}" var="item">
										geocoder.addressSearch('${list[0].sVo.store_addr}', function(result, status) {
							                // 정상적으로 검색이 완료됐으면 
							                 if (status === kakao.maps.services.Status.OK) {
			
							                    var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
			
							                    // 결과값으로 받은 위치를 마커로 표시합니다
							                    var marker = new kakao.maps.Marker({
							                        map: map,
							                        position: coords,
							                        clickable: true
							                    });
							                    
							                    var iwContent = '<div id="mapDiv" style="padding:5px;"><a href="/product/product_view?id=${list[0].pVo.id}">${list[0].sVo.store_name}</a></div>', // 인포윈도우에 표출될 내용으로 HTML 문자열이나 document element가 가능합니다
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
							                    map.setCenter(coords);
							                } 
							            });
							   	 	//</c:forEach>
									navigator.geolocation.getCurrentPosition(locationLoadSuccess,locationLoadError);
								});
								
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

							<div class="col-lg-12 mb-5">
								<div class="comment-area card border-0 p-5">
									<h4 class="mb-4">리뷰수 4</h4>
									<ul class="comment-tree list-unstyled">
										<li class="mb-5">
											<div class="comment-area-box">

												<h6 class="mb-1">닉네임1</h6>

												<div class="comment-meta mt-4 mt-lg-0 mt-md-0 float-lg-right float-md-right">
													<i class="ti-time mr-1"></i>
													<span class="date-comm">댓글 올린 시간</span>
												</div>


												<div class="comment-content mt-3">
													<br>
													<p>댓글 내용 1</p>
												</div>
											</div>
										</li>

										<li>
											<div class="comment-area-box">
												<h6 class="mb-1">닉네임2</h6>
												<div class="comment-meta mt-4 mt-lg-0 mt-md-0 float-lg-right float-md-right">
													<i class="ti-time mr-1"></i>
													<span class="date-comm">댓글 올린 시간</span>
												</div>

												<div class="comment-content mt-3">
													<br>
													<p>댓글 내용 2</p>
												</div>
											</div>
										</li>
									</ul>
								</div>
							</div>

							<div class="col-lg-12">
								<form class="contact-form bg-white rounded p-5" id="comment-form">
									<h4 class="mb-4">리뷰 등록</h4>
									<div class="row">
										<!-- <div class="col-md-6">
											<div class="form-group">
												<input class="form-control" type="text" name="name" id="name" placeholder="Name:">
											</div>
										</div>
										<div class="col-md-6">
											<div class="form-group">
												<input class="form-control" type="text" name="mail" id="mail" placeholder="Email:">
											</div>
										</div> -->
									</div>


									<textarea style="font-family: 'Poppins', sans-serif;" class="form-control mb-3" name="comment"
										id="comment" cols="30" rows="5" placeholder="리뷰를 입력하세요"></textarea>

									<input class="btn btn-main btn-round-full" type="submit" name="submit-contact" id="submit_contact"
										value="리뷰 등록">
								</form>
							</div>
						</div>
			</div>
		</section>


		<!-- footer Start -->
		<jsp:include page="../layout/footer.jsp"></jsp:include>

	</div>

	<!-- Essential Scripts=====================================-->


	<!-- Main jQuery -->
	<script src="/plugins/jquery/jquery.js"></script>
	<script src="/js/contact.js"></script>
	<!-- Bootstrap 4.3.1 -->
	<script src="/plugins/bootstrap/js/popper.js"></script>
	<script src="/plugins/bootstrap/js/bootstrap.min.js"></script>
	<!--  Magnific Popup-->
	<script src="/plugins/magnific-popup/dist/jquery.magnific-popup.min.js"></script>
	<!-- Slick Slider -->
	<script src="/plugins/slick-carousel/slick/slick.min.js"></script>
	<!-- Counterup -->
	<script src="/plugins/counterup/jquery.waypoints.min.js"></script>
	<script src="/plugins/counterup/jquery.counterup.min.js"></script>

	<script src="/js/script.js"></script>
	<script src="https://code.jquery.com/jquery-3.5.1.js"></script>

</body>

</html>