<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!doctype html>
<html lang="ko">
<head>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript">
     function selectcheck(){
   
        if ($("#searchWord").val().length == 0){
           alert("한글자 이상 입력하세요 ");
           $("#searchWord").focus();
           return false;
        }
        return $("#search").submit(); 
     }
     
  </script>

<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description"
	content="megakit,business,company,agency,multipurpose,modern,bootstrap4">

<meta name="author" content="themefisher.com">

<title>notice_list</title>

<!-- bootstrap.min css -->
<link rel="stylesheet" href="../plugins/bootstrap/css/bootstrap.min.css">
<!-- Icon Font Css -->
<link rel="stylesheet" href="../plugins/themify/css/themify-icons.css">
<link rel="stylesheet" href="../plugins/fontawesome/css/all.css">
<link rel="stylesheet"
	href="../plugins/magnific-popup/dist/magnific-popup.css">
<!-- Owl Carousel CSS -->
<link rel="stylesheet" href="../plugins/slick-carousel/slick/slick.css">
<link rel="stylesheet"
	href="../plugins/slick-carousel/slick/slick-theme.css">

<!-- Main Stylesheet -->
<link rel="stylesheet" href="../css/style.css">


<!-- 내가 한거 -->
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<style>
.container1 {
	margin: 0 auto;
	width: 80vw;
}

.flex-between {
	display: flex;
	justify-content: center;
}

.width-2vw {
	width: 2vw;
}

.width-4vw {
	width: 4vw;
}

table {
	width: 96%;
	margin-top: 100px;
	margin-left: auto;
	margin-right: auto;
	line-height: 40px;
	font-family: 'Poppins', sans-serif;
}

.table-notice {
	background-color: #e56e00;
	color: white;
	padding-left: 10px;
	padding-right: 10px;
}

.table-title {
	text-align: center;
}

table {
	border-collapse: collapse;
}

th {
	border: 1px solid silver;
	border-top: 2px solid black;
}

td {
	border: 1px solid silver;
}

th, td {
	border-left: hidden;
	border-right: hidden;
}
</style>

</head>

<body>

	<!-- Header Start -->
	<%-- <jsp:include page="./layout/header.jsp"></jsp:include> --%>
	<%@include file="../layout/header.jsp"%>
	<!-- Header Close -->
	<div class="main-wrapper ">
		<section class="page-title bg-1">
			<div class="container">
				<div class="row">
					<div class="col-md-12">
						<div class="block text-center">
							<!-- <span class="text-white">Our blog</span> -->
							<h1 class="text-capitalize mb-4 text-lg">NOTICE</h1>
							<ul class="list-inline">
								<li class="list-inline-item"><a href="/index"
									class="text-white">Home</a></li>
								<li class="list-inline-item"><span class="text-white">/</span></li>
								<li class="list-inline-item"><a href="notice_list"
									class="text-white-50">Notice</a></li>
							</ul>
						</div>
					</div>
				</div>
			</div>
		</section>
		<section class="section blog-wrap bg-gray">
			<div class="container1 text-center wrapper">
				<div class="mb-5">
					<form action="/notice_board/notice_list" id="search" name="search"
						method="post">
						<div class="flex-between">
						
						
							<select name="category" id="category" class="mr-2 width-4vw"
								style="font-family: 'Poppins', sans-serif;">
								<option value="ball">전체</option>
								<option value="btitle">제목</option>
								<option value="bcontent">내용</option>
							</select>

							<div class="mr-2">
								<input type="text" size="40" name="searchWord" id="searchWord">
							</div>

							<button type="submit" onclick="selectcheck()">
								<i class="fas fa-search width-2vw"></i>
							</button>
						</div>
					</form>
				</div>

				<table>
					<colgroup>
						<col width="20%">
						<col width="50%">
						<col width="20%">
						<col width="10%">
					</colgroup>
					<!-- 제목부분 -->
					<tr>
						<th>No.</th>
						<th>제목</th>
						<th>작성일</th>
						<th>조회수</th>
					</tr>
					<!-- 내용부분 -->
					<c:forEach items="${map.list}" var="notice_boardVo">
						<tr>
							<td><span class="table-notice">${notice_boardVo.id }</span></td>
							<td class="table-title"><a
								href="notice_view?id=${notice_boardVo.id}&page=${map.page}&category=${map.category}&searchWord=${map.searchWord}">
									${notice_boardVo.ntitle }
							</a></td>
					
							<fmt:formatDate value="${notice_boardVo.ndate }" var="date" type="DATE" pattern="yyyy-MM-dd" />
								<td>${date}</td>
							
							<td>${notice_boardVo.nhit }</td>
						</tr>
					</c:forEach>
				</table>




				<!-- 하단 넘버링 -->




				<div class="row justify-content-center mt-5">
					<div class="text-center">
						<nav class="navigation pagination d-inline-block">
							<div class="nav-links">
								<!-- 이전페이지 이동 -->
								<c:if test="${map.page <= 1 }">
									<a class="prev page-numbers">Prev</a>
								</c:if>
								<c:if test="${map.page > 1 }">
									<a class="prev page-numbers"
										href="notice_list?page=${map.page-1}&category=${map.category}&searchWord=${map.searchWord}">Prev</a>
								</c:if>
								<!-- <span aria-current="page" class="page-numbers current">1</span>  -->

								<!-- 하단넘버링 넣기 -->
								<c:forEach var="nowpage" begin="${map.startpage}"
									end="${map.endpage }">
									<c:if test="${map.page == nowpage }">
										<span class="page-numbers current">${nowpage}</span>
									</c:if>
									<c:if test="${map.page != nowpage }">
										<a href="notice_list?page=${nowpage }&category=${map.category}&searchWord=${map.searchWord}">
										<span class="page-numbers current">${nowpage}</span></a>
									</c:if>
								</c:forEach>

								<!-- 다음 -->
								<c:if test="${map.page >= map.endpage }">
									<a class="next page-numbers">Next</a>
								</c:if>
								<c:if test="${map.page < map.endpage }">
									<a class="next page-numbers"
										href="notice_list?page=${map.page+1}&category=${map.category}&searchWord=${map.searchWord}">Next</a>
								</c:if>

							</div>
						</nav>
					</div>
				</div>
								<!-- 관리자만 쓰기 모드 가능하게   -->
								<c:if test="${session_rank == 9 }">
								<a href="notice_write?page=${map.page }"><div class="write">쓰기</div></a>
								</c:if>
			</div>
		</section>
	</div>

	<!-- footer Start -->
	<%@include file="../layout/footer.jsp"%>
	<!-- footer Close -->

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
	<script
		src="https://maps.googleapis.com/maps/api/js?key=AIzaSyAkeLMlsiwzp6b3Gnaxd86lvakimwGA6UA&callback=initMap"></script>

	<script src="js/script.js"></script>

</body>
</html>