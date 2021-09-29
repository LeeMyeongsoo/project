<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype html>
<html lang="ko">

<head>
	<!-- Required meta tags -->
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	<meta name="description" content="megakit,business,company,agency,multipurpose,modern,bootstrap4">

	<meta name="author" content="themefisher.com">

	<title>login</title>

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
	<style>
		.container1 {
			margin: 0 auto;
			width: 480px;
		}

		.c_choose label {
			margin: 0;
		}

		.form_label {
			font-size: 14px;
			font-weight: 700;
			margin: 0;
		}

		.form_input {
			background: #f1fbff;
			border: 1px solid #EEF2F6;
			box-shadow: none;
			width: 100%;
			height: 45px;
			margin-bottom: 10px;
			padding: 10px 14px 10px 14px;
		}

		.form_input:focus {
			border: 1px solid #EEF2F6 !important;
		}

		.c_btn {
			background: #ff8383;
			border: none;
			box-shadow: none;
			width: 100%;
			height: 5vh;
			font-size: 20px;
			padding: 0;
		}

		.c_choose {
			text-align: center;
		}
	</style>

	<script src="http://code.jquery.com/jquery-latest.min.js"></script>
	<!-- 폼 액션 관련 부분 -->
	<script>
		$(function () {
			// 유저 -> member  /  업체 ->store
			$('.choose').on('click', function() {
				$('.choose').removeClass('btn-main');
				$('.choose').addClass('btn-solid-border');
				$(this).removeClass('btn-solid-border');
				$(this).addClass('btn-main');
				$('#regForm').attr('action', $(this).data('value'));
			});
		});

 		function login(){
			$.ajax({
				url:$("#regForm").attr("action"),
				type:"POST",
				data:$("#regForm").serialize(),
				dataType:"html",
				success:function(result){
					if(result == 1){
						alert("로그인 되었습니다.");
						location.href="/index";
					} else {
						alert("아이디 또는 비밀번호를 확인해주세요.");
						location.href="/login";
					}
				},
				error:function(){
					alert("로그인 에러");
				}
			});
			return false;
		}
	</script>

</head>

<body>

	<!-- Header Start -->
	<jsp:include page="./layout/header.jsp"></jsp:include>
	<!-- Header Close -->

	<section class="section bg-white">
		<div class="container1">

			<!-- 폼 시작 -->
			<form action="/member/login" method="POST" id="regForm" onsubmit="return login();">

				<!-- 유저/업체 -->
				<div class="c_choose">
					<span class="btn btn-small btn-main btn-round-full choose" data-value="/member/login">유저</span>
					<span class="btn btn-small btn-solid-border btn-round-full choose" data-value="/store/login">업체</span>
				</div>

				<!-- 계정 -->
				<div class="c_acc">
					<h3><label for="c_id" class="form_label">아이디</label></h3>
					<input type="text" name="id" id="c_id" class="form_input"><br><span class="c_id_text"></span>
					<h3><label for="c_pw" class="form_label">비밀번호</label></h3>
					<input type="password" name="pw" id="c_pw" class="form_input"><br><span class="c_pw_text"></span>
				</div>

				<div style="text-align: center;">
					<br>
					<input type="submit" value="로그인" class="c_btn">
				</div>
			</form>
		</div>
	</section>

	<!-- footer Start -->
	<jsp:include page="./layout/footer.jsp"></jsp:include>
	<!-- footer Close -->

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

	<script src="/js/script.js"></script>

</body>

</html>