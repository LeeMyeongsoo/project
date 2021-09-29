<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Document</title>
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
    });
  </script>
<!--===============================================================================================-->	
	<link rel="stylesheet" type="text/css" href="../vendor/bootstrap/css/bootstrap.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="../fonts/font-awesome-4.7.0/css/font-awesome.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="../vendor/animate/animate.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="../vendor/select2/select2.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="../vendor/perfect-scrollbar/perfect-scrollbar.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="../css/one_util.css">
	<link rel="stylesheet" type="text/css" href="../css/one_list.css">
	<link rel="stylesheet" type="text/css" href="../css/one_list_main.css">
<!--===============================================================================================-->
<style type="text/css">
#body_check{
padding-left:10%;
display:inline-block;
width:50%;
}
#body_check input{
display:inline-block;
width:50%;
}
#write{
display:inline-block;
width:10%;
	background-color: aqua;
}
table, th, td, tr {
	text-align: center;
	padding-right: 0;

.form_input {
	background: #f1fbff;
	border: 1px solid #EEF2F6;
	box-shadow: none;
	width: 30%;
	height: 45px;
	margin-bottom: 10px;
	padding: 10px 14px 10px 14px;
}

.form_input:focus {
	border: 1px solid #EEF2F6 !important;
}
}
</style>

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
							<h1 class="text-capitalize mb-4 text-lg">1대1 문의</h1>
							<ul class="list-inline">
								<li class="list-inline-item"><a href="/index"
									class="text-white">Home</a></li>
								<li class="list-inline-item"><span class="text-white">/</span></li>
								<li class="list-inline-item"><a href="one_list"
									class="text-white-50">1대1문의</a></li>
							</ul>
						</div>
					</div>
				</div>
			</div>
		</section>
	<section class="section blog-wrap bg-gray">
			
				<div class="mb-5">
	

	
	<div id="body_title" class="">
		<div class="">
			<form action="/one_board/one_list" name="search" method="post">
					<div class="row justify-content-center">
						<select name="category" id="category" class="mr-4 width-4vw" style="font-family: 'Poppins', sans-serif;">
							<option value="">선택하세요</option>
							<option value="product">상품문의</option>
							<option value="refund">환불문의</option>
							<option value="delivery">배송문의</option>
						</select>
						<select name="category1" id="category" class="mr-4" style="font-family: 'Poppins', sans-serif;">
							<option value="oall" selected="selected">전체</option>
							<option value="one_title">제목</option>
							<option value="one_content">내용</option>
							<option value="one_name">작성자</option>
						</select> 
						<input type="text" size="30" placeholder="검색해주세요" name="searchword" class="form_input" style="font-family: 'Poppins', sans-serif;">
						<button id="btn" type="submit" value="검색"><i class="fa fa-search fa-2x ml-5"></i></button>	
					</div>
						<c:if test="${session_id != null }">
						<a href="one_write?page=${map.page}"><div class="btn btn-main ml-5">쓰기</div></a>
						</c:if>
			</form>
		</div>
	</div>

	<div class="limiter">
		<div class="container-table100">
			<div class="wrap-table100">
				
				<div class="table100 ver2 m-b-110">
					<div class="table100-head">
						<table>
					<colgroup>
						<col width="10%">
						<col width="15%">
						<col width="50%">
						<col width="10%">
						<col width="10%">
						<col width="5%">
					</colgroup>
							<thead>
								<tr class="">
									<th class="">No</th>
									<th class="">작성자</th>
									<th class="">제목</th>
									<th class="">분류</th>
									<th class="">작성일</th>
									<th class="">조회수</th>
								</tr>
							</thead>
						</table>
					</div>
					<div class="table100-body js-pscroll">
						<table>
					<colgroup>
						<col width="10%">
						<col width="15%">
						<col width="50%">
						<col width="10%">
						<col width="10%">
						<col width="5%">
					</colgroup>
								<c:forEach items="${map.list }" var="list">
									<tr style="height: 30px;">
										<td>${list.id }</td>
										<td>${list.bname}</td>
										<td><a href="one_view?id=${list.id }">${list.btitle }</a></td>
										<td>${list.bcategory}</td>
										<td>${list.bdate }</td>
										<td>${list.bhit }</td>
									</tr>
								</c:forEach>
						</table>
					</div>
				</div>
			</div>
		</div>
	</div>
	</div>
	</section>

		<!-- footer Start -->
		<jsp:include page="../layout/footer.jsp"></jsp:include>
		<!-- footer Close -->


<!--===============================================================================================-->	
	<script src="../vendor/jquery/jquery-3.2.1.min.js"></script>
<!--===============================================================================================-->
	<script src="../vendor/bootstrap/js/popper.js"></script>
	<script src="../vendor/bootstrap/js/bootstrap.min.js"></script>
<!--===============================================================================================-->
	<script src="../vendor/select2/select2.min.js"></script>
<!--===============================================================================================-->
	<script src="../vendor/perfect-scrollbar/perfect-scrollbar.min.js"></script>
	<script>
		$('.js-pscroll').each(function(){
			var ps = new PerfectScrollbar(this);

			$(window).on('resize', function(){
				ps.update();
			})
		});
	</script>
<!--===============================================================================================-->
	<script src="js/main.js"></script>

</body>
</html>