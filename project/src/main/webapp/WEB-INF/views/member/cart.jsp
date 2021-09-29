<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html lang="ko">

<head>

	<!-- ** Basic Page Needs ** -->
	<meta charset="utf-8">

	<!-- ** Mobile Specific Metas ** -->
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="description" content="Agency HTML Template">
	<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=5.0">
	<meta name="author" content="Themefisher">
	<meta name="generator" content="Themefisher Html5 Agency Template v1.0">
	<title>장바구니</title>
	<link rel="stylesheet" href="/css/cart.css" />
	
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
	.cart-mid {
		width: 10%;
	}
	
	.flex {
		display: flex;
	}
	
	.justify-content-left {
		justify-content: left;
	}
	
	.product_name_div, .product_price_div {
		height: 26px;
	}

<!--기원-->

</style>
</head>
<!-------------------------------------0905작업영역------------------------------------>
<body onload="basket.checkItem();">

	<!-- Header Start -->
	<jsp:include page="../layout/header.jsp"></jsp:include>
	<!-- Header Close -->
	
<!-- 0904작업영역 -->

	<!-- <section class="section blog-wrap bg-white">
		<div class="container">
			<div class="cart_top">
				<input type="checkbox" name="" id=""><label for="">총 1/1개</label>
				<button type="button"><span>선택 삭제</span></button>
				<button type="button"><span>품절/마감 삭제</span></button>
			</div> 기존 백업-->
<div class="main-wrapper ">
	<section class="page-title bg-1">
		<div class="container">
			<div class="row">
				<div class="col-md-12">
					<div class="block text-center">
					<h1 class="text-capitalize mb-4 text-lg">${session_id}님의 CART.</h1>
					<ul class="list-inline">
						<li class="list-inline-item"><a href="index" class="text-white">Home</a></li>
						<li class="list-inline-item"><span class="text-white">/</span></li>
						<li class="list-inline-item"><a href="cart" class="text-white-50">Cart</a></li>
					</ul>
				</div>
			</div>
		</div>
	</div>
</section>

			<!-- item-top -->
			<div class="cart_mid" style="border: 1px solid gray; border-top: 2px solid black;">
			<div class="section_contents">
				<div style="clear: both; position: relative; padding: 25px; border-bottom: 1px solid #ddd;">
					<span style="width:50%; height:45px; line-height:50px; font-weight:bold; color:black; text-align:center; vertical-align:middle; background: rgba(255,156,49,0.2);">장바구니</span>
					<span>&nbsp;▶&nbsp;</span>
					<span style="width:50%; height:45px; line-height:50px; font-weight:bold; color:black; text-align:center; vertical-align:middle;">주문서 작성</span>
					<span>&nbsp;▶&nbsp;</span>
					<span  style="width:50%; height:45px; line-height:50px; font-weight:bold; color:black; text-align:center; vertical-align:middle;">주문완료</span>
				</div>
				<div class="order-cart-count" style=" width: 100%; text-align: left;">
				 </div>
			
<!-- orderform 시작 -->

<form name="orderform" id="orderform" method="post" class="orderform" action="/order/order">
	<!-- <input type="hidden" name="cmd" value="order"> -->
            <div class="basketdiv" id="basket">
                <div class="row head">
                    <div class="subdiv">
                        <div class="check">
                        <input type="checkbox" name="cbx_chkAll" id="cbx_chkAll" checked onclick="checkAll();"></div>
                        <div class="img">이미지</div>
                        <div class="pname">상품명</div>
                    </div>
                    <div class="subdiv">
                        <div class="basketprice">가격</div>
                        <div class="num">수량</div>
                        <div class="sum">합계</div>
                    </div>
                    <div class="subdiv">
    
                        <div class="basketcmd">삭제</div>
                    </div>
                    <div class="split"></div>
                </div>
                

