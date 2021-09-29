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
				.select1 {
				    padding: 15px 10px;
				}
				.select1 input[type=radio]{
				    display: none;
				}
				.select1 input[type=radio]+label{
				    display: inline-block;
				    cursor: pointer;
				    height: 24px;
				    width: 90px;
				    border: 1px solid #333;
				    line-height: 24px;
				    text-align: center;
				    font-weight:bold;
				    font-size:13px;
				}
				.select1 input[type=radio]+label{
				    background-color: #fff;
				    color: #333;
				}
				.select1 input[type=radio]:checked+label{
				    background-color: #333;
				    color: #fff;
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
										<h1 class="text-capitalize mb-4 text-lg">1대1 문의 글쓰기</h1>
										<ul class="list-inline">
											<li class="list-inline-item"><a href="index.html" class="text-white">Home</a></li>
											<li class="list-inline-item"><span class="text-white">/</span></li>
											<li class="list-inline-item text-white-50">one_write</li>
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
								<form action="/one_board/one_write" name="boardWrite" method="post" enctype="multipart/form-data">
							      <input type="hidden" name="id" value="101">
							      <table>
							        <colgroup>
							          <col width="15%">
							          <col width="85%">
							        </colgroup>
							        <tr>
							          <th>작성자</th>
							          <td>
							            <input type="text" name="bname" readonly value="${session_nickname }">
							          </td>
							        </tr>
							        <tr>
							          <th>제목</th>
							          <td>
							            <input type="text" name="btitle">
							          </td>
							        </tr>
							        <tr>
										<td style="font-weight: bold;">문의</td>
										<td>
											<div class="select1">
												<input type="radio" id="product" name="bcategory" value="product"><label for="product">상품</label>
												<input type="radio" id="refund" name="bcategory" value="refund"><label for="refund">상품배송</label>
												<input type="radio" id="delivery" name="bcategory" value="delivery"><label for="delivery">환불</label>
											</div>
										</td>
									</tr>
							        <tr>
							          <th>내용</th>
							          <td>
							            <textarea name="bcontent" cols="100" rows="10"></textarea>
							          </td>
							        </tr>
							        <tr>
							          <th>이미지 표시</th>
							          <td>
							            <input type="file" name="file" id="files">
							          </td>
							        </tr>
							      </table>
							      <hr>
							      <div class="button-wrapper">
							        <button type="submit" class="btn btn-main btn-round-full">작성완료</button>
							        <button type="button" class="btn btn-main btn-round-full" onclick="javascript:location.href='one_list?page=${param.page}'">취소</button>
							      </div>
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