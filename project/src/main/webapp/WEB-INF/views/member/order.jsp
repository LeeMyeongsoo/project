<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html lang="ko">

<head>

<!-- ** Basic Page Needs ** -->
<meta charset="utf-8">
<title>주문하기</title>

<!-- ** Mobile Specific Metas ** -->
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="description" content="Agency HTML Template">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, maximum-scale=5.0">
<meta name="author" content="Themefisher">
<meta name="generator" content="Themefisher Html5 Agency Template v1.0">

<!-- bootstrap.min css -->
<link rel="stylesheet" href="/plugins/bootstrap/css/bootstrap.min.css">
<!-- Icon Font Css -->
<link rel="stylesheet" href="/plugins/themify/css/themify-icons.css">
<link rel="stylesheet" href="/plugins/fontawesome/css/all.min.css">
<link rel="stylesheet" href="/plugins/magnific-popup/magnific-popup.css">
<!-- Owl Carousel CSS -->
<link rel="stylesheet" href="/plugins/slick-carousel/slick/slick.css">
<link rel="stylesheet"
	href="/plugins/slick-carousel/slick/slick-theme.css">


<!-- Main Stylesheet -->
<link rel="stylesheet" href="/css/style.css">

<!--Favicon-->
<link rel="icon" href="images/favicon.png" type="image/x-icon">

<!-- 규상 -->
<style>
* {
	margin: 0;
	padding: 0;
}

.flex {
	display: flex;
}

.width100 {
	width: 100%;
}

.width90 {
	width: 90%;
}

.width50 {
	width: 50%;
}

.width30 {
	width: 30%;
}

/*우측결제박스*/
#pay_right {
	display: inline-block;
	position: sticky;
	top: 30px;
	float: right;
	width: 300px;
	height: 200px;
}
/*결제버튼*/
#pay_btn {
	width: 100%;
	height: 50px;
	margin: auto;
	display: block;
	border: none;
}
/*장바구니-주문서작성-주문완료 span1*/
#span1 {
	width: 50%;
	height: 45px;
	line-height: 50px;
	font-weight: bold;
	color: black;
	text-align: center;
	vertical-align: middle;
}

/*장바구니-주문서작성-주문완료 span2*/
#span2 {
	width: 50%;
	height: 45px;
	line-height: 50px;
	font-weight: bold;
	color: black;
	text-align: center;
	vertical-align: middle;
	background: rgba(255, 156, 49, 0.2);
}

label:hover, label:active {
	cursor: pointer;
}


/*카드정보*/
label {
	background: white;
	width: 250px;
	height: 60px;
	border: 1px solid black;
	text-align: center;
	vertical-align: bottom;
	padding: 15px;
	margin: 2px;
	font-weight: bold;
	font-size: 17px;
	letter-spacing: -1px;
}
.in {
	float: left;
}