<c:forEach items="${map.list}" var="cartList" varStatus="status">
<!-- forEach 로 장바구니 불러오기 시작 -->
			<div class="row data">
                    <div class="subdiv">
                        <div class="check">
                        
                        <c:if test="${cartList.quantity != 0 }">
     	<!-- 선택 체크박스 --><input type="checkbox" class="checkOne" name="list" id="selected_id${status.count }" value="${cartList.id}" checked>&nbsp;
               			</c:if>
                        <c:if test="${cartList.quantity == 0 }">
     	<!-- 선택 체크박스 --><input type="checkbox" class="checkOne" name="list" id="selected_id${status.count }" value="${cartList.id}" disabled="disabled">&nbsp;
               			</c:if>
               			</div>
               			
                 <!--상품이미지--><div class="img"><img loading="lazy" src="/productPicture/${cartList.picture}" alt="" width="120px" height="80px" class="img-fluid rounded" style="position: relative;"></div>
                        <div class="pname pt-4">
                 <!--상품명--><span>${cartList.product_name}</span>
                        </div>
                    </div>
                    <div class="subdiv">
                        <div class="basketprice"><input type="hidden" name="p_price" id="p_price1" class="p_price" value="${cartList.price }">
				<!--상품가격--><fmt:formatNumber value="${cartList.price}" groupingUsed="true"/>원</div>
                        <div class="num">
                            <div class="updown">
                                <c:if test="${cartList.quantity != 0 }">
                                <span onclick="javascript:basket.changePNum(${status.count});"><i class="fas fa-arrow-alt-circle-down down"></i></span>
                   <!--상품수량--><input type="text" name="p_num${status.count}" id="p_num1" size="2" maxlength="4" class="p_num" value="${cartList.amount}" onkeyup="javascript:basket.changePNum(${status.count});">
                                <span onclick="javascript:basket.changePNum(${status.count});"><i class="fas fa-arrow-alt-circle-up up"></i></span>
                                </c:if>
                                <c:if test="${cartList.quantity == 0 }">
                 <!--남은상품수량--><span style="font-size: 20px;">품절된 상품입니다.</span>
                                </c:if>
                                <br>
                            </div>
                        </div>
               <!--상품합계--><div class="sum"><fmt:formatNumber value="${cartList.price * cartList.amount}" groupingUsed="true"/>원</div>
                    </div>
                    <div class="subdiv">
              <!--상품삭제--><div class="basketcmd"><span class="abutton" onclick="javascript:basket.delOneItem(${status.count});">삭제</span></div>
                    </div>
                </div>
<!-- forEach 로 장바구니 불러오기 끝 -->
</c:forEach>

<!--  

