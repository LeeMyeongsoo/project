<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!doctype html>
<html lang="en">
<head>
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
	text-align: left;
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

.list {
	float: right;
	width: 120px;
	height: 50px;
	line-height: 50px;
	margin: 30px 15px 10px 0;
	font-family: 'Poppins', sans-serif;
	border: 2px black solid;
	text-align: center;
}
</style>
<script type="text/javascript">
	function boardDelete() {
		if (confirm("삭제하시겠습니까?") == true) {
			location.href = "notice_delete?id=" + ${notice_boardVo.id}	+"&page=" + ${page};
		}
	}
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
							<h1 class="text-capitalize mb-4 text-lg">NOTICE</h1>
							<ul class="list-inline">
								<li class="list-inline-item"><a href="/index"
									class="text-white">Home</a></li>
								<li class="list-inline-item"><span class="text-white">/</span></li>
								<li class="list-inline-item"><a href="notice_list"
									class="text-white-50">notice</a></li>
							</ul>
						</div>
					</div>
				</div>
			</div>
		</section>

		<section>

			<table>
				<tr>
					<th>${notice_boardVo.ntitle}</th>
				</tr>

				<tr>
					<td>${notice_boardVo.ndate}</td>
				</tr>

				<tr>
					<td class="article"><img src="/upload/${notice_boardVo.nupload}"
						alt="" width="80%"></td>
				</tr>

				<tr>
					<td colspan="3" class="article">${notice_boardVo.ncontent}</td>
				</tr>



				<tr>
					<td colspan="3"><strong>다음글</strong> <span class="separator">|</span><a
						href="notice_view?id=${notice_boardVoPre.id}">${notice_boardVoPre.ntitle}</a></td>
				</tr>
				<tr>
					<td colspan="3"><strong>이전글</strong> <span class="separator">|</span><a
						href="notice_view?id=${notice_boardVoNext.id}">${notice_boardVoNext.ntitle}</a></td>
				</tr>
			</table>

			<a href="/notice_board/notice_list?page=${page}"><div class="list">목록</div></a>


			<!-- 관리자 모드 삭제,수정, -->
			<c:if test="${session_rank == 9 }">
			<div class="list" onclick="boardDelete()">삭제</div>

			<a href="notice_modify?id=${notice_boardVo.id}&page=${page}"><div
					class="list">수정</div></a> 
			</c:if>

		</section>
	</div>
	<hr>
	<!-- footer Start -->
	<jsp:include page="../layout/footer.jsp"></jsp:include>



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