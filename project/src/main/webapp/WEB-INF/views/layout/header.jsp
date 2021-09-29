<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<header class="navigation">
	<div class="header-top ">
		<div class="container">
			<div class="row justify-content-between align-items-center">
				<div class="col-lg-2 col-md-4">

					<!-- 좌측 상단 소셜네트워크 부분 -->
					<div class="header-top-socials text-center text-lg-left text-md-left">
						<a href="https://www.facebook.com" target="_blank"><i class="ti-facebook"></i></a>
						<a href="https://twitter.com" target="_blank"><i class="ti-twitter"></i></a>
						<a href="https://github.com" target="_blank"><i class="ti-github"></i></a>
					</div>
				</div>
				<div class="col-lg-10 col-md-8 text-center text-lg-right text-md-right">

					<!-- 우측 상단 연락처 및 이메일 -->
					<div class="header-top-info">
						<a href="tel:+23-345-67890">Call Us : <span>+23-345-67890</span></a>
						<a href="mailto:support@gmail.com"><i class="fa fa-envelope mr-2"></i><span>support@gmail.com</span></a>
					</div>
				</div>
			</div>
		</div>
	</div>
	<nav class="navbar navbar-expand-lg  py-4" id="navbar">
		<div class="container">

			<!-- nav 좌측 로고 부분 -->
			<a class="navbar-brand" href="/index">
				요리<span>어때</span>
			</a>

			<button class="navbar-toggler collapsed" type="button" data-toggle="collapse" data-target="#navbarsExample09"
				aria-controls="navbarsExample09" aria-expanded="false" aria-label="Toggle navigation">
				<span class="fa fa-bars"></span>
			</button>

			<div class="collapse navbar-collapse text-center" id="navbarsExample09">
				
				<!-- nav Start -->
				<ul class="navbar-nav ml-auto">
					<li class="nav-item active">
						<a class="nav-link" href="/index">Home <span class="sr-only">(current)</span></a>
					</li>
					<!-- 아래로 떨어지는 목록 -->
					
					<!-- <li class="nav-item dropdown">
						<a class="nav-link dropdown-toggle" href="#" id="dropdown03" data-toggle="dropdown" aria-haspopup="true"
							aria-expanded="false">About</a>
						<ul class="dropdown-menu" aria-labelledby="dropdown03">
							<li><a class="dropdown-item" href="map">음식점 지도</a></li>
							<li><a class="dropdown-item" href="pricing.html">Pricing</a></li>
						</ul>
					</li> -->
					
					<li class="nav-item"><a class="nav-link" href="/map">지도</a></li>
					<li class="nav-item"><a class="nav-link" href="/event_board/event_list">이벤트</a></li>
					<li class="nav-item"><a class="nav-link" href="/notice_board/notice_list">공지사항</a></li>
					<li class="nav-item"><a class="nav-link" href="/one_board/one_list">1대1문의</a></li>
					<li class="nav-item"><a class="nav-link" href="/product/product_list">상품</a></li>
					
					<!-- 유저로 로그인 시 -->
					<c:if test="${session_user == 'member' }">
					<li class="nav-item dropdown">
						<a class="nav-link dropdown-toggle" href="#" id="dropdown05" data-toggle="dropdown" aria-haspopup="true"
							aria-expanded="false">마이페이지</a>
						<ul class="dropdown-menu" aria-labelledby="dropdown05">
							<li><a class="dropdown-item" href="/cart/memberCartList">CART</a></li>
							<li><a class="dropdown-item" href="/member/mypage">MY INFO</a></li>
						</ul>
					</li>
					</c:if>
					
					<!-- 사업자로 로그인 시 -->
					<c:if test="${session_user == 'store' }">
					<li class="nav-item dropdown">
						<a class="nav-link dropdown-toggle" href="#" id="dropdown05" data-toggle="dropdown" aria-haspopup="true"
							aria-expanded="false">마이페이지</a>
						<ul class="dropdown-menu" aria-labelledby="dropdown05">
							<li><a class="dropdown-item" href="/store/order_mypage">ORDER</a></li>
							<li><a class="dropdown-item" href="/store/product_mypage">PRODUCT</a></li>
						</ul>
					</li>
					</c:if>
					
					<!-- 관리자로 로그인 시 -->
					<c:if test="${session_rank == '9' }">
					<li class="nav-item dropdown">
						<a class="nav-link dropdown-toggle" href="#" id="dropdown05" data-toggle="dropdown" aria-haspopup="true"
							aria-expanded="false">관리자 메뉴</a>
						<ul class="dropdown-menu" aria-labelledby="dropdown05">
							<li><a class="dropdown-item" href="/admin/memberList">회원관리</a></li>
							<li><a class="dropdown-item" href="/businessManager">사업자관리</a></li>
							<li><a class="dropdown-item" href="/admin/chart">주문/매출현황</a></li>
						</ul>
					</li>
					</c:if>
				</ul>
				<!-- nav Close -->

				<!-- nav 우측 버튼 부분 -->
				<c:if test="${session_flag != 'success' }">
				<form class="form-lg-inline my-2 my-md-0 ml-lg-4 text-center">
					<a href="/login" class="btn btn-solid-border btn-round-full">로그인</a>
				</form>
				<form class="form-lg-inline my-2 my-md-0 ml-lg-4 text-center">
					<a href="/register" class="btn btn-solid-border btn-round-full">회원가입</a>
				</form>
				</c:if>
				
				<c:if test="${session_flag == 'success' }">
				<form class="form-lg-inline my-2 my-md-0 ml-lg-4 text-center">
					<a href="/logout" class="btn btn-solid-border btn-round-full">로그아웃</a>
				</form>
				</c:if>
			</div>
		</div>
	</nav>
</header>