p_num1
p_num2
...........3,4,5,6.....10


 -->







                
                
                
                
                
                
                
                
                <!-- 아래 row data부터 그 아래 주석을 지우면 스크립트 망가짐(구현 전에 만든거라 망함)/ 수정할 예정입니다.+css도 손봐야할듯 0909-->
                <!-- <div class="row data"> -->
                    <!-- <div class="subdiv">
                        <div class="check"><input type="checkbox" name="buy" value="261" checked="" onclick="javascript:basket.checkItem();">&nbsp;</div>
                        <div class="img"><img loading="lazy" src="https://img.cjcookit.com/images/file/product/574/20210422143422697.jpg?RS=120x120" alt="" width="120px" height="80px" class="img-fluid rounded" style="position: relative;"></div>
                        <div class="pname">
                            <span>리얼푸드 파스타 볼로네이즈 2인분 (400g)</span><br><br><br>
                            <p class="sp1">옵션: L / 재고 5개 이상</p>
							<p class="sp1">* 적립금 선할인 미적용 상품(적립만 가능)</p>
                        </div>
                    </div>
                    <div class="subdiv">
                        <div class="basketprice"><input type="hidden" name="p_price" id="p_price2" class="p_price" value="19000">19,000원</div>
                        <div class="num">
                            <div class="updown">
                                <span onclick="javascript:basket.changePNum(2);"><i class="fas fa-arrow-alt-circle-down down"></i></span>
                                <input type="text" name="p_num2" id="p_num2" size="2" maxlength="4" class="p_num" value="1" onkeyup="javascript:basket.changePNum(2);">
                                <span onclick="javascript:basket.changePNum(2);"><i class="fas fa-arrow-alt-circle-up up"></i></span>
                            </div>
                        </div>
                    <div class="sum">19,000원</div>
                    </div>
	                    <div class="subdiv">
	                        <div class="basketcmd"><a href="javascript:void(0)" class="abutton" onclick="javascript:basket.delItem();">삭제</a></div>
	                    </div> 주석 끝-->
                	</div><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
                	<div class="pt-2 pl-4">
            <div class="bigtext right-align sumcount" id="sum_p_num">상품갯수:0개</div>
            <div class="bigtext right-align box blue summoney" id="sum_p_price">합계금액:0원</div>
					<div class="right-align basketrowcmd">
                <span class="abutton" onclick="javascript:basket.delCheckedItem();">선택상품삭제</span>
                
                <span class="abutton" onclick="javascript:basket.delAllItem();">장바구니비우기</span>
            </div><br>
				</div><br>
				<hr>
				<ul class="pl-5">
					<li>전 상품 무료배송입니다.</li>
					<li>2개 이상의 브랜드를 주문하신 경우, 개별 배송됩니다.</li>
					<li>결제 시 각종 할인 적용이 달라질 수 있습니다.</li>
					<li>해외배송 상품은 배송료가 추가로 발생될 수 있습니다.</li>
					<li>장바구니 상품은 최대 1년 보관(비회원 2일)되며 담은 시점과 현재의 판매 가격이 달라질 수 있습니다.</li>
					<li>장바구니에는 최대 100개의 상품을 보관할 수 있으며, 주문당 한번에 주문 가능한 상품수는 100개로 제한됩니다.</li>
					<li>구매 가능 수량이 1개로 제한된 상품은 주문 취소 시, 24시간 내 가상계좌 재주문이 불가합니다.</li>
					<li>수량 제한 상품의 경우, 가상계좌를 통한 주문은 최대 2건까지만 가능합니다.(미입금 주문 기준, 기존 주문 합산)</li>
				</ul>
               <div class="text-center bg-gray p-3">
						<div id="sum_p_price">
							<span>상품금액 0원 + 배송비 ????원 = 총 ??,???원</span>
						</div>
					</div>
                    <input type="submit" value="선택한 상품 주문"> 
		</form>
			
            </div><br>
            <div id="goorder" class="">
                <div class="clear"></div>
                <div class="buttongroup center-align cmd">
                </div>
            </div>
<!-- orderform 끝 -->
            

<!-------------------------------------0905작업영역------------------------------------>
				</div>
				
				
			
			<br>
				

			<!-- item-bottom -->
					

				</div>
			</div>

<!-- 			<div class="cart_bottom mt-5 pt-4 pl-5 pr-5 pb-4 text-center flex justify-content-around"
				style="border-top: 2px solid black; border-bottom: 1px solid gray;">
				<div>
					<div>총 상품금액</div>
					<strong>1000원</strong>
				</div>
				빼기 표시
				<div>
					<span>-</span>
				</div>
				<div>
					<div>총 할인금액</div>
					<strong>1000원</strong>
				</div>
				더하기 표시
				<div>
					<span>+</span>
				</div>
				<div>
					<div>총 배송비</div>
					<strong>1000원</strong>
				</div>
				eq 표시
				<div>
					<span>=</span>
				</div>
				<div>
					<div>총 결제예정금액</div>
					<strong>3000원</strong>
				</div>
			</div> -->
<!-- 		</div>
	</section>
 -->
	<!-- Footer Start -->
	<jsp:include page="../layout/footer.jsp"></jsp:include>
	<!-- Footer Close -->

	<!--Scroll to top-->
	<div id="scroll-to-top" class="scroll-to-top">
		<span class="icon fa fa-angle-up"></span>
	</div>


	<!-- 
Essential Scripts
=====================================-->
	<!-- Main jQuery -->
	<script src="/plugins/jquery/jquery.min.js"></script>
	<script src="http://code.jquery.com/jquery-latest.min.js"></script>
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
	<script src="/js/cart.js"></script>

</body>

</html>