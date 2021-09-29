<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!doctype html>
<html lang="en">

<head>
	<!-- Required meta tags -->
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	<meta name="description" content="megakit,business,company,agency,multipurpose,modern,bootstrap4">

	<meta name="author" content="themefisher.com">

	<title>product_list</title>

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

	<!-- 규상 -->
<!-- 	<script src="http://code.jquery.com/jquery-latest.min.js"></script>  -->
	<script
		  src="https://code.jquery.com/jquery-3.2.1.min.js"
		  integrity="sha256-hwg4gsxgFZhOsEEamdOYGBf13FyQuiTwlAQgxVSNgt4="
		  crossorigin="anonymous"></script>
		  
	<!--------------------------------  0908 ajax 장바구니 담기------------------------------------------------------->
	<script type="text/javascript">
	//kiwon 0909
	function cartGo(target){//F12로 blog-item-content bg-white p-2 영역을 타겟으로 지정
		var parentNode = target.parentNode;//자식영역으로 지정
		var productId = parentNode.children[3].value;//상품번호는 자식영역의 3번째열에 위치
		var test = $(parentNode).find("input[name=productid]")[0].value;//3번째열의 hidden의 value를 담음
		var amounts = parentNode.children[5].value;//수량은 5번째열 value , select[i]로 담아서 보냄.
		console.log(target);//test용
		
		if(${session_id == null or session_id == "" }){
			alert("로그인 후에 사용 가능합니다.");
			location.href="/login";
			return;
		}
		
		$.ajax({
			contentType:"application/x-www-form-urlencoded; charset=UTF-8",//콘텐츠타입
			type:'post',//데이터타입
			url:'/cart/cartInsert',//전송경로
			data:{//"id" : 1,//id는 시퀀스
				"amount":amounts,//수량
//				"member_id":"${session_id}",//회원ID
				"product_id": test,//상품ID
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
	<!--------------------------------  0908 ajax 장바구니 담기------------------------------------------------------->
	
	<style>
		.inline-block {
			display: inline-block;
		}

		.center {
			text-align: center;
		}

		img {
			vertical-align: middle;
			max-width: 30%;
		}

		.btn-small-search {
			padding: 6px 12px 5px;
			font-size: 13px;
		}

		.flexbox {
			display: flex;
			justify-content: space-between;
		}
	</style>

	<script>
		$(function () {
			// 폼 히든 용도 Start
			$('.s-classification').on('click', function () {
				var classification = $(this).data('value');
				$('input[name="classification"]').prop('value', classification);
				$('.s-classification').removeClass('btn-main');
				$('.s-classification').addClass('btn-solid-border');
				$(this).removeClass('btn-solid-border');
				$(this).addClass('btn-main');
			});
			$('.s-cook_time').on('click', function () {
				var cook_time = $(this).data('value');
				$('input[name=cook_time]').prop('value', cook_time);
				$('.s-cook_time').removeClass('btn-main');
				$('.s-cook_time').addClass('btn-solid-border');
				$(this).removeClass('btn-solid-border');
				$(this).addClass('btn-main');
			});
			// 폼 히든 용도 Close
		});
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
							<!-- <span class="text-white">Our blog</span> -->
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

		<section class="section pb-1 bg-gray">
			<div class="container">

				<!-- 검색 Form Start -->
				<form action="/product/product_list" method="get">
					<div class="center">
						<div class="inline-block mb-5">
							<select>
								<option value="all">전체</option>
								<option value="name">상품명</option>
								<option value="store_name">상호명</option>
							</select>
						</div>
						<div class="inline-block mb-5" style="width: 30%;">

							<!-- 검색 input -->
							<input type="text" class="btn-round-full p-3" style="width: 100%;" name="searchWord" id="" size="20">
						</div>
						<button type="submit">
							<i class="ti-search"></i>
						</button>
					</div>
					<div>
						<!-- 인풋 히든 -->
						<input type="hidden" name="classification" value="">
						<input type="hidden" name="cook_time" value="">
						<!-- 카테고리 -->
						<table>
							<tr>
								<td style="font-family: 'Poppins', sans-serif;">종류별</td>
								<td>
									<span class="btn btn-small-search btn-main btn-round-full s-classification" data-value="">전체</span>
									<span class="btn btn-small-search btn-solid-border btn-round-full s-classification"
										data-value="한식">한식</span>
									<span class="btn btn-small-search btn-solid-border btn-round-full s-classification"
										data-value="일식">일식</span>
									<span class="btn btn-small-search btn-solid-border btn-round-full s-classification"
										data-value="중식">중식</span>
									<span class="btn btn-small-search btn-solid-border btn-round-full s-classification"
										data-value="양식">양식</span>
								</td>
							</tr>
							<tr>
								<td style="font-family: 'Poppins', sans-serif;">조리시간</td>
								<td>
									<span class="btn btn-small-search btn-main btn-round-full s-cook_time" data-value="">전체</span>
									<span class="btn btn-small-search btn-solid-border btn-round-full s-cook_time"
										data-value="10">10분</span>
									<span class="btn btn-small-search btn-solid-border btn-round-full s-cook_time"
										data-value="20">20분</span>
									<span class="btn btn-small-search btn-solid-border btn-round-full s-cook_time"
										data-value="30">30분</span>
									<span class="btn btn-small-search btn-solid-border btn-round-full s-cook_time"
										data-value="40">40분</span>
									<span class="btn btn-small-search btn-solid-border btn-round-full s-cook_time"
										data-value="50">50분</span>
									<span class="btn btn-small-search btn-solid-border btn-round-full s-cook_time"
										data-value="60">60분</span>
								</td>
							</tr>
						</table>
					</div>
				</form>
				<!-- 검색 Form Close -->
			</div>
		</section>

		<section class="section blog-wrap bg-gray">
			<div class="container">
				<div class="row">
				<!-- 상품 시작 -->
				<c:forEach items="${productList.list }" var="productVo">
					<div class="col-lg-3 col-md-3 mb-5" >
						<div class="blog-item">

							<!-- 상품 사진 및 이미지 경로 -->
							<div >
								<a href="/product/product_view?id=${productVo.id}">
									<img loading="lazy" src="/productPicture/${productVo.picture }" alt="blog" class="img-fluid rounded" style="width: 100%; height: 250px;">
								</a>
							</div>

<!---- var parentNode = target.parentNode; ----------0908----------------------------------------------------->							
							<div class="blog-item-content bg-white p-2">
								<!-- 몇인분 및 조리 시간 -->
				<!-- [0].value --><div class="blog-item-meta bg-white pt-1 pb-1 px-1">
									<span class="text-muted text-capitalize d-inline-block"><i class="ti-user mr-1"></i></span><span
										class="text-black small text-capitalize d-inline-block">${productVo.serving}인분</span> |
									<span class="text-muted text-capitalize d-inline-block"><i class="ti-time mr-1"></i></span><span
										class="text-black small text-capitalize d-inline-block">${productVo.cook_time}분</span>
								</div>

								<!-- 상품명 및 가격 -->
				<!-- [1].value --><h3 class="mt-3 mb-3"><a href="product_view?id=${productVo.id}">${productVo.name}</a></h3>
				<!-- [2].value --><p class="mb-1">${productVo.price}</p>
				<!-- [3].value --><input type="hidden" name="productid" value="${productVo.id}">
				<!-- [4].value --><div class="blog-item-meta bg-white pt-1 pb-1 px-1 flexbox">
									<div>
										<span class="text-muted text-capitalize d-inline-block"><i class="ti-star mr-1"></i></span>
										<!-- 별점 -->
										<span class="text-black text-capitalize d-inline-block">${productVo.rate}점</span>
									</div>
									<div>
										<span class="text-muted text-capitalize d-inline-block"><i class="ti-comment mr-1"></i></span>
										<!-- 필히 얘기 필요 -->
										<!-- 댓글 숫자 -->
										<span class="text-black text-capitalize d-inline-block">댓글</span>
									</div>
								</div>
								<c:if test="${productVo.quantity==0}">
									<span>마감된 상품입니다.</span>
								</c:if>
								
								<c:if test="${productVo.quantity>0}">
				<!-- [5].value --><select name="amount">
									<c:forEach begin="1" end="10" var="i">
										<option value="${i}">${i}</option>
									</c:forEach>
								</select>&nbsp;개
								<!--  담기버튼-->
								<input type="button" id="Cart_btn" onclick="cartGo(this)"  value="장바구니에 담기">
								<!--  담기버튼-->
								</c:if>
							</div>
						</div>
					</div>
				</c:forEach>
				<!-- 상품 1개 끝 -->
				</div>
<!-- --------------------------------------------------------------------------kiwon---------------------------------------------- -->
		<%-- <!-- 장바구니에 담기 / TEST용 -->
		<form action="${path}/member/cartInsert" name="form1" method="post">
			<input type="hidden" name="id" value="1">
			<input type="hidden" name="status" value="N">
			<input type="hidden" name="member_id" value="kjss425">
			<input type="hidden" name="product_id" value="4">
			<input type="hidden" name="name" value="상품명">
			<select name="amount">
				<c:forEach begin="1" end="10" var="i">
					<option value="${i}">${i}</option>
				</c:forEach>
			</select>&nbsp;개
			<input type="submit" value="장바구니에 담기">
		</form>
		<a href="${path}/product/product_list">상품목록</a> --%>
<!-- --------------------------------------------------------------------------kiwon---------------------------------------------- -->	
				
				<!-- 하단 넘버링 Start -->
				<div class="row justify-content-center mt-5">
					<div class="col-lg-6 text-center">
						<nav class="navigation pagination d-inline-block">
							<div class="nav-links">
								<!-- 이전페이지 이동 -->
								<c:if test="${productList.page <= 1 }">
									<a class="prev page-numbers">Prev</a>
								</c:if>
								<c:if test="${productList.page > 1 }">
									<a class="prev page-numbers"
										href="/product/product_list?page=${productList.page-1}&searchWord=${productList.searchWord}&classification=${productList.classification}&cook_time=${productList.cook_time}&category=${productList.category}">Prev</a>
								</c:if>
								<!-- <span aria-current="page" class="page-numbers current">1</span>  -->

								<!-- 하단넘버링 넣기 -->
								<c:forEach var="nowpage" begin="${productList.startPage}"
									end="${productList.endPage }">
									<c:if test="${productList.page == nowpage }">
										<span class="page-numbers current">${nowpage}</span>
									</c:if>
									<c:if test="${productList.page != nowpage }">
										<a href="/product/product_list?page=${nowpage }&searchWord=${productList.searchWord}&classification=${productList.classification}&cook_time=${productList.cook_time}&category=${productList.category}">
										<span class="page-numbers current">${nowpage}</span></a>
									</c:if>
								</c:forEach>

								<!-- 다음 -->
								<c:if test="${productList.page >= productList.endPage }">
									<a class="next page-numbers">Next</a>
								</c:if>
								<c:if test="${productList.page < productList.endPage }">
									<a class="next page-numbers"
										href="/product/product_list?page=${productList.page+1}&searchWord=${productList.searchWord}&classification=${productList.classification}&cook_time=${productList.cook_time}&category=${productList.category}">Next</a>
								</c:if>
							</div>
						</nav>
					</div>
				</div>
				<!-- 하단 넘버링 Close -->
			</div>
		</section>

		<!-- footer Start -->
		<jsp:include page="../layout/footer.jsp"></jsp:include>
		<!-- footer Close -->

	</div>

	<!-- 
    Essential Scripts
    =====================================-->


	<!-- Main jQuery -->
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
	<script src="http://code.jquery.com/jquery-latest.min.js"></script>

	<script src="/js/script.js"></script>

</body>

</html>