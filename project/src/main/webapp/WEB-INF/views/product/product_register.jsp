<!-- <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%> -->
		<!DOCTYPE html>
		<html lang="ko">
		
		<head>
		
			<!-- ** Basic Page Needs ** -->
			<meta charset="utf-8">
			<title>상품 등록</title>
		
			<!-- ** Mobile Specific Metas ** -->
			<meta http-equiv="X-UA-Compatible" content="IE=edge">
			<meta name="description" content="Agency HTML Template">
			<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=5.0">
			<meta name="author" content="Themefisher">
			<meta name="generator" content="Themefisher Html5 Agency Template v1.0">
		
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
		
			<!--Favicon-->
			<link rel="icon" href="images/favicon.png" type="image/x-icon">
		
			<!-- 규상 -->
			<style>
				input {
					width: 100%;
				}
		
				table {
					width: 100%;
					font-family: 'Poppins', sans-serif;
					width: 100%;
				    border-top: 1px solid #444444;
				    border-collapse: collapse;
				}
		
				th,
				td {
					border-bottom: 1px solid #444444;
    				padding: 10px;
				}
			</style>
		
		</head>
		
		<body>
		
			<!-- Header Start -->
			<jsp:include page="../layout/header.jsp"></jsp:include>
			<!-- Header Close -->
		
			<section class="page-title bg-1">
				<div class="container">
					<div class="row">
						<div class="col-md-12">
							<div class="block text-center">
								<span class="text-white">News details</span>
								<h1 class="text-capitalize mb-4 text-lg">상품등록</h1>
								<ul class="list-inline">
									<li class="list-inline-item"><a href="index.html" class="text-white">Home</a></li>
									<li class="list-inline-item"><span class="text-white">/</span></li>
									<li class="list-inline-item text-white-50">Product Register</li>
								</ul>
							</div>
						</div>
					</div>
				</div>
			</section>
		
			<section class="section blog-wrap bg-gray">
				<div class="container">
					<div class="row">
						<div class="col-lg-12 mb-5">
							<div class="single-blog-item">
								<form action="/product/productRegister" method="post" class="contact-form bg-white rounded p-2" id="comment-form" enctype="multipart/form-data">
									<input type="hidden" name="store_id" value="${session_id }">
									<input type="hidden" name="rate" value="0">
									<table>
										<colgroup>
											<col style="width: 10%;">
											<col style="width: 40%;">
											<col style="width: 10%;">
											<col style="width: 40%;">
										</colgroup>
										<tr>
											<td>상품명</td>
											<td colspan="3"><input type="text" name="name" id=""></td>
										</tr>
										<tr>
											<td>몇인분</td>
											<td colspan="3"><input type="number" min="1" max="5" name="serving" id=""></td>
										</tr>
										<tr>
											<td>분류</td>
											<td>
												<select name="classification" id="">
													<option value="한식">한식</option>
													<option value="일식">일식</option>
													<option value="중식">중식</option>
													<option value="양식">양식</option>
												</select>
											</td>
											<td>조리시간</td>
											<td><select name="cook_time" id="">
													<option value="10">10분</option>
													<option value="20">20분</option>
													<option value="30">30분</option>
													<option value="40">40분</option>
													<option value="50">50분</option>
													<option value="60">60분</option>
												</select></td>
										</tr>
										<tr>
											<td>가격</td>
											<td colspan="3"><input type="text" name="price" id=""></td>
										</tr>
		
										<tr>
											<td>수량</td>
											<td colspan="3"><input type="text" name="quantity" id=""></td>
										</tr>
										<tr>
											<td>상품 사진</td>
											<td><input type="file" name="file" id="" onchange="setThumbnail(event);"></td>
											<td>상품<br>미리보기</td>
											<td><div id="image_container"></div> </td>
										</tr>
										<tr>
											<td>상품 소개</td>
											<td colspan="3"><textarea name="content" id="" cols="100" rows="10"></textarea></td>
										</tr>
									</table>
									<!-- 사진 미리보기 스크립트 -->
									<script> 
										function setThumbnail(event) { 
											var reader = new FileReader(); 
											reader.onload = function(event) { 
												var img = document.createElement("img"); 
												img.setAttribute("src", event.target.result); 
												document.querySelector("div#image_container").appendChild(img);
											}; 
											reader.readAsDataURL(event.target.files[0]); 
										} 
									</script>
									<hr>
									<input class="btn btn-main btn-round-full" type="submit" value="상품 등록">
								</form>
							</div>
						</div>
					</div>
				</div>
			</section>
		
			<jsp:include page="../layout/footer.jsp"></jsp:include>
		
			<!--Scroll to top-->
			<div id="scroll-to-top" class="scroll-to-top">
				<span class="icon fa fa-angle-up"></span>
			</div>
		
		
			<!-- 
		Essential Scripts
		=====================================-->
			<!-- Main jQuery -->
			<script src="/plugins/jquery/jquery.min.js"></script>
			<!-- Bootstrap 4.3.1 -->
			<script src="/plugins/bootstrap/bootstrap.min.js"></script>
			<!--  Magnific Popup-->
			<script src="/plugins/magnific-popup/jquery.magnific-popup.min.js"></script>
			<!-- Slick Slider -->
			<script src="/plugins/slick/slick.min.js"></script>
			<!-- Counterup -->
			<script src="/plugins/counterup/jquery.waypoints.min.js"></script>
			<script src="/plugins/counterup/jquery.counterup.min.js"></script>
		
			<script src="/js/script.js"></script>
		
		</body>
		
		</html>