label:hover {
	border: 3px solid black;
	color: red;
}
label:active {
	cursor: pointer;
	border: 3px solid black;
	color: red;
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
						<span class="text-white"></span>
						<h1 class="text-capitalize mb-4 text-lg">주문하기</h1>
						<ul class="list-inline">
							<li class="list-inline-item"><a href="index.html"
								class="text-white">Home</a></li>
							<li class="list-inline-item"><span class="text-white">/</span></li>
							<li class="list-inline-item text-white-50">Cart</li>
						</ul>
					</div>
				</div>
			</div>
		</div>
	</section>

	<div
		style="clear: both; position: relative; padding: 25px; border-bottom: 1px solid #ddd;">
		<span id="span1">장바구니</span><span>&nbsp;▶&nbsp;</span> <span
			id="span2">주문서 작성</span><span>&nbsp;▶&nbsp;</span> <span id="span1">주문완료</span>
	</div>
	<section class="section blog-wrap"
		style="padding-top: 50px; padding-bottom: 50px; background-color: rgba(0, 0, 0, 0.02);">
		<div class="container">
			<div class="row" style="width: 1200px;">
				<div class="col-lg-8">
					<!-- 주문자 -->
					<div class="mb-5">
						<!-- 주문자 정보 동일 체크 -->
						<div class="pt-3 pb-2 mb-4"
							style="border-bottom: 2px solid black;">
							<h3>주문자(ID : ${memberVo.id})</h3>
						</div>
						<div class="flex">
							<div class="width50 ml-3">
								<div>
									이름<span style="color: red;">*</span>
								</div>
								<div>
									<input type="text" class="width90" id="ClickName" name="sender"
										value="" style="height: 39px;">
								</div>
							</div>
							<div class="width50">
								<div>
									휴대폰<span style="color: red;">*</span>
								</div>
								<div>
									<select class="width30 p-1" name="" id="">
										<option value="010">010</option>
									</select> <input type="text" class="width30 px-3" name="" id="ClickTel1"
										value="" style="height: 39px;"> <input type="text"
										class="width30 px-3" name="" id="ClickTel2" value=""
										style="height: 39px;">
								</div>
							</div>
						</div>
					</div>
					<!-- 배송정보 -->
					<div>
						<div class="pt-3 pb-2 mb-1">
							<h3>배송정보</h3>
						</div>
						<div class="card" style="border-top: 2px solid black;">
							<!-- 배송지 부분 -->
							<div class="col-lg-12">
								<div class="row p-3">
									<div style="width: 20%; font-weight: bold;">
										배송지
										<div style="width: 50px; margin-top: 40px; margin-left: 3px;">
											<div style="margin-top: 170px;">
												<img src="../images/check.jpg" class="clickImg" id="clickImg" style="width: 25px;" height="25px;">
											</div>
											<span style="display: inline-block; width: 120px;">주문자
												정보와 동일</span>
										</div>
									</div>
									<div style="width: 80%;">
										<div class="row justify-content-between px-3">
											<div class="">
												이름<span style="color: red">*</span><br> <input type="text" name="recipient" id="ClickName_Html" value="">
											</div>
											<!-- 이름 -->
										</div>
										<div style="margin-top: 5px;">
											<span>휴대폰번호<span style="color: red">*</span></span><br>
											<select class="width30 p-1" name="" id=""
												style="width: 100px; height: 40px; margin: 2px;">
												<option value="">010</option>
											</select> <input type="text" class="width30 px-3" name="" id="ClickTel1-1" value="" style="width: 100px; height: 40px; margin: 2px;">
											<!-- 전번1 -->
											<input type="text" class="width30 px-3" name="" id="ClickTel2-1" value="" style="width: 100px; height: 40px; margin: 2px;">
											<!-- 전번2 -->
										</div>
										<span>주소<span style="color: red">*</span></span><br>
										<div>
											<input type="text" id="ClickAddr_Html" value="" name="delivery_area1" style="margin-bottom: 5px; width: 80%;">
										</div>
										<!-- 주소 -->
										<div>
											<input type="text" id="ClickAddr2_Html" value="" name="delivery_area2" style="width: 80%;">
										</div>
										<!-- 특이사항/이메일 -->
									</div>
								</div>
							</div>
							<hr>
							<!-- 아이템 wrap -->
							<div class="container">
								<!-- 0912 장바구니에서 선택된 상품만 forEach로 리스트 출력 시작-->
								<c:forEach items="${map.lists}" var="cartList">
									<div class="col-lg-12 p-3 flex">
										<!-- 이미지 -->
										<div style="width: 80px;">
											<img loading="lazy"
												src="/productPicture/${cartList.picture}"
												alt="" width="80px" height="80px" class="img-fluid rounded">
										</div>
										<!-- 상품명, 가격 -->
										<div class="px-4" style="width: 65%; margin-left: -10px;">
											<div>${cartList.product_name}(상품번호 : ${cartList.id})</div>

											<div class="mt-3 ml-2">
												가격 :
												<fmt:formatNumber value="${cartList.price}"
													groupingUsed="true" />
												원
											</div>
										</div>
										<!-- 수량 -->
										<div class="text-center" style="width: 12%; margin-top: 45px;">수량
											＊ ${cartList.amount} =</div>
										<!-- 총금액 -->
										<div class="text-center" style="width: 13%; margin-top: 45px;">
											<fmt:formatNumber value="${cartList.price * cartList.amount}"
												groupingUsed="true" />
											원
										</div>
									</div>
									<hr>
								</c:forEach>
								<!-- 0912 장바구니에서 선택된 상품만 forEach로 리스트 출력 끝-->
							</div>
						</div>
					</div>
					<!-- 결제수단 -->
					<div class="mb-5 ml-2">
						<div class="pt-3 pb-2 mb-4 mt-5"
							style="border-bottom: 2px solid black;">
							<h3>카드정보</h3>
						</div>
						<div>
							<div class="rad_wrap">
								<div class="in">
									<label onclick="Creditcard()">신용카드</label>
								</div>
								<div class="in">
									<label onclick="AccountTransfer()">실시간계좌이체</label>
								</div>
								<div>
									<label id="phonePay" onclick="phonePay()">휴대폰결제</label>
								</div>
							</div>
							<div class="rad_wrap">
								<div class="in">
									<label id="paycoPay" onclick="paycoPay()">PAYCO</label>
								</div>
								<div class="in">
									<label id="kakaoPay" onclick="kakaoPay()">KakaoPay</label>
								</div>
								<div>
									<label id="smilePay" onclick="smilePay()">SmilPay</label>
								</div>
							</div>
							<div class="rad_wrap">
								<div class="in">
									<label id="samsungPay" onclick="samsungPay()">SamsungPay</label>
								</div>
								<div>
									<label id="naverPay" onclick="naverPay()">NaverPay</label>
								</div>
							</div>
							<br>
							<!-- 카드종류 div -->
							<div class="flex" id="toks">
								<div>
									<div style="margin-top: 30px;">카드종류</div>
									<div>
										<select name="" id=""
											style="width: 360px; height: 50px; margin-right: 20px; padding-left: 15px; margin-top: 5px;">
											<option value="" selected>카드를 선택하세요</option>
											<option value="">BC카드</option>
											<option value="">삼성카드</option>
											<option value="">현대카드</option>
											<option value="">KB카드</option>
											<option value="">NH카드</option>
											<option value="">하나카드</option>
										</select>
									</div>
								</div>
								&nbsp;
								<div>
									<div style="margin-top: 30px; margin-left: 15px;">할부종류</div>
									<div>
										<select name="" id=""
											style="width: 360px; height: 50px; margin-left: 15px; padding-left: 15px; margin-top: 5px;">
											<option value="">할부종류</option>
											<option value="">일시불</option>
											<option value="">2개월</option>
											<option value="">3개월</option>
											<option value="">4개월</option>
											<option value="">6개월</option>
											<option value="">6개월</option>
											<option value="">7개월</option>
											<option value="">8개월</option>
											<option value="">9개월</option>
											<option value="">10개월</option>
											<option value="">11개월</option>
											<option value="">12개월</option>
											<option value="">24개월</option>
										</select>
									</div>
								</div>
								<br>
							</div>
							<!-- 카드종류 div -->
							<div id="TextInfo">
								<br>
								<!-- 네이버페이 div -->
							</div>
							<!-- 네이버페이 div -->
						</div>
					</div>
				</div>
				<!-- 결제정보(우측) -->
				<div class="col-lg-4 mt-5 mt-lg-0" id="pay_right" style="width: 500px; height: 700px;">

					<div class="sidebar-wrap">
						<div class="sidebar-widget latest-post card border-0 mb-3"
							style="width: 300px;">
							<div class="pt-3 pb-3 pl-3">
								<h3>결제정보</h3>
							</div>

							<div class="p-3" style="width: 300px;">
								<div
									class="media border-bottom py-3 flex justify-content-between">
									<div class="text-black">총 상품 금액</div>
									<div class="text-black">

										<c:set var="totals" value="0" />
										<c:forEach items="${map.lists }" var="result" varStatus="status">
									+ <fmt:formatNumber value="${result.price * result.amount}" groupingUsed="true" />
											<c:set var="total" value="${total+(result.price*result.amount)}" />
									원<br>
										</c:forEach>
									</div>
								</div>
								<br>

								<div
									class="media border-bottom py-3 flex justify-content-between">
									<div class="text-black">총 배송비</div>
									<div class="text-black">
										+
										<fmt:formatNumber value="3000" groupingUsed="true" />
										원
									</div>
								</div>
								<br>

								<div class="media py-3 flex justify-content-between">
									<div class="text-black">
										<b>총 결제금액</b>
									</div>
									<div class="text-black">
										<b><fmt:formatNumber value="${total+3000}" groupingUsed="true" /></b> 원
									</div>
									<%-- <c:out value="${total+3000}"/> --%>
								</div>
							</div>
							<div class="p-3" style="width: 300px;">
								<button type="button" id="pay_btn" onclick="kakaoPayGo()" >결제하기</button>
							</div>
						</div>
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
	<script src="http://code.jquery.com/jquery-latest.min.js"></script>
	<script type="text/javascript" src="https://code.jquery.com/jquery-2.1.0.min.js">
	<script src="/js/script.js"></script><!-- 없애면..(뭔가 이상하게 조금 틀이 깨짐) -->
	<!-- 주문자 정보와 동일 체크 시 -->
	<script type="text/javascript">
		
		$('.clickImg').click(function() {
			if($(this).attr('src') === '../images/check2.jpg'){
				$("#ClickName").val('');
				$("#ClickTel1").val('');
				$("#ClickTel2").val('');
				$("#ClickTel1-1").val('');
				$("#ClickTel2-1").val('');
				$("#ClickName_Html").val('');
				$("#ClickAddr_Html").val('');
				$("#ClickAddr2_Html").val('');
				var src = '../images/check.jpg';
				$(this).attr('src', src);
				return false;
			}
			if($("#ClickName").val() === "" || $("#ClickName").val() !== ""){
				alert("주문자와 동일한 정보로 입력합니다.");
				$("#ClickName").val('${memberVo.name}');
				$("#ClickTel1").val('${tel1}');
				$("#ClickTel2").val('${tel2}');
				$("#ClickTel1-1").val('${tel1}');
				$("#ClickTel2-1").val('${tel2}');
				$("#ClickName_Html").val('${memberVo.name}');
				$("#ClickAddr_Html").val('${memberVo.addr}');
				$("#ClickAddr2_Html").val('${memberVo.addr1}');
				var src = '../images/check2.jpg';
				$(this).attr('src', src);
			}else{
				return false;
			}
		});
	</script>
	<script type="text/javascript">
		$(function(){
			$("#pay_btn").click(function(){
				$.ajax({
					url:"/kakao/kakaoPay",
					data:{
						"total":${total},
						"count":${map.lists_count},
						"cart_id":'${map.cart_id}',
						"delivery_area" : $("#ClickAddr_Html").val()+" "+$("#ClickAddr2_Html").val(),
						"recipient":$("#ClickName_Html").val(),
						"sender":$("#ClickName").val()
						
						},
					dataType:"json",
					success:function(data){
						location.href=data.next_redirect_pc_url
						/* var option = "width = 500px, height = 500px, top = 100, left = 200, location = no"
						window.open(data.next_redirect_pc_url, "_blank", option); */
					},
					error:function(error){
						alert("에러입니다.");
					}
					
				});
			});
		});
	</script>
	<script type="text/javascript">
	function naverPay(){
		$("#TextInfo").show();
		$("#toks").hide();	
		$("#kakaoPay").css("color","rgb(87 87 87)");
		$("#kakaoPay").css("border","1px solid black");
		var html ='<p style="font-weight: bold;">네이버페이 이용안내</p>';
			html += '<ul style="margin-top:-10px; margin-left: 35px;">';
			html += '<li>주문 변경 시 카드사 혜택 및 할부 적용 여부는 해당 카드사 정책에 따라 변경될 수 있습니다.</li>';
			html += '<li> 네이버페이는 네이버ID로 별도 앱 설치 없이 신용카드 또는 은행계좌 정보를 등록하여 네이버페이 비밀번호로 결제할 수 있는 간편결제 서비스입니다.</li>';
			html += '<li> 결제 가능한 신용카드: 신한, 삼성, 현대, BC, 국민, 하나, 롯데, NH농협, 씨티, 카카오뱅크</li>';
			html += '<li> 결제 가능한 은행: NH농협, 국민, 신한, 우리, 기업, SC제일, 부산, 경남, 수협, 우체국, 미래에셋대우. 광주, 대구, 전북, 새마을금고, 제주은행, 신협, 하나은행, 케이뱅크</li>';
			html += '<li> 네이버페이 카드 간편결제는 네이버페이에서 제공하는 카드사 별 무이자, 청구할인 혜택을 받을 수 있습니다.</li>';
			html += '</ul>';
			$("#TextInfo").html(html);
	}
	function samsungPay(){
		$("#TextInfo").show();
		$("#toks").hide();
		$("#kakaoPay").css("color","rgb(87 87 87)");
		$("#kakaoPay").css("border","1px solid black");
		var html ='<p style="font-weight: bold;">삼성페이 이용안내</p>';
			html += '<ul style="margin-top:-10px; margin-left: 35px;">';
			html += '<li>삼성페이에 등록된 카드를 지문 또는 결제 비밀번호로 인증하여 쉽고 간편하게 안전한 결제가 가능합니다.</li>';
			html += '<li> 삼성페이 지원 단말기에서만 이용 가능합니다.(아이폰 불가)</li>';
			html += '<li> 지원카드 : 삼성페이에서 지원하는 모든 국내 신용/체크카드</li>';
			html += '<li> 주문 완료 후 결제 수단 변경은 쿡킷, 고객센터 모두 불가합니다.</li>';
			html += '<li> 삼성페이 리워즈 정책은 삼성페이 기준으로 적용됩니다.</li>';
			html += '<li> 삼성페이 고객센터 : 1588-7456</li>';
			html += '<li> 신용카드할부는 50,000원 이상만 가능합니다. 무이자 할부 혜택</li>';
			html += '</ul>';
			$("#TextInfo").html(html);
	}
	function paycoPay(){
		$("#TextInfo").show();
		$("#toks").hide();
		$("#kakaoPay").css("color","rgb(87 87 87)");
		$("#kakaoPay").css("border","1px solid black");
		var html ='<p style="font-weight: bold;">페이코 이용안내</p>';
			html += '<ul style="margin-top:-10px; margin-left: 35px;">';
			html += '<li> PAYCO는 온/오프라인 쇼핑은 물론 송금, 멤버쉽 적립까지 가능한 통합서비스입니다.</li>';
			html += '<li> 휴대폰과 카드 명의자가 동일해야 결제 가능하며, 결제금액 제한은 없습니다.</li>';
			html += '<li> 지원카드 : 모든 국내 신용/체크카드</li>';
			html += '<li> 무이자할부는 PAYCO 기준을 따라 적용됩니다.</li>';
			html += '<li> 주문 완료 후 결제 수단 변경은 COOKIT, 고객행복센터 모두 불가합니다.</li>';
			html += '<li>  PAYCO 고객센터 : 1544-6891</li>';
			html += '</ul>';
			$("#TextInfo").html(html);
	}
	function kakaoPay(){
		$("#TextInfo").show();
		$("#toks").hide();
		$("#kakaoPay").css("color","#f2dc00");
		$("#kakaoPay").css("border","3px solid black");
		var html ='<p style="font-weight: bold;">카카오페이 이용안내</p>';
			html += '<ul style="margin-top:-10px; margin-left: 35px;">';
			html += '<li>카카오페이는 카카오톡 내에서 본인명의 신용카드 등록 후 비밀번호만으로 결제할 수 있는 간편 결제 서비스입니다.</li>';
			html += '<li> 지원카드 : 모든 국내 신용/체크카드 (단, 법인(공용) 카드의 경우 결제가 불가합니다.)</li>';
			html += '<li> 무이자할부는 카카오페이 기준으로 적용 됩니다.</li>';
			html += '<li> 결제 증빙내역은 카카오페이 홈페이지에서 확인 가능합니다.(카카오페이 홈 > 설정 > 결제내역)</li>';
			html += '<li> 주문 완료 후 결제 수단 변경은 COOKIT, 고객행복센터 모두 불가합니다.</li>';
			html += '<li> 카카오페이 고객센터 : 1644-7405</li>';
			html += '</ul>';
			$("#TextInfo").html(html);
	}
	function smilePay(){
		$("#TextInfo").show();
		$("#toks").hide();
		$("#kakaoPay").css("color","rgb(87 87 87)");
		$("#kakaoPay").css("border","1px solid black");
		var html ='<p style="font-weight: bold;">스마일페이 이용안내</p>';
			html += '<ul style="margin-top:-10px; margin-left: 35px;">';
			html += '<li>스마일페이는 본인명의 신용카드 / 체크카드 등록 후 비밀번호만으로 결제할 수 있는 간편 결제 서비스입니다.</li>';
			html += '<li> 지원카드 : 모든 국내 신용/체크카드</li>';
			html += '<li> 무이자할부는 스마일페이 기준으로 적용 됩니다.</li>';
			html += '<li> 주문 완료 후 결제 수단 변경은 COOKIT, 고객행복센터 모두 불가합니다.</li>';
			html += '<li> 스마일페이 고객센터 : 1644-0739</li>';
			html += '</ul>';
			$("#TextInfo").html(html);
	}
	function phonePay(){
		$("#TextInfo").show();
		$("#toks").hide();
		$("#kakaoPay").css("color","rgb(87 87 87)");
		$("#kakaoPay").css("border","1px solid black");
		var html ='<p style="font-weight: bold;">휴대폰 결제 이용안내</p>';
			html += '<ul style="margin-top:-10px; margin-left: 35px;">';
			html += '<li>휴대폰 결제는 50만원까지 결제가 가능합니다.</li>';
			html += '<li> 한도문의는 모빌리언스(1600-0534), 다날(1566-3335)로 문의하시길 바랍니다.</li>';
			html += '</ul>';
			$("#TextInfo").html(html);
	}
	function Creditcard(){
		$("#toks").show();
		$("#TextInfo").hide();
		$("#kakaoPay").css("color","rgb(87 87 87)");
		$("#kakaoPay").css("border","1px solid black");
	}
	function AccountTransfer(){
		$("#toks").hide();
		$("#kakaoPay").css("color","rgb(87 87 87)");
		$("#kakaoPay").css("border","1px solid black");
	}
	</script>
</body>
</